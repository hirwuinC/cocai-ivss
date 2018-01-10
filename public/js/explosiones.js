$(document).ready(function() {

    // Order by the grouping
    
  //alert("ok");
  
  $('#fecha_ini').change(function(event) {
    var fecha1 = $('#fecha_ini').val();
    $('#fecha_fin').val(fecha1);//asigno el mismo valor de la fecha de inicio a la fecha final
    $('#fecha_fin').attr('min', fecha1);//limito la fecha final para q el minimo sea la fecha de inicio
    $('#fecha_fin').prop('disabled', false);
    $('#tipoMov').prop('disabled', true);
    $('#motivo').prop('disabled', true);
    $('#tipoMov').val('seleccione');
    $('#tipoMov').val('seleccione');
    $('#motivo').empty();
    load('referencia','motivo',false,false);
    $('#fecha_fin').focus();
  });


    
    $('#consult').click(function(event) {
        $('#load').show();
        var fechaini = $('#fecha_ini').val();
        var fechafin = $('#fecha_fin').val();
        var idt = $('#idudn').val();
        //alert(fechaini); alert(fechafin); alert(idt); 
        explotionrank(fechaini,fechafin,idt);  
     });
     $('#consultaingredientes').click(function(event) {
        $('#load').show();
        var fechaini = $('#fecha_ini').val();
        var fechafin = $('#fecha_fin').val();
        var idt = $('#idudn').val();
        //alert(fechaini); alert(fechafin); alert(idt); 
        explotion(fechaini,fechafin,idt);  
     });       

    $('#expconsulta').trigger('click');

    $('#consolid').click(function(event) {
        
        setTimeout(function() {$('#tablaoculta2').fadeIn(700);$('#tablaoculta').hide();$('#tablaoculta2').prop('hidden', false);}, 100);
    });

    $('#porpro').click(function(event) {
        
        setTimeout(function() {$('#tablaoculta').fadeIn(700);$('#tablaoculta2').hide();$('#tablaoculta').prop('hidden', false);}, 100);
    });

});

 function explotionrank(fechaini,fechafin,idt){
    $('#consultaingredientes').prop('hidden', false);
    $('#consultaingredientes').fadeIn('fast');
    $('#tabsexplotion').slideUp(700);
  //alert(fechaini); alert(fechafin); alert(idt); 
  $('#tablaoculta1').hide();
  
  $('#load').fadeOut(600);
  setTimeout(function() {$('#tablaoculta1').fadeIn(700);$('#tablaoculta1').prop('hidden', false)}, 600);

    $('#tablarank').DataTable({
            "ajax": BASE_URL+'/explosion/consultaranking/'+fechaini+'/'+fechafin+'/'+idt,
            "columns": [
                { "data": "codigo_prod" },
                { "data": "producto" },
                { "data": "grupo" },
                { "data": "cantidad" },
                { "data": "monto" },
                { "data": "porcentaje_vta" },
                { "data": "costo" },
                { "data": "costo_total" },
                { "data": "porcentaje_costo" },
                { "data": "fecha_ranking" }
                
            ],
            destroy: true,
            responsive: true
        });
    $('#tablarank').css("width","100%");
 } 

 function explotion(fechaini,fechafin,idt){
  $('#tabsexplotion').slideDown(400);
  $('#tabsexplotion').prop('hidden', false);
  //alert(fechaini); alert(fechafin); alert(idt); 
  $('#porpro').trigger('click');
  $('#tablaoculta').hide();
  $('#tablaoculta2').hide();
  
  $('#load').fadeOut(600);
  $('#consultaingredientes').hide('fast');
  setTimeout(function() {$('#tablaoculta').fadeIn(700);$('#tablaoculta').prop('hidden', false);}, 600);
  

    var table = $('#tablaexplosion').DataTable({
            "ajax": BASE_URL+'/explosion/consultarexplosion/'+fechaini+'/'+fechafin+'/'+idt,
            "columns": [
                { "data": null },
                { "data": "coding" },
                { "data": "ingrediente" },
                { "data": "quantity", 
                    render : function(data, type, row) { 
                        return ''+data+' '+row['abreviatura']
                    }
                },
                { "data": "costo" },
                { "data": "fecha_ranking" },
                { "data": "nombre" }
                
            ],
            "columnDefs": [
                { "visible": false, "targets": 6 }/*,
                { "visible": true, "orderable": false, "targets": [0,1,2,3,4] }*/
            ],
            "order": [[ 6, 'asc' ]],
            "displayLength": 25,
            "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(6, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="6" style="background:#ADD8E6"><b>'+group+'</b></td></tr>'
                    );
 
                    last = group;
                }
            } );
        },
            destroy: true, 
            responsive: true
        });
    $('#tablaexplosion tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === 6 && currentOrder[1] === 'asc' ) {
            table.order( [ 6, 'desc' ] ).draw();
        }
        else {
            table.order( [ 6, 'asc' ] ).draw();
        }
    });
    $('#tablaexplosion').css("width","100%");
    table.on( 'order.dt search.dt', function () {
        table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();

    var t2 = $('#tablaexplosion2').DataTable({
            "ajax": BASE_URL+'/explosion/consultaconsolidada/'+fechaini+'/'+fechafin+'/'+idt,
            "columns": [
                { "data": null },
                { "data": "coding" },
                { "data": "ingrediente" },
                { "data": "quantity", 
                    render : function(data, type, row) { 
                        return ''+data+' '+row['abreviatura']
                    }
                },
                { "data": "costo" },
                { "data": "fecha_ranking" }
                
            ],
            destroy: true,
            responsive: true
        });
    $('#tablaexplosion2').css("width","100%");
    t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
 }

 $(document).ready(function() {
    var codit = $('#codit').val();
    var idt = $('#idudn').val();
    var fecha1 = new Date();
    if(fecha1.getMonth()+1<10){
    mes='0'+(fecha1.getMonth()+1);
    }else{
        mes =fecha1.getMonth()+1;
    } 
    if(fecha1.getDate()<10){
        dia='0'+(fecha1.getDate());
    }else{
        dia =fecha1.getDate();
    }
    //alert(mes); 
    var hoy = (fecha1.getFullYear()+""+(mes)+""+(dia));
    //alert(hoy);
    $.ajax({
        url: BASE_URL+'/explosion/validarcierre/'+hoy+'/'+idt,
        type: 'POST',
        dataType: 'json',
    })
    .done(function(datos) {
        //alert(datos.length);
        if (datos.length>0) {
            $('#expranking').removeAttr('data-toggle', 'tab');
            $('#expranking').removeAttr('href', '#generar');
            $('#tab-r').attr('title', 'Ya se genero la explosion correspondiente al dia en curso');    
            $('#tab-r').css('cursor', 'not-allowed');  
            $('#modalcerrado').modal('show');  
        }else{
            $('#expranking').attr('data-toggle', 'tab');
            $('#expranking').attr('href', '#generar');
        }

    });
    //alert(hoy);
    $.ajax({
        url: BASE_URL+'/explosion/cargarankings/',
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
        $('#cuerpor').empty();
        for (var i = 0; i < data.length; i++) {
        var codigo = new Array();
           codigo.push(data[i].substr(9,4));
           var fecha = new Array();   
           fecha.push(data[i].substr(0,8));
           if (codigo == codit ) {
                $.ajax({
                    url: BASE_URL+'/explosion/validarcierre/'+fecha+'/'+idt,
                    type: 'POST',
                    dataType: 'json',
                })
                .done(function(datos) {
                    for (var j = 0; j < datos.length; j++) {
                        var fechadelete = new Array();   
                        fechadelete.push(datos[j][2].substr(0,10));
                        var fe = new Array();
                        fe.push(fechadelete[j].replace(/-/g,""));
                        var archivo = fe+'-'+codigo+'.txt';
                        //alert(archivo);
                        $.ajax({
                            url: BASE_URL+'/explosion/borrador/'+archivo,
                            type: 'POST',
                            dataType: 'json',
                        })
                        .done(function(data2) {
                            location.reload();
                        })
                        .fail(function(){
                            alert("fallo");
                        })
                    }
                });
           }
           var c=0;
        

                           if (codigo == codit ) {
                            if (fecha!=hoy) {
                                //alert(hoy);
                                var validarankinghoy = '<h5 style="color: red">Aun no ha sido cargado el ranking del dia en curso</h5>';
                            }else{
                                var validarankinghoy = '';
                            }
                            $('#cuerpor').append('<a href="'+BASE_URL+'/explosion/insertarexplosion/'+fecha+'/'+codigo+'/'+idt+'" title="">Ranking de '+fecha+"</a><br>");
                            c++;
                           //alert(fecha);
                            if (c>1) {
                                $('#expranking').click(function(event) {
                                    $('.modaladvertencia').modal('show');
                                });
                            //$('#modaladvertencia').modal('show');              
                            }
                           }
        
    
        
        
           
        }
        $('#cuerpor').append(validarankinghoy);
        

        
        //alert(data[2]);
        
    });

            


 });

 function eliminarprocesados(data,idt,codit){
    
 }