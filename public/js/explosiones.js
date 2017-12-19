$(document).ready(function() {
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
  $('#fecha_fin').change(function(event) {
    var idU = $('#idudn').val();
    var fechaini = $('#fecha_ini').val();
    var fechafin = $('#fecha_fin').val();
    $('#tipoMov').prop('disabled', false);
    $('#motivo').prop('disabled', true);
    $('#tipoMov').val('seleccione');
    $('#tipoMov').focus();
    $('#motivo').empty();
    load('referencia','motivo',false,false);
    $('#botonf').hide();
    $('#botonv').empty();
    $('#botonv').append('<input type="button" class="btn btn-sm btn-outline-primary" id="consult" name="consult" value="Consultar">');
    $('#consult').click(function(event) {
        $('#load').show();
        $('#tablaoculta').show();
        $('#load').prop('hidden', false);
        $('#tablaoculta').prop('hidden', false);
        //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv);
        explotion(fechaini,fechafin,tipomov,motiv,idU,empresa);
  
        
     }); 
  });
  $('#tipoMov').change(function(event) {
    var fechaini = $('#fecha_ini').val();
    var fechafin = $('#fecha_fin').val();
    var tipomov = $('#tipoMov').val();
    var motiv = 'false';
    var idU = $('#idudn').val();
    $('#motivo').prop('disabled', false);
    $('#motivo').empty();
    load('referencia','motivo',false,false);
    $('#motivo').focus();
    $('#botonf').hide();
    $('#botonv').empty();
    $('#botonv').append('<input type="button" class="btn btn-sm btn-outline-primary" id="consult" name="consult" value="Consultar">');
    $('#consult').click(function(event) {
        $('#load').show();
        $('#tablaoculta').show();
        $('#load').prop('hidden', false);
        $('#tablaoculta').prop('hidden', false);
        //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv);
        explotion(fechaini,fechafin,tipomov,motiv,idU,empresa);
  
        
     }); 
  });
    
    $('#consult').click(function(event) {
        $('#load').show();
        var fechaini = $('#fecha_ini').val();
        var fechafin = $('#fecha_fin').val();
        //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv);
        explotion(fechaini,fechafin,tipomov,motiv,idU,empresa);  
     });       

    $('#expconsulta').trigger('click');

});

 function explotion(fechaini,fechafin,tipomov,motiv,idU,empresa){
  //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv); alert(idU);
  $('#tablaoculta').hide();
  $('#load').fadeOut(600);
  setTimeout(function() {$('#tablaoculta').fadeIn(700);}, 600);
  if (idU != 59) {
    $('#tablaexplosion').DataTable({
            "ajax": BASE_URL+'/explosion/consultarexplosion/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU+'/'+empresa,
            "columns": [
                { "data": "mercancia" },
                { "data": "familia" },
                { "data": "tipomov" },
                { "data": "cantidad" },
                { "data": "motivo" },
                { "data": "descripcion" },
                { "data": "hora" },
                { "data": "Nombre" }
                
            ],
            destroy: true,
            responsive: true
        });
    $('#tablaexplosion').css("width","100%");
}else{
    $('#tablaexplosion').DataTable({
            "ajax": BASE_URL+'/explosion/consultarexplosion/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU+'/'+empresa,
            "columns": [
                { "data": "tienda" },
                { "data": "mercancia" },
                { "data": "familia" },
                { "data": "tipomov" },
                { "data": "cantidad" },
                { "data": "motivo" },
                { "data": "descripcion" },
                { "data": "hora" },
                { "data": "Nombre" }
                
            ],
            destroy: true,
            responsive: true
        });
    $('#tablaexplosion').css("width","100%");
}

 }

 $(document).ready(function() {
    var codit = $('#codit').val();
    var idt = $('#idudn').val();
    var fecha1 = new Date();
    var hoy = (fecha1.getFullYear()+""+(fecha1.getMonth()+1)+""+fecha1.getDate());
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
        var c=0;
        for (var i = 0; i < data.length; i++) {
           var codigo = new Array();
           codigo.push(data[i].substr(9,4));
           var fecha = new Array();   
           fecha.push(data[i].substr(0,8));

           if (codigo == codit ) {
            if (fecha!=hoy) {
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