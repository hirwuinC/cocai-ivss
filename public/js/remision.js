jQuery(document).ready(function($) {
	//alert('hola');
	$('#autocomplete').change(function(event) {
		$('#autocomplete2').val("");
		$('#unidades').empty();
		$('#cantis').hide();
		$('#unicant').hide();
		var prod = $('#autocomplete').val();
        var nueva = prod.replace(/ /gi, "@");
		$('#cantidadR').empty();
		$('#cantis').show();
		$('#unicant').show();
		//alert(prod);
		$('#autocomplete2').change(function(event) {
		var marc = $('#autocomplete2').val();
		var marca = marc.replace(/ /gi, "@");

		//alert(nueva); alert(marc);
		$.ajax({
			url: BASE_URL+'/inventario/mercancia/'+nueva+'/'+marca,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			$('#cantis').prop("hidden",false);
			$('#unicant').prop("hidden",false);
			alert(data[0]['id']);
			$('#mercid').empty();
			$('#mercid').val(data[0]['id']);
				$('#unidades').append('<option value="'+data[0]['idUS']+'">'+data[0]['US']+'</option>'+
					'<option selected value="'+data[0]['idUP']+'">'+data[0]['UP']+'</option>'+
					'<option value="'+data[0]['idUC']+'">'+data[0]['UC']+'</option>');
		})	
		
		});
	});
	var idT = $('#tiendae').val();
	//alert(idT);
	$('#tablaremi').DataTable({
            "ajax": BASE_URL+'/inventario/cargaringredientes/'+idT,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
              return '<span  onclick="agregaringrediente('+row['idi']+','+idT+')" class="fa fa-check test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="agregar"></span>'
          }    
       }                 
            ],
            destroy: true,
            responsive: true
        });
	$('#tablaremi_filter').css('float', 'right');
    $('#tablaremi').css("width","100%");

    $('#tablarepo').DataTable({
            "ajax": BASE_URL+'/inventario/cargaringredientes/'+idT,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
              return '<span  onclick="addmerc('+row['idi']+','+idT+')" class="fa fa-check test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="agregar"></span>'
          }    
       }                 
            ],
            destroy: true,
            responsive: true
        });
    
    $('#tablarepo_filter').css('float', 'right');
    $('#tablarepo').css("width","100%");


});

function agregaringrediente(ingrediente,idt){
	//alert(ingrediente);
	$('#mercid').val('');
	$('#mercid').val(ingrediente);
	$.ajax({
		url: BASE_URL+'/receta/mercancia/'+ingrediente,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		//alert(data[0]['nombre']);
		$('#tit').empty();
		$('#tit').append('Solicitar '+data[0]['nombre']+' '+data[0]['marca']);
		$('#unidades').empty();
				$('#unidades').append('<option value="'+data[0]['idUS']+'">'+data[0]['unidadS']+'</option>'+
					'<option selected value="'+data[0]['idUP']+'">'+data[0]['unidadP']+'</option>');	
		});
	
	$('#modalcant').modal('show');
	

}

function addmerc(ingrediente,idt){
	//alert(ingrediente);
	$('#cantidadR').empty();
	$.ajax({
		url: BASE_URL+'/inventario/selectprov/'+ingrediente,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		$('#prove').empty();
		$('#prove').append('<option value="" selected disabled>Seleccione..</option>');
		for (var i = 0; i <= data.length; i++) {
			$('#prove').append('<option value="'+data[i]['id']+'">'+data[i]['nombre']+'</option>');
		}
					
	});
	$('#mercid').val('');
	$('#mercid').val(ingrediente);
	$.ajax({
		url: BASE_URL+'/receta/mercancia/'+ingrediente,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		//alert(data[0]['nombre']);
		$('#tit').empty();
		$('#tit').append('Solicitar '+data[0]['nombre']+' '+data[0]['marca']);
		$('#unidades').empty();
		if (data[0]['idUC'] != data[0]['idUP']) {
			$('#unidades').append('<option value="" selected disabled>Seleccione..</option>'+
					'<option value="'+data[0]['idUC']+'">'+data[0]['unidadC']+'</option>'+
					'<option value="'+data[0]['idUP']+'">'+data[0]['unidadP']+'</option>');
		}else{
			$('#unidades').append('<option value="" selected disabled>Seleccione..</option>'+
					'<option value="'+data[0]['idUP']+'">'+data[0]['unidadP']+'</option>');
		}
					
		});
	
	$('#modalcant').modal('show');
	

}



