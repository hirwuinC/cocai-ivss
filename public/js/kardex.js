$(document).ready(function() {
  //alert("ok");
$('.exportar').click(function(event) {
    var idU = $('#idudn').val();
    var fci = $('#fecha_ini').val();
    var fcf = $('#fecha_fin').val();
    var tip = $('#tipomov').val();
    var mot = $('#motivo').val();
    var prd = $('#prod').val();
    if (tip == null && !mot && !prd) {
     // alert(fci)
      pdfinv(idU,fci,fcf);
    }else{
      pdfinv(idU, fci,fcf,tip,mot,prd);
    }
    
  });

    var tienda = $('#idt').val();
    if (tienda.length == 130) {
      var tienda = $('#idudn').val();
    }
    load('mercancia','products',tienda,false);
    $('#idudn').change(function(event) {
      var tienda = $('#idudn').val();
      load('mercancia','products',tienda,false);
    });
  $('#fecha_ini').change(function(event) {
    var fecha1 = $('#fecha_ini').val();
    $('#fecha_fin').val(fecha1);//asigno el mismo valor de la fecha de inicio a la fecha final
    $('#fecha_fin').attr('min', fecha1);//limito la fecha final para q el minimo sea la fecha de inicio
    $('#fecha_fin').prop('disabled', false);
    $('#tipoMov').prop('disabled', false);
    $('#fecha_fin').focus();
    $('#products').prop('disabled', false);
  });
  $('#fecha_fin').change(function(event) {
    $('#tipoMov').focus();
  });
  $('#products').change(function(event) {
    $('#consult').prop('disabled', false);
  });
  $('#tipoMov').change(function(event) {
    $('#motivo').prop('disabled', false);
    $('#motivo').empty();
    var tipo = $('#tipoMov').val();
    if (tipo == 'all') {
      $('#mot').fadeOut('fast');
    }else{
      $('#mot').fadeIn('fast');
      load('referencia','motivo',tipo,false);
    }
    
    $('#motivo').focus();
  });

  $('#consult').click(function(event) {
    var idU = $('#idudn').val();
    var prod = $('#products').val();
    var fechaini = $('#fecha_ini').val();
    var fechafin = $('#fecha_fin').val();
    var tipomov = $('#tipoMov').val();
    var motiv = $('#motivo').val();

    //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv); alert(idU); alert(prod);
    if (prod == null) {
      var prod = 'false';
    }else{
      var prod = $('#products').val();
    }

    if (tipomov == null || tipomov == 'all') {
      var tipomov = 'false';
    }else{
      var tipomov = $('#tipoMov').val();
    }

    if (motiv == null) {
      var motiv = 'false';
    }else{
      var motiv = $('#motivo').val();
    }
        $('#load').show();
        $('#tablaoculta').show();
        $('#load').prop('hidden', false);
        $('#tablaoculta').prop('hidden', false);
        //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv);
        verkardex(fechaini,fechafin,tipomov,motiv,idU,prod);
     }); 
});

 function verkardex(fechaini,fechafin,tipomov,motiv,idU,prod){
 // alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv); alert(idU); alert(prod);
  $('#tablaoculta').hide();
  $('#load').fadeOut(600);
  setTimeout(function() {$('#tablaoculta').fadeIn(700);}, 600);
  var idemp = $('#idemp').val();
  $.ajax({
    url: BASE_URL+'/reportes/consultarkardex/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU+'/'+prod,
    type: 'POST',
    dataType: 'json',
  })
  .done(function(data) {
    var entro = parseFloat(data["data"][0]['entradas']);
    var salio = parseFloat(data["data"][0]['salidas']);
    //alert(salio);
    $('#entra').empty();
    $('#sale').empty();
    var abre = data["data"][0]['abreviatura'];
    $('#unidad').val('');
    $('#unidad').val(abre);
    if (!isNaN(entro)) {
      $('#entra').append(entro.toLocaleString('es-ES', { minimumFractionDigits: 2 })+abre);
    }else{
      $('#entra').append('0,0000');
    }
    if (!isNaN(salio)) {
      $('#sale').append(salio.toLocaleString('es-ES', { minimumFractionDigits: 2 })+abre);
    }else{
      $('#sale').append('0,0000');
    }
    
  });
  if (idemp.length >0) {
    var prueba = BASE_URL+'/reportes/consultarkardex/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU+'/'+prod;
    //alert(prueba)
    $('#tablakardex').DataTable({
            "ajax": BASE_URL+'/reportes/consultarkardex/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU+'/'+prod,
            "columnDefs": [
            {
                "targets": [ 8,9 ],
                "visible": false,
                "searchable": false
            }],
            "columns": [
                { "data": "codigo" , className: "tdleft font11" },
                { "data": "mercancia" , className: "tdleft font11" },
                { "data": "familia", className: "tdleft font11"  },
                {"data": "fecha" , className: "tdcenter font11",
                  render : function(data, type, row) {
                    return ''+data+'<br> '+row['hora']
                  }
                },
                { "data": "tipomov", className: "tdcenter font11" },
                { "data": "motivo", className: "tdcenter font11" },
                {"data": "cantidad" , className: "tdright font11",
                  render : function(data, type, row) {
                    return ''+data+' '+row['abreviatura']
                  }
                },
                {"data": "stock" , className: "tdright font11",
                  render : function(data, type, row) {
                    if (row['existencia']<0) {
                      return '<o style="color: red">'+data+' '+row['abreviatura']+'</o>'
                    }else{
                      return ''+data+' '+row['abreviatura']
                    }
                    
                  }
                },
                /*{ "data": "descripcion", className: "tdleft font11" },*/
                
                { "data": "Nombre", className: "tdcenter font11" },
                {"data": "cant" , className: "tdright font11",
                  render : function(data, type, row) {
                      return ''+data+' '+row['abreviatura']
                  }
                }
                
            ],
            "footerCallback": function ( row, data, start, end, display ) {
            var abre = $('#unidad').val();
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // Total over all pages
            total = api
                .column( 9 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 9, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 7 ).footer() ).html(
                'Existencia total(pagina actual): '+pageTotal.toLocaleString('es-ES', { minimumFractionDigits: 2 }) +abre+' [ Total:'+ total.toLocaleString('es-ES', { minimumFractionDigits: 2 }) +abre+' ]'
            );
            
        },
            destroy: true,
            responsive: true
        });
    $('#tablakardex').css("width","100%");
}else{
    $('#tablakardex').DataTable({
            "ajax": BASE_URL+'/reportes/consultarkardex/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU+'/'+prod,
            "columnDefs": [
            {
                "targets": [ 10 ],
                "visible": false,
                "searchable": false
            }],
            "columns": [
                { "data": "tienda", className: "tdleft font11" },
                { "data": "codigo" , className: "tdleft font11" },
                { "data": "mercancia" , className: "tdleft font11" },
                { "data": "familia", className: "tdleft font11"  },
                {"data": "fecha" , className: "tdcenter font11",
                  render : function(data, type, row) {
                    return ''+data+'<br> '+row['hora']
                  }
                },
                { "data": "tipomov", className: "tdcenter font11" },
                { "data": "motivo", className: "tdcenter font11" },
                {"data": "cantidad" , className: "tdright font11",
                  render : function(data, type, row) {
                    return ''+data+' '+row['abreviatura']
                  }
                },
                {"data": "stock" , className: "tdright font11",
                  render : function(data, type, row) {
                    return ''+data+' '+row['abreviatura']
                  }
                },
                /*{ "data": "descripcion", className: "tdleft font11" },*/
                
                { "data": "Nombre", className: "tdcenter font11" },
                {"data": "cant" , className: "tdright font11",
                  render : function(data, type, row) {
                      return ''+data+' '+row['abreviatura']
                  }
                }
                
            ],
            "footerCallback": function ( row, data, start, end, display ) {
            var abre = $('#unidad').val();
            var api = this.api(), data;
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // Total over all pages
            total = api
                .column( 10 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 10, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 8 ).footer() ).html(
                'Existencia total(pagina actual): '+pageTotal.toLocaleString('es-ES', { minimumFractionDigits: 2 }) +abre+' [ Total: '+ total.toLocaleString('es-ES', { minimumFractionDigits: 2 }) +abre+']'
            );
            
        },
            destroy: true,
            responsive: true
        });
    $('#tablakardex').css("width","100%");
}

 }
 function pdfinv(idU, fci,fcf,tip= false,mot= false,prd= false){
  //alert(fci);
  if (fci == null) {
    fci = 'false';
  }
  if (fcf == null) {
    fcf = 'false';
  }
  if (tip == null) {
    tip = 'false';
  }
    if (mot == null) {
    mot = 'false';
  }
  if (prd == null) {
    prd = 'false';
  }
  var url = BASE_URL+'kardexreport?t='+idU+'&fci='+fci+'&fcf='+fcf+'&tip='+tip+'&mot='+mot+'&prd='+prd;
  abrir_emergente(url);

}
