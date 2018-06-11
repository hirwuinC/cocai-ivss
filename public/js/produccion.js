$(document).ready(function() {
	var tienda = $('#idtienda').val();
	load('mercancia','semiterminados',tienda);
	$('#semit').trigger('click'),
	consultaproducciones();

	$('#semiterminados').change(function(event) {
		var texto = $('#semiterminados option:selected').text();
		var idmer = $('#semiterminados').val();
		$('#rec').attr('data-toggle', 'tab');
		$('#rec').attr('href', '#recetassemi');
		$('#rec').css('cursor', 'hand');
		$('#tooltiprec').attr('data-original-title', 'Consultar la receta del producto seleccionado');
		$('#selectedpro').empty();
		$('#selectedpro').append('<o class="ml-1">Producto seleccionado: '+texto+'</o>');
		$.ajax({
	 		url: BASE_URL+'/produccion/nombreing/'+idmer,
	        type: 'POST',
	        dataType: 'json'
	 	})
	 	.done(function(data) {
	 		$('#ttanda').fadeOut('fast');
	 		var idreceta = data[0]['idre'];
	 		var producto = 999999;
	 		var reideal = data[0]['reideal'];
	 		var rendimiento = data[0]['rendimiento'];
	 		var abreviatura = data[0]['abreviatura'];
	 		var tandas = $('#tandas').val();
	 		$('#infrece').empty();
	 		$('#infrece').append(reideal+' '+abreviatura+' de '+texto);
	 		$('.excel').removeAttr('data-original-title');
	 		$('.excel').attr('data-original-title', 'Exportar receta para '+tandas+' '+texto);
	 		$('#idrecetas').val('');
	 		$('#idrecetas').val(idreceta);
	 		$('#idmercancia').val('');
	 		$('#idmercancia').val(idmer);
	 		$('#idrecetas').val('');
	 		$('#idrecetas').val(idreceta);
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
			datosdelsemi(tienda,idmer);
			validaciontandas();
			vering(producto,idmer,idreceta);
			consultaproducciones(0,idmer);
			tablatandas(idreceta);
		});
		
	});
	$('#semit').click(function(event) {
		$('#recetassemi').hide();
		$('#consults').hide();
		$('#form-crear').show();
		$('#form-crear').prop('hidden', false);
		$('#selectedpro').show();
	});
	$('#consultas').click(function(event) {
		$('#recetassemi').hide();
		$('#form-crear').hide();
		$('#form-crear').prop('hidden', false);
		$('#consults').show();
		$('#consults').prop('hidden', false);
		
	});
	$('#rec').click(function(event) {
		var href = $(this).attr('href');
		if (href) {
			$('#form-crear').hide();
			$('#consults').hide();
			$('#titulo2').empty();
			$('#recetassemi').show();
			$('#selectedpro').show();
			$('#recetassemi').prop('hidden', false);
		}
		
	});

	$('#rreal').keyup(function(event) {
		$('#ttanda').fadeOut('fast');
		var idrece = $('#idrecetas').val();	
		tablatandas(idrece);
	});

	$('#tandas').change(function(event) {
		var tandas = $('#tandas').val();
		var texto = $('#semiterminados option:selected').text();
		$('#tanda').val('');
		$('#tanda').val(tandas);
		var rendimiento = $('#rendimiento').val();
		var ri = tandas*rendimiento;
		$('#rideal').val('');
	 	$('#rideal').val(ri);
	 	$('#rideal').number(true, 4, ',', '.');
	 	$('#rreal').focus();
	 	$('.excel').removeAttr('data-original-title');
	 	$('.excel').attr('data-original-title', 'Exportar receta para '+tandas+' '+texto);
	 	validaciontandas();
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
	 			$('#produccionOK').slideDown();
	 			$('#produccionOK').prop('hidden', false);
	 			setTimeout(function() {$('#produccionOK').slideUp(500);}, 6000);
	 		}
	 	})
	 	.fail(function(datos){
	 		$('#datosproduccion2').empty();
 			$('#datosproduccion2').append('<center>Ocurrió un error al intentar cargar la produccion de '+rendimiento+' '+abreviatura+' de '+texto+'<br>'+
 				'<h5>Por favor intente realizar el proceso nuevamente.</h5></center>');
 			$('#produccionerror').slideDown();
 			$('#produccionerror').prop('hidden', false);
 			setTimeout(function() {$('#produccionerror').slideUp(500);}, 6000);
	 	});
	});

		$('.excel').click(function(event) {
			$('#btnform2').trigger('click');
		});

		$('#form-print').submit(function(event) {
			//event.preventDefault();
			$('.exporting').slideDown();
			$('.exporting').prop('hidden', false);
			$('html,body').animate({
            scrollTop: $(".exporting").offset().top
        }, 1500);
	  		setTimeout(function(){
	       $('.exporting').fadeOut();
	      }, 4000);
		});
	  	
		$('#btn-filtro').click(function(event) {
			$('#load').fadeIn();
			$('#load').prop('hidden', false);
			$('#tablaoculta2').fadeOut();
			consultaproducciones();
		});

});

	function datosdelsemi(idt,idsemi){
		var moneda = $('#monedatienda').val();
		$.ajax({
            url: BASE_URL+'/produccion/datosdelsemi/'+idt+'/'+idsemi,
            type: 'POST',
            dataType: 'json'
        })
      	.done(function(data) {
      		if (data != false) {
      			$('#stock').empty();
      			$('#stock').append(data['stock']+' '+data['abreviaturaS']);
      			$('#cost').empty();
      			$('#cost').append(data['costom']+' '+moneda);
      			$('#tabledatos').show();
      			$('#tabledatos').prop('hidden', false);
      		}else{
      			alert('Error en los datos del semi terminado');
      		}
      	});
	}

	function validaciontandas(){
		var idt = $('#idtienda').val();
		var tandas = $('#tandas').val();
		var idpro = $('#semiterminados').val();
		var idr = $('#idrecetas').val();
		$.ajax({
            url: BASE_URL+'/produccion/validarproduccion/'+idt+'/'+tandas+'/'+idpro+'/'+idr,
            type: 'POST',
            dataType: 'json'
        })
      	.done(function(data) {
      		if (data != 1) {
      			//data = 1: cantidad a mermar no valida por que es mayor a la existencia 
      			$('#validado').empty();
      			$('#validado').append(data[0]['nombre']+' '+data[0]['marca']);
      			$('#btngenerar').prop('disabled', true);
      			$('#alert-stmin').slideDown();
      			$('#alert-stmin').prop('hidden', false);
      		}else{
      			$('#alert-stmin').slideUp();
      			$('#btngenerar').prop('disabled', false);
      		}
		});
	}

	function consultaproducciones(reversado=false,idmer=false){
		if (reversado == 1) {
			var rev = 1; 
		}else{
			var rev = 0;
		}
  	$('#load').fadeOut(400);
  	setTimeout(function() {$('#tablaoculta2').fadeIn(500);$('#tablaoculta2').prop("hidden",false);}, 800);
		var idt = $('#idtienda').val();
		if (idmer != false) {
			var ing = idmer;
			$('#selectedpro').show();
			$('#colbtn').fadeIn();
		}else{
			var ing = 999999;
			$('#selectedpro').fadeOut();
			$('#colbtn').fadeOut();
		}
		var t2 = $('#producidos').DataTable({
            "ajax": BASE_URL+'/produccion/consultas/'+idt+'/'+ing+'/'+rev,
            "columns": [
            	{ "data": null, className: "tdcenter"},
                { "data": "codigi" , className: "tdleft"},
                { "data": "mercancia" , className: "tdleft"},
                { "data": "marca" , className: "tdleft"},
                { "data": "cantidad" , className: "tdright"},
            	{ "data": "rendimiento_ideal" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['abums']
		       		}
            	},
                { "data": "resultante" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['abums']
		       		}
            	},
            	{ "data": "fecha" , className: "tdleft"}, 
                { "data": "idproduccion" , className: "tdcenter",   
	          	render : function(data, type, row) { 
		              	return '<span  onclick="reversarproduccion('+idt+','+data+','+row['idi']+','+row['idreceta']+')" class="fa fa-remove test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="Deshacer la produccion de '+row['ingrediente']+'"></span>'+
		              	'<input type="hidden" id="ing'+row['idi']+'" value="'+row['ingrediente']+'"/>'
		         	
	       		} 
   				}
   				  
            ],
            "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
                } ],
                "order": [[ 1, 'asc' ]],
            destroy: true,
            responsive: true,

        });
    $('#producidos').css("width","100%");
    t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
		
	}

	function reversarproduccion(idt,idproduccion,idm,idr){
		$('#idp').val('');
		$('#idp').val(idproduccion);
		$('#idm').val('');
		$('#idm').val(idm);
		$('#idr').val('');
		$('#idr').val(idr);
		var text = $('#ing'+idm).val();
		$('.rev').empty();
		$('.rev').append(text);
		$('#modalreversarp').modal('show');
	}

	$(document).ready(function() {
		$('#reversar').click(function(event) {
		var idt = $('#idtienda').val();
		var idproduccion = $('#idp').val();
		var idm = $('#idm').val();
		var mot = $('#motivoreverso').val();
      	var motivo = mot.replace(/ /g, "@");
      	var idr = $('#idr').val();
		$.ajax({
			url: BASE_URL+'/produccion/reversarproduccion/'+idt+'/'+idproduccion+'/'+idm+'/'+idr+'/'+motivo,
	        type: 'POST',
	        dataType: 'json'
		})
	    .done(function(data) {
	    	$('#modalreversarp').modal('hide');
 			$('#reversada').slideDown();
 			$('#reversada').prop('hidden', false);
 			setTimeout(function() {$('#reversada').slideUp(500);consultaproducciones();}, 6000);
	    })
	    .fail(function(data){
	    	$('#modalreversarp').modal('hide');
 			$('#errorreversar').slideDown();
 			$('#errorreversar').prop('hidden', false);
 			setTimeout(function() {$('#errorreversar').slideUp(500);}, 6000);
	 	});
	});

		$('#btn-rev').click(function(event) {
			var valor = $('#btn-rev').val();
			if (valor == 1) {
				$('#btn-rev').val('');
				$('#btn-rev').val(2);
				$('#btn-rev').text('Consultar producciones');
				$('#btn-rev').removeClass('btn-outline-danger');
				$('#btn-rev').addClass('btn-outline-primary');
				consultaproducciones(1);
			}else{
				$('#btn-rev').val('');
				$('#btn-rev').val(1);
				$('#btn-rev').text('Consultar reversos');
				$('#btn-rev').addClass('btn-outline-danger');
				$('#btn-rev').removeClass('btn-outline-primary');
				consultaproducciones();
			}
		});

		$('#close-alert').click(function(event) {
			$('#alert-stmin').slideUp();
		});
	});

	function tablatandas(idreceta){
		var rreal = $('#rreal').val();
		var idt = $('#idtienda').val();
		var moneda = $('#monedatienda').val();
		$.ajax({
			url: BASE_URL+'/produccion/costoentanda/'+idreceta+'/'+rreal+'/'+idt,
	        type: 'POST',
	        dataType: 'json'
		})
	    .done(function(data) {
			var t2 = $('#tablatanda').DataTable({
            "ajax": BASE_URL+'/produccion/costoentanda/'+idreceta+'/'+rreal+'/'+idt,
            "columns": [
            	{ "data": null, className: "tdcenter"},
                { "data": "codigo" , className: "tdleft"},
                { "data": "producto" , className: "tdleft",
                	render: function(data, type, row){
                		return ''+data+' '+row['marca']
                	}
            	},
                { "data": "stock" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['abreviaturasis']
		       		}
            	},
            	{ "data": "cantidad" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['abreviatura']
		       		}
            	},
            	{ "data": "costoing" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['abreviatura']
		       		}
            	},
            	{ "data": "costoporcion" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		}
            	},
            	{ "data": "costotanda" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		}
            	},
            	{ "data": "cantreq" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['abreviatura']
		       		}
            	}  
            ],
            "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
                } ],
                "order": [[ 1, 'asc' ]],
            destroy: true,
            responsive: true,

        });
			$('#costototalT').empty();
			$('#costototalT').append(data["data"][0]['totaltanda']+' '+moneda);
		    $('#tablatanda').css("width","100%");
		    t2.on( 'order.dt search.dt', function () {
		        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		            cell.innerHTML = i+1;
		        } );
		    } ).draw();
		    $('#tablatanda_wrapper').removeClass('container-fluid');
		    setTimeout(function(){
		    	$('#ttanda').fadeIn();
				$('#ttanda').prop('hidden', false);
		    },500);
		    
		});
		
	}