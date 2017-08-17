function verificarN(valor){
	$.ajax({
			url: BASE_URL+'/inventario/notificaciones/'+valor,
			type: 'POST',
			dataType: 'json',
		})
	.done(function(data) {
		//alert("sisi");
		var notif = data.length;
	    $('#notifications').empty();
	    if (notif !=0) {
	    	$('#notifications').css({
	    		'background': '#E02727',
	    		'border-radius': '10px',
	    		'padding': '1% 5%',
	    		'color': 'white',
	    		'font-size': '11px'
	    	});
	    	$('#notifications').append(notif);
		}else{
			$('#notifications').removeAttr( 'style' );
		}
	    notifications(notif,data);
	})
	
}

function notifications(notif,data){
	//alert(data[0][2]);
	
	$('#news').empty();
	var c=1;
	for (var i=0; i <= notif; i++) {
		switch (data[i][2]) {
      		case '126':
      			st = 'Solicitud de remision'
      			break;
      		
      		case '127':
      			st = 'remision Enviada'
      		break;

      		case '128':
      			st = 'Recepcion de remision'
      		break;

      		case '129':
      			st = 'Reposicion de mercancia'
      		break;
      	}
		v=c+ +i;
		$('#news').append('<li>'+
	                            '<a href="'+BASE_URL+'inventario/rpm/'+data[i][2]+'/'+data[i][0]+'/'+data[i][1]+'/'+notif+'"">'+
	                                ''+st+' #'+v+ 
	                            '</a>'+
                            '</li>'
		);


	}
}




