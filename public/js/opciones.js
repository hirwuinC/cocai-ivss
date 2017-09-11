$(document).ready(function() {
	//alert('hola');
	$('#dh').click(function(event) {
        $('#datos2').slideToggle(200);
        $('#datos2').prop("hidden", false);
        $(this).find('.buscador').toggleClass('fa-chevron-down fa-chevron-up');
    });
});

function opciones (idsM,idm){
	//alert(idm);
	//$("#new").modal();
	$('#grupos').empty();
	$('#productos').empty();
	$('#grupos').append('<a class="btn btn-sm btn-primary" href="'+BASE_URL+'grupo/inicio/'+idm+'/'+idsM+'">Grupos'+
		'</a>');
	$('#productos').append('<a class="btn btn-sm btn-primary" href="'+BASE_URL+'producto/inicio/'+idm+'/'+idsM+'">Productos'+
		'</a>');

}

function load(tabla,item,valor,model){
		//alert(item);
	var select = $('#'+item);
	//alert(select);
	$.ajax({
		url: BASE_URL+'main/gets/'+tabla+'/'+item+'/'+valor+'/'+model,
		dataType: 'json',
		
		
	})
	.done(function(data) {
		//alert(data[0][0]);
		select.empty();
		select.append('<option selected disabled>Seleccione..</option>');
	for (var i = 0; i < data.length; i++) {

		select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');

	};
		
	})
	.fail(function() {
		alert("Error en el select "+item);
	})
	.always(function() {
			
	});

}

function load2(tabla,item,valor,otro){
		//alert(item);
	var select = $('#'+item);
	//alert(select);
	$.ajax({
		url: BASE_URL+'main/gets/'+tabla+'/'+item+'/'+valor+'/'+otro,
		dataType: 'json',
		
		
	})
	.done(function(data) {
		//alert(data[0][0]);
		select.empty();
		select.append('<option selected disabled>Seleccione..</option>');
	for (var i = 0; i < data.length; i++) {

		select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');

	};
		
	})
	.fail(function() {
		alert("Error en el select "+item);
	})
	.always(function() {
			
	});

}
