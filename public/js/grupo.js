/*$(document).ready(function() {
	alert('ok');
});*/

function idgrupo(idsM,idm,idg){
	  // setear el id del grupo a la modal de modificar el nombre del mismo
	  //alert(idm);
	  $('#idMo').empty();
	  $('#idSubM').empty();
	  $('#idG').empty();
	  document.getElementById("idSubM").value=idsM;
	  document.getElementById("idMo").value=idm;
	  document.getElementById("idG").value=idg;
	  modificarGrupo(idg);
}

function modificarGrupo(id){

	$('#orden').empty();
	$('#nombre').empty();
	$('#status').empty();
	$.ajax({
	      url: BASE_URL+'/grupo/grupoEditar/'+id,
	      type: 'POST',
	      dataType: 'json',     
	  })
	  .done(function(data) {
	    //alert(data[0][1]);
	  	  $('#orden').append('<label class="control-label" style="float: left;">N.Orden</label>'+
                             '<input type="text" class="form-control" name="orden" value="'+data[0]['ordenNum']+'">');

	      $('#nombre').append('<label class="control-label" style="float: left;">Nombre</label>'+
                              '<input type="text" class="form-control" name="nombre" value="'+data[0]['nombre']+'">');
	      if (data[0]['recetaInactiva'] == '1') {
              gruInactivo = 'Inactivo';
          }else{
              gruInactivo ='Activo';
          }
	      var opcionesGI =['Activo','Inactivo'];
                  for (var y = 0; y < opciones.length; y++) {
                    if (gruInactivo == opcionesGI[y]) {
                      //alert(ocultar);
                      $('#status').append('<option value="'+opcionesGI[y]+'" selected>'+opcionesGI[y]+'</option>');
                    }else{
                     // alert('no');
                      $('#status').append(
                                     '<option value="'+opcionesGI[y]+'">'+opcionesGI[y]+'</option>'
                                    );
                    }
                    
                    
                  }
})
}

function confirmacionDelete(idsm, idm, idp){
  //alert(idp);
$('#alerta').modal('show');
$('#cuerpo').empty();
$('#titulo').empty();
$.ajax({
      url: BASE_URL+'/grupo/nombreProAlert/'+idp,
      type: 'POST',
      dataType: 'json',     
  })
  .done(function(data) {
    //alert(data[0][1]);
  	  $('#titulo').append('<h4>Confirmacion para eliminar.</h4>');
      $('#cuerpo').append('<p style="text-align:justify">Usted esta por eliminar el grupo "'+data[0]['nombre']+'" del sub-modelo "'+data[0]['submodelo']+'. <br><strong style="color:red">Todos los productos perteneciente a este grupo no podran ser utilizados, hasta que no se reasignen a otro grupo.</strong>. <br>Realmente desea continuar?</p><br><br>');
      $('#cuerpo').append(
      '<button class="btn btn-sm btn-success" onclick="eliminarGru('+idsm+','+idm+','+idp+')"><span class="glyphicon glyphicon-ok"></span> Si</button>'+
      '<button class="btn btn-sm btn-danger" onclick="cancelar()"><span class="glyphicon glyphicon-remove"></span> No</button>'
      );
})
}

function cancelar(valor){
  //alert(id);
  if (valor == 1) {
    $('#error').modal('hide');
  }else{
    $('#alerta').modal('hide');
  }


}

function eliminarGru(idsm, idm, idp){


//alert(id);alert(submodelo);alert(grupi);alert(numeroP);alert(estado);
$('#alerta').modal('hide');
  $.ajax({
    url: BASE_URL+'/grupo/delete/'+idsm+'/'+idm+'/'+idp,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
      if (data == true) {
        window.location=BASE_URL+'grupo/inicio/'+idsm+'/'+idm;
      }else{
        window.location=BASE_URL+'grupo/inicio/'+idsm+'/'+idm;
      }
  })
  .fail(function() {
    window.location=BASE_URL+'grupo/inicio/'+idsm+'/'+idm;
  })
  .always(function() {
    console.log("complete");
  }); 
  
}