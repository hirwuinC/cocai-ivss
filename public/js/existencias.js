$(document).ready(function() {
	$('#existencia').keyup(function(event) {
		var exist = $('#existencia').val();
		if (exist.length>0) {
			$('#update').prop('disabled', false);
			$('#update').removeClass('btn-outline-primary');
			$('#update').addClass('btn-primary');
		}else{
			$('#update').prop('disabled', true);
			$('#update').addClass('btn-outline-primary');
			$('#update').removeClass('btn-primary');
		}
	});

	$('#update').click(function(event) {
        var stmax = $('#stmax').val();
        var exi = $('#existencia').val();
        if (exi>stmax) {
            $('#modalalerta').modal('show');
        }else{
            $('#sendupdate').trigger('click');
        }
		
	});

    $('#confirmar').click(function(event) {
        $('#sendupdate').trigger('click');
    });

    $('#cancelar').click(function(event) {
        $('#modalalerta').modal('hide');
    });

	$('#formupdate').submit(function(event) {
		event.preventDefault();
        var enlace = $(this).attr('action');
        var formdata = $("#formupdate").serialize();
        $.ajax({
            url: enlace,
            type: 'POST',
            data: formdata,
            dataType: 'json'
        })
        .done(function(data) {
        	$('#datosactualizados').empty();
        	$('#datosactualizados').append('La existencia del producto: '+data[0]['nombre']+' '+data[0]['marca']+' se actualizó de forma exitosa');
            $('#modalalerta').modal('hide');
        	$('#modalexistencia').modal('hide');
        	$('#actualizacionOK').slideDown();
        	$('#actualizacionOK').prop('hidden', false);
        	setTimeout(function(){
                valexistprocess1(data[0]['idt']);
        		$('#actualizacionOK').slideUp('slow');
        	},5000);
        });

	});
});

function existente(idm,idt){
	$.ajax({
        url: BASE_URL+'/existencias/existente/'+idm+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
    	$('#t').empty();
    	$('#t').append('Modificar la existencia del producto: <br>'+data[0]['producto']+' '+data[0]['marca']);
    	$('#stmax').val('');
    	$('#stmax').val(data[0]['stockm2']+' '+data[0]['abreviaturaS']);
    	$('#idpro').val('');
    	$('#idpro').val(data[0]['idP']);
    	$('#umsis').empty();
    	$('#umsis').append(data[0]['abreviaturaS']);
    	$('#modalexistencia').modal('show');
	});
	
}

function valexistprocess1(idt){
    $.ajax({
        url: BASE_URL+'existencias/validarmodulo/'+idt,
        dataType: 'json',
        type: 'POST',
    })
    .done(function(data) {
        if (data.length==0) {
            $('.chargestock').hide();
             window.location=BASE_URL+'index/index/';
        }else{
            location.reload();
        }
    });
}