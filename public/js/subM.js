$(document).ready(function() {
	//alert('funciona');
	$("#modificar").click(function(event) {	 
		var valor = $('#modificar').val();
		//alert(valor);
		idSubmodelo(valor);	
	});
});

function idSubmodelo(idsM,idm){
	  // setear el id del sub modelo a la modal de modificar el nombre del mismo
	  //alert(idm);
	  $('#idm').empty();
	  $('#idsm').empty();
	  //input del sub modelo
	  document.getElementById("idsm").value=idsM;
	  document.getElementById("idm").value=idm;
}

function confirmacionDelete(idsm, idm){
  //alert(idp);
$('#alerta').modal('show');
$('#cuerpo').empty();
$('#titulo').empty();
$.ajax({
      url: BASE_URL+'/submodelo/nombreProAlert/'+idsm,
      type: 'POST',
      dataType: 'json',     
  })
  .done(function(data) {
    //alert(data[0][1]);
  	  $('#titulo').append('<h4>Confirmacion para eliminar.</h4>');
      $('#cuerpo').append('<p style="text-align:justify">Usted esta por eliminar el sub-modelo "'+data[0]['submodelo']+'" del modelo "'+data[0]['modelo']+'. <br><strong style="color:red">Todos los grupos y productos perteneciente a este sub-modelo no podran ser utilizados, hasta que no se reasignen a otro sub-modelo.</strong>. <br>Realmente desea continuar?</p><br><br>');
      $('#cuerpo').append(
      '<button class="btn btn-sm btn-success" onclick="eliminarSm('+idsm+','+idm+')"><span class="glyphicon glyphicon-ok"></span> Si</button>'+
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

function eliminarSm(idsm, idm){

//alert(idsm);alert(idm);
$('#alerta').modal('hide');
  $.ajax({
    url: BASE_URL+'/submodelo/delete/'+idsm+'/'+idm,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
      if (data == true) {
        window.location=BASE_URL+'submodelo/inicio/'+idm;
      }else{
        window.location=BASE_URL+'submodelo/inicio/'+idm;
      }
  })
  .fail(function() {
    window.location=BASE_URL+'submodelo/inicio/'+idm;
  })
  .always(function() {
    console.log("complete");
  }); 
  
}

