jQuery(document).ready(function($) {
	//alert('hola');
	$('#autocomplete').change(function(event) {
		$('#autocomplete2').val("");
		$('#unidades').empty();
		$('#cantis').hide();
		$('#unicant').hide();
		var prod = $('#autocomplete').val();
		$('#cantidadR').empty();
		$('#cantis').show();
		$('#unicant').show();
		//alert(prod);
		$('#autocomplete2').change(function(event) {
		var marc = $('#autocomplete2').val();
		$.ajax({
			url: BASE_URL+'/inventario/mercancia/'+prod+'/'+marc,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			//alert('+data[0][0]+');
			$('#mercid').empty();
			$('#mercid').val(data[0]['id']);
				$('#unidades').append('<option value="'+data[0]['idUS']+'">'+data[0]['US']+'</option>'+
					'<option selected value="'+data[0]['idUP']+'">'+data[0]['UP']+'</option>'+
					'<option value="'+data[0]['idUC']+'">'+data[0]['UC']+'</option>');
		})	
		
		});
	});
});