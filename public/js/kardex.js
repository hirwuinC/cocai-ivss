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
    var tipomov = 'false';
    var motiv = 'false';
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
        verkardex(fechaini,fechafin,tipomov,motiv,idU);
  
        
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
        verkardex(fechaini,fechafin,tipomov,motiv,idU);
  
        
     }); 
  });
  $('#motivo').change(function(event) {
    var fechaini = $('#fecha_ini').val();
    var fechafin = $('#fecha_fin').val();
    var tipomov = $('#tipoMov').val();
    var motiv = $('#motivo').val();
    var idU = $('#idudn').val();
    $('#botonf').hide();
    $('#botonv').empty();
    $('#botonv').append('<input type="button" class="btn btn-sm btn-outline-primary" id="consult" name="consult" value="Consultar">');
    $('#consult').click(function(event) {
        $('#load').show();
        
        //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv);
        verkardex(fechaini,fechafin,tipomov,motiv,idU);
  
        
     });       
    });
});

 function verkardex(fechaini,fechafin,tipomov,motiv,idU){
  //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv); alert(idU);
  $('#tablaoculta').hide();
  $('#load').fadeOut(600);
  setTimeout(function() {$('#tablaoculta').fadeIn(700);}, 600);
  if (idU != 59) {
    $('#tablakardex').DataTable({
            "ajax": BASE_URL+'/inventario/consultarkardex/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU,
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
    $('#tablakardex').css("width","100%");
}else{
    $('#tablakardex').DataTable({
            "ajax": BASE_URL+'/inventario/consultarkardex/'+fechaini+'/'+fechafin+'/'+tipomov+'/'+motiv+'/'+idU,
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
    $('#tablakardex').css("width","100%");
}

 }