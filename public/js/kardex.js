$(document).ready(function() {
  //alert("ok");
    var tienda = $('#idt').val();
    load('mercancia','products',tienda,false);
  $('#fecha_ini').change(function(event) {
    var fecha1 = $('#fecha_ini').val();
    $('#fecha_fin').val(fecha1);//asigno el mismo valor de la fecha de inicio a la fecha final
    $('#fecha_fin').attr('min', fecha1);//limito la fecha final para q el minimo sea la fecha de inicio
    $('#fecha_fin').prop('disabled', false);
    $('#tipoMov').prop('disabled', false);
    $('#fecha_fin').focus();
    $('#consult').prop('disabled', false);
    $('#products').prop('disabled', false);
  });
  $('#fecha_fin').change(function(event) {
    $('#tipoMov').focus();
  });
  $('#tipoMov').change(function(event) {
    $('#motivo').prop('disabled', false);
    $('#motivo').empty();
    var tipo = $('#tipoMov').val();
    load('referencia','motivo',tipo,false);
    $('#motivo').focus();
  });

  $('#consult').click(function(event) {
    var idU = $('#idudn').val();
    var prod = $('#products').val();
    var fechaini = $('#fecha_ini').val();
    var fechafin = $('#fecha_fin').val();
    var tipomov = $('#tipoMov').val();
    var motiv = $('#motivo').val();
    if (prod == null) {
      var prod = 'false';
    }else{
      var prod = $('#products').val();
    }

    if (tipomov == null) {
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
  //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv); alert(idU);
  $('#tablaoculta').hide();
  $('#load').fadeOut(600);
  setTimeout(function() {$('#tablaoculta').fadeIn(700);}, 600);
  if (idU != 59) {
    $('#tablakardex').DataTable({
            "ajax": BASE_URL+'/inventario/consultarkardex/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU+'/'+prod,
            "columns": [
                { "data": "mercancia" , className: "tdleft font11" },
                { "data": "familia", className: "tdleft font11"  },
                { "data": "tipomov", className: "tdcenter font11" },
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
                { "data": "motivo", className: "tdcenter font11" },
                /*{ "data": "descripcion", className: "tdleft font11" },*/
                {"data": "fecha" , className: "tdcenter font11",
                  render : function(data, type, row) {
                    return ''+data+'<br> '+row['hora']
                  }
                },
                { "data": "Nombre", className: "tdcenter font11" }
                
            ],
            destroy: true,
            responsive: true
        });
    $('#tablakardex').css("width","100%");
}else{
    $('#tablakardex').DataTable({
            "ajax": BASE_URL+'/inventario/consultarkardex/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU+'/'+prod,
            "columns": [
                { "data": "tienda", className: "tdleft font11" },
                { "data": "mercancia" , className: "tdleft font11" },
                { "data": "familia", className: "tdleft font11"  },
                { "data": "tipomov", className: "tdcenter font11" },
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
                { "data": "motivo", className: "tdcenter font11" },
                /*{ "data": "descripcion", className: "tdleft font11" },*/
                {"data": "fecha" , className: "tdcenter font11",
                  render : function(data, type, row) {
                    return ''+data+'<br> '+row['hora']
                  }
                },
                { "data": "Nombre", className: "tdcenter font11" }
                
            ],
            destroy: true,
            responsive: true
        });
    $('#tablakardex').css("width","100%");
}

 }