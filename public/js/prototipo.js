$(document).ready(function() {
	$('#alm37').change(function(event) {
		var almacen_id = String($(this).val());
		$('#alm37S').empty();
		$('#imgAlmacen').html('');
		$('#alm37S').append(' <option value="0" selected >Seleccione...</option>');

		for (var i = 0; i < subAlmcenes[almacen_id].length; i++) {
			$('#alm37S').append(' <option value="'+subAlmcenes[almacen_id][i].id+'" >'+subAlmcenes[almacen_id][i].nombre+'</option>');

	}
	}); 

	$('#alm37S').change(function(event) {
		var id = $(this).val();
		if (id!=0) {
			// $('#imgAlmacen').html('<img src="http://localhost/cocaiivss/public/img/'+id+'.png" alt="img" style="margin-top: 0px;width: 500px;" >');
			$('#tituloUbcSAlmacen').show();
			$('#imgAlmacen').html('<center><img src="'+PUBLIC_URL+'/img/'+id+'.png" alt="img" style="margin-top: 20px;margin-bottom:20px;" class="center-block" > </center>');
			
                                                              
		}
	});

	$('.rd').change(function(event){
		var keys = {'mmEs':'mmPl','mmPl':'mmEs'};
		var id = $(this).attr('data-clss');
		$('.ubicacionSa').hide();
		$('.'+id).show();
		$('.ubicacionSa').show();

		$('.'+keys[id]).hide();

	});

});

var subAlmcenes= {
	'1':[{'id':20,'nombre':'B 15'},
	     {'id':22,'nombre':'B 16 Entrada'},
	     {'id':23,'nombre':'B 16 Semisótano'}]
	
};

/*
	#337ab7

*/