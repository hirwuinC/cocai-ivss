$(document).ready(function() {
	mostrartablacomprar();
	$('.btncancel').click(function(event) {
		setTimeout(function(){
			window.close();
		},500);

	});

	$('#btn-salir').click(function(event) {
			window.close();
	});

	document.onkeydown = function(e){ 
		var tecla = (document.all) ? e.keyCode : e.which;
		if (tecla == 116) {
			$('.datosFOC').empty();
			$('.datosFOC').append('Disculpe la funcion de recargar la pagina esta deshabilitada en esta seccion');
			$('#FOCnerror').slideDown();
			$('#FOCnerror').prop('hidden', false);
			setTimeout(function(){
				$('#FOCnerror').slideUp();
			},3000);
			return false
			
		}
	}

});