$(document).ready(function() {
	load('direccion','estado',false);
	load('proveedor','selectp',false);
	$('#selectp').change(function(event) {
		var prov = $('#selectp').val();
		$('#form-prov').slideDown('fast');
		$('#form-prov').prop('hidden', false);
	});
	$('.house').click(function(event) {
        $('#dir-prov').show();
        $('#casa').show();
        $('#edif').hide();
        $('#edificio').prop('disabled', true);
        $('#intercomunicador').prop('disabled', true);
        $('#casa').prop('disabled', false);
        $('#dir-prov').prop('hidden', false);
        $('#house').prop('hidden', false);
        $('#edif').prop('hidden', false);
        $('#numint').prop('hidden', true);
        $('#ptoref').addClass('col-sm-offset-1');
        $('#ptoref').removeClass('col-sm-offset-0');
    });
    $('#building').click(function(event) {
        $('#dir-prov').show();
        $('#edif').show();
        $('#casa').hide();
        $('#casa').prop('disabled', true);
        $('#edificio').prop('disabled', false);
        $('#intercomunicador').prop('disabled', false);
        $('#dir-prov').prop('hidden', false);
        $('#house').prop('hidden', true);
        $('#edif').prop('hidden', false);
        $('#numint').prop('hidden', false);
        $('#ptoref').addClass('col-sm-offset-0');
        $('#ptoref').removeClass('col-sm-offset-1');
    });

    $('#estado').change(function(event) {
        $("#municipio option[value='Seleccione']").remove();
        var valor = $('#estado').val();
        $('#parroquia').empty();
        
        load('direccion','municipio',valor);
        $('#parroquia').append('<option selected disabled>Seleccione..</option>');
    });


    $('#municipio').change(function(event) {
        $("#parroquia option[value='Seleccione']").remove();
        var valor = $('#municipio').val();
        load('direccion','parroquia',valor);
        
    });
});