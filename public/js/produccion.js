$(document).ready(function() {
	var tienda = $('#idtienda').val();
	load('mercancia','semiterminados',tienda);
	$('#semit').trigger('click'),

	$('#semiterminados').change(function(event) {
		var texto = $('#semiterminados option:selected').text();
		var idmer = $('#semiterminados').val();
		$('#rec').attr('data-toggle', 'tab');
		$('#rec').attr('href', '#recetassemi');
		$('#rec').css('cursor', 'hand');
		$('#tooltiprec').attr('data-original-title', 'Consultar la receta del producto seleccionado');
		$('#selectedpro').empty();
		$('#selectedpro').append('Producto seleccionado: '+texto);
		$.ajax({
	 		url: BASE_URL+'/produccion/nombreing/'+idmer,
	        type: 'POST',
	        dataType: 'json'
	 	})
	 	.done(function(data) {
	 		var idreceta = data[0]['idre'];
	 		var producto = 999999;
	 		var reideal = data[0]['reideal'];
	 		var rendimiento = data[0]['rendimiento'];
	 		var abreviatura = data[0]['abreviatura'];
	 		$('.abrev').empty();
	 		$('.abrev').append(abreviatura);
	 		$('#rideal').val('');
	 		$('#rideal').val(reideal);
	 		$('#rreal').val('');
	 		$('#rreal').val(reideal);
	 		$('#rendimiento').val('');
	 		$('#rendimiento').val(rendimiento);
	 		$('#rreal').number(true, 4, ',', '.');
	 		$('.ocultos').fadeIn();
			$('.ocultos').prop('hidden', false);
			vering(producto,idmer,idreceta);
		});
		
	});
	$('#semit').click(function(event) {
		$('#recetassemi').hide();
		$('#semis').show();
		$('#semis').prop('hidden', false);
	});
	$('#rec').click(function(event) {
		var href = $(this).attr('href');
		if (href) {
			$('#semis').hide();
			$('#titulo2').empty();
			$('#recetassemi').show();
			$('#recetassemi').prop('hidden', false);
		}
		
	});

	$('#tandas').change(function(event) {
		var tandas = $('#tandas').val();
		var rendimiento = $('#rendimiento').val();
		var ri = tandas*rendimiento;
		$('#rideal').val('');
	 	$('#rideal').val(ri);
	 	$('#rideal').number(true, 4, ',', '.');
	 	$('#rreal').focus();
	});

	$('#form-crear').submit(function(event) {
		event.preventDefault();
		var texto = $('#semiterminados option:selected').text();
		var rendimiento = $('#rreal').val();
	 	var abreviatura = $('.abrev:last').text();
		var formdata = $("#form-crear").serialize();
		$.ajax({
	 		url: BASE_URL+'/produccion/crearproduccion/',
	        type: 'POST',
	        data: formdata,
	        dataType: 'json'
	 	})
	 	.done(function(datos) {
	 		if (datos != 'false') {
	 			$('#datosproduccion').empty();
	 			$('#datosproduccion').append('<center>Produccion de '+rendimiento+' '+abreviatura+' de '+texto+' Cargada con exito en sistema</center>');
	 			$('#produccionOK').fadeIn();
	 			$('#produccionOK').prop('hidden', false);
	 			setTimeout(function() {$('#produccionOK').fadeOut(500);}, 6000);
	 		}
	 	})
	 	.fail(function(datos){
	 		$('#datosproduccion2').empty();
 			$('#datosproduccion2').append('<center>Ocurrió un error al intentar cargar la produccion de '+rendimiento+' '+abreviatura+' de '+texto+'<br>'+
 				'<h5>Por favor intente realizar el proceso nuevamente.</h5></center>');
 			$('#produccionerror').fadeIn();
 			$('#produccionerror').prop('hidden', false);
 			setTimeout(function() {$('#produccionerror').fadeOut(500);}, 6000);
	 	});
	});

});