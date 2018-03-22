$(document).ready(function() {
	$('#modaling').modal('show');

	 		var ingrediente = $('#iding').val();
	 		var idreceta = $('#idrece').val();
	 		var fam = $('#fam').val();
	 		//alert(idt);
	 		$('#tablafiltraje').DataTable({
            "ajax": BASE_URL+'/inventario/loadingredientes/'+fam+'/'+ingrediente,
            "lengthChange": false,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "costo", className: "tdright"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
              return '<span  onclick="agregaring('+ingrediente+','+row['idi']+','+idreceta+')" class="test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="agregar '+row['ingrediente']+'">Agregar</span>'
          }    
       }                 
            ],
            destroy: true,
            responsive: true
        });
	 		$('#_10').on( 'click', function () {
			    table.page.len( 10 ).draw();
			} );
    $('#tablafiltraje').css("width","100%");
	 	$('#canti').keyup(function(event) {
	 		var c = $('#canti').val();
	 	if (c.length>0) {
	 		$('#agregari').prop('disabled', false);
	 	}else{
	 		$('#agregari').prop('disabled', true);
	 	}
	 	});
	 	vering(999999,ingrediente,idreceta)
});

function agregaring(ingrediente,iding,receta){
	 	$('#cuerpoagregar').empty();
	 	$('#canti').val('');
	 	//alert(producto); alert(ingrediente); alert(receta);
	 	$('#mcant').modal('show');
	 	$('#unidadmed').empty();
	 	$('#unidadmedf').empty();
	 	$.ajax({
			url: BASE_URL+'/receta/mercancia/'+iding,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			$('#tmcant').empty();
			$('#tmcant').append('Agregar ingrediente');
			$('#unidadmed').empty();
			$('#bot').empty();
				$('#unidadmedf').val(data[0]['US']);
				$('#unidadmed').val(data[0]['idUS']);
					
				$('#bot').append('<button class="btn btn-sm btn-default" id="cancelarag">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary"  onclick="agregado('+ingrediente+','+iding+','+receta+')" id="agregari" disabled>Agregar</button>  ');
				$('#cancelarag').click(function(event) {
					$('#mcant').modal('hide');
				});
		})
		

	 }

	 function agregado(ingrediente,iding,receta){
	 	var producto = 999999;
    	var cantxing = $('#canti').val();
    	var unidad = $('#unidadmed').val();
    	//alert(producto);alert(ingrediente);alert(receta);
		$.ajax({
			url: BASE_URL+'/receta/insertIngrediente/'+producto+'/'+receta+'/'+iding+'/'+cantxing+'/'+unidad,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
		if (data == 'duplicado') {
				$('#cuerpoagregar').empty();
				$('#cuerpoagregar').append('<div class="alert alert-danger" style="text-align: left"><i style="float: right; color: black; font-size: 14px" class="fa fa-close" id="equis"></i></a><b>El ingrediente que intenta agregar ya pertenece a esta receta, intente con un ingrediente diferente</b></div>');
				$('#equis').click(function(event) {
					$('#mcant').modal('hide');
				});
			}else{
			$('#recetasysubs').hide();
			$('#modaling').modal('hide');
			$('#mcant').modal('hide');
			$('#mensaje').fadeIn(100);
			$('#mensaje').prop('hidden', false);
			//alert(data[0]['producto']); alert(data[0]['ingrediente']);
			
			
			}

		$.ajax({
	 		url: BASE_URL+'/receta/costototal/'+producto+'/'+receta,
	        type: 'POST',
	        dataType: 'json'
	 	})
	 	.done(function(datos) {
	 		var ttl = datos[0][0];
	 		if (ttl == null) {
	 			var totalcosto = false;
	 		}else{
	 			var totalcosto = ttl;
	 		}
	 		var multi = totalcosto*100;
			var pvp = datos[0][4];
	 		var porcentajec = multi/pvp;
	 		//alert(totalcosto);
	 			$.ajax({
			 		url: BASE_URL+'/receta/updatecosto/'+producto+'/'+ingrediente+'/'+totalcosto+'/'+porcentajec,
			        type: 'POST',
			        dataType: 'json'
		 		})
			 	.done(function(data2) {
			 		setTimeout(function() {$('#consult').trigger('click');vering(producto,ingrediente,receta);$('#mensaje').fadeOut();}, 300);
			 	});
	 		
	 	});
			
			
		})
		.fail(function(data){
			alert("no se pudo agregar");
		})


	}

	 function editaring(producto,ingrediente,iding,receta){
	 	$('#cuerpoagregar').empty();
	 	$('#canti').val('');
	 	//alert(producto); alert(ingrediente); alert(receta);
	 	$('#mcant').modal('show');
	 	$('#unidadmed').empty();
	 	$('#unidadmedf').empty();
	 	$.ajax({
			url: BASE_URL+'/receta/mercancia/'+iding,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			$('#unidadmed').empty();
			$('#tmcant').empty();
			$('#tmcant').append('Editar ingrediente');
			$('#bot').empty();
				$('#unidadmedf').val(data[0]['US']);
				$('#unidadmed').val(data[0]['idUS']);
					
				$('#bot').append('<button class="btn btn-sm btn-default" id="cancelarag">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary"  onclick="editado('+producto+','+ingrediente+','+iding+','+receta+')" id="agregari" disabled>Agregar</button>  ');
				$('#cancelarag').click(function(event) {
					$('#mcant').modal('hide');
				});
		})
		

	 }

	 function editado(producto,ingrediente,iding,receta){
	 	var cantxing = $('#canti').val();
    	$.ajax({
			url: BASE_URL+'/receta/updateIngrediente/'+producto+'/'+receta+'/'+iding+'/'+cantxing,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			$('#recetasysubs').hide();
			$('#mcant').modal('hide');
			$('#mensaje').fadeIn(100);
			$('#mensaje').prop('hidden', false);
			//alert(data[0]['producto']); alert(data[0]['ingrediente']);

		$.ajax({
	 		url: BASE_URL+'/receta/costototal/'+producto+'/'+receta,
	        type: 'POST',
	        dataType: 'json'
	 	})
	 	.done(function(datos) {
	 		var ttl = datos[0][0];
	 		if (ttl == null) {
	 			var totalcosto = false;
	 		}else{
	 			var totalcosto = ttl;
	 		}
	 		var multi = totalcosto*100;
			var pvp = datos[0][4];
	 		var porcentajec = multi/pvp;
	 		//alert(totalcosto);
	 			$.ajax({
			 		url: BASE_URL+'/receta/updatecosto/'+producto+'/'+ingrediente+'/'+totalcosto+'/'+porcentajec,
			        type: 'POST',
			        dataType: 'json'
		 		})
			 	.done(function(data2) {
			 		setTimeout(function() {$('#consult').trigger('click');vering(producto,ingrediente,receta);$('#mensaje').fadeOut();}, 300);
			 	});
	 		
	 	});
			
			
		})
		.fail(function(data){
			alert("no se pudo agregar");
		});


	 }

	  function vering(producto,ingrediente,idrec){
 	$('#idproduct').val("");
 	$('#idproduct').val(producto);
 	$('#iding').val("");
 	$('#iding').val(ingrediente);
 	var moneda = "Bs";
 	//alert(producto);alert(ingrediente);alert(idrec);
 	$.ajax({
 		url: BASE_URL+'/receta/nombrepro/'+producto+'/'+ingrediente,
            type: 'POST',
            dataType: 'json'
 	})
 	.done(function(data) {
 		//alert(data[0]['nombre']);
 		var idp = data[0]['idpr'];
 		var product = data[0]['producto'];
 		var receta = data[0]['receta'];
 		$('#btnagregar').val("");
 		$('#btnagregar').val(idp);
 		$('#enunciado').empty();
 		$('#enunciado').append('<h4>Nuevo ingrediente para '+receta+'</h4>');
 		$('#idrece').val("");
 		$('#idrece').val(idrec);

 		$.ajax({
	 		url: BASE_URL+'/receta/costototal/'+producto+'/'+idrec,
	        type: 'POST',
	        dataType: 'json'
	 	})
	 	.done(function(datos) {
	 		$('#costot').empty();
	 		var ttl = datos[0][1];
	 		if (ttl == null) {
	 			var totalcosto = false;
	 			var total = false;
	 		}else{
	 			var totalcosto = ttl;
	 			var total = datos[0][0];
	 			if (datos[0][4]) {
		 			var multi = total*100;
		 			$('#parapvp').prop('hidden', false);
		 			var pvp = datos[0][4];
		 			var porcentajec = multi/pvp;
		 			$('#costot').append('<b>Total costo: '+totalcosto+' Bs / % de costo: ['+porcentajec.toLocaleString('es-ES', { maximumFractionDigits: 2 })+']</b>');
		 		}else{
		 			$('#parapvp').prop('hidden', true);
		 			$('#costot').append('<b>Total costo: '+totalcosto+'</b>');
		 		}
	 		}
	 		
	 		//alert(multi);
	 		//alert(data[0][1]);
	 	});	

 	});


 	
 	//alert(producto);alert(ingrediente);alert(idrec);
 	
  	$('#tablarecetario').fadeOut(400);
  	setTimeout(function() {$('#recetasysubs').slideDown(300);$('#tablarecetario').prop('hidden',false); $('#tablarecetario').fadeIn(400);$('#recetasysubs').prop('hidden',false);$('html,body').animate({
            scrollTop: $("#tablarecetario").offset().top
        }, 1000);}, 300);
  	//alert(empresa);
 	$('#tablarecetario').DataTable({
            "ajax": BASE_URL+'/receta/consultasp/'+producto+'/'+idrec,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft",
                render : function(data, type, row) {
                	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
                	if (row['receta_id']) {
                		 return '<i onclick="detaller('+row['receta_id']+','+row['idi']+')" style="margin-right: 8px; margin-left: 8px; cursor: pointer; cursor:hand; color: #337ab7" title="Click para ver receta de '+data+'">'+data+'</i>'
                	}else{
                		return '<span style="margin-right: 8px; margin-left: 8px; ">'+data+'</span>'	
                	}
                }
            	},
                { "data": "cantidad" },
                { "data": "abreviatura" },
                { "data": "costo" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		} 
            	},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          //var ingr = row['ingrediente'].replace(/ /gi, "@");  
          		return '<span  onclick="editaring('+producto+','+ingrediente+','+row['idi']+','+idrec+')" class="fa fa-edit test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="editar '+row['ingrediente']+'"></span>'+
              '<span style="margin-right: 8px; margin-left: 8px; "></span>'+
              '<span  onclick="eliminaring('+producto+','+row['idi']+','+row['idreceta']+','+ingrediente+')" class="fa fa-remove test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="eliminar '+row['ingrediente']+' de esta receta"></span>'
          	
          	         
          }     
       }                 
            ],
            destroy: true,
            responsive: true
        });
 	

    $('#tablarecetario').css("width","100%");
 }

 function eliminaring(producto, iding, idreceta,ingrediente){
	 	//alert(producto); alert(iding); alert(idreceta); alert(ingrediente);
	 	$.ajax({
 		url: BASE_URL+'/receta/mercancia/'+iding,
            type: 'POST',
            dataType: 'json'
	 	})
	 	.done(function(data) {
	 		//alert(data[0]['nombre']);
		 	$('#botones').empty();
		 	$('#modaldelete').modal("show");
		 	$('#cuerpodelete').empty();
		 	$('#cuerpodelete').append('<p>Usted está por eliminar el ingrediente '+data[0]['nombre']+' '+data[0]['marca']+' de este agrupado. ¿Desea continuar?</p>');
		 	$('#botones').append('<button class="btn btn-sm btn-default" value="Cancelar" id="cancelardelete">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary" value="Continuar" onclick="eliminado('+producto+','+iding+','+idreceta+','+ingrediente+')" id="borra">Continuar</button>  ');
		 	$('#cancelardelete').click(function(event) {
				$('#modaldelete').modal("hide");
			});
	 	});
	 }

	 function eliminado(producto, iding, idreceta,ingrediente){
	 	//alert(producto); alert(ingrediente); alert(idreceta);
	 	$.ajax({
			url: BASE_URL+'/receta/eliminaringrediente/'+producto+'/'+iding+'/'+idreceta,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			$('#modaldelete').modal('hide');
			$('#recetasysubs').hide();
			//alert(data.length);
			$('#mensaje').fadeIn(100);
			$('#mensaje').prop('hidden', false);
			//alert(data[0]['producto']); alert(data[0]['ingrediente']);
			$.ajax({
		 		url: BASE_URL+'/receta/costototal/'+producto+'/'+idreceta,
		        type: 'POST',
		        dataType: 'json'
		 	})
		 	.done(function(datos) {
		 		var ttl = datos[0][0];
		 		if (ttl == null) {
		 			var totalcosto = false;
		 			var porcentajec = false;
		 		}else{
		 			var totalcosto = ttl;
		 			var multi = totalcosto*100;
					var pvp = datos[0][4];
		 			var porcentajec = multi/pvp;
		 		}
		 		
		 		//alert(totalcosto);
		 		$.ajax({
			 		url: BASE_URL+'/receta/updatecosto/'+producto+'/'+ingrediente+'/'+totalcosto+'/'+porcentajec,
			        type: 'POST',
			        dataType: 'json'
			 	})
			 	.done(function(data2) {
			 		setTimeout(function() {$('#consult').trigger('click');vering(producto,ingrediente,idreceta);$('#mensaje').fadeOut();}, 300);
			 	});
		 	});
			
			
			
		})

	 }

	