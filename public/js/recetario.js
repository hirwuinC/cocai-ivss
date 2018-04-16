jQuery(document).ready(function($) {

	$('#pcompra').click(function(event) {
		$('#inputpvp').hide();
	});
	$('#pventa').click(function(event) {
		$('#inputpvp').show();
	});

	$('#ayuda1').click(function(event) {
		$('#help1').slideToggle('slow');
		$('#help1').prop('hidden', false);
	});

	//alert("read");
	load('modelo','modelo_id',false);
	$('#pventa').trigger('click');


	
    $('#cantidadxing').change(function(event) {
    	$('#botonG').prop('disabled', false);
    });

    


	$('#modelo_id').change(function(event) {
		var modelo = $('#modelo_id').val();
		$('#modelos').val('');
		$('#modelos').val(modelo);
		$('#tablaoculta').slideUp();

                     


				$('#consult').prop("disabled",false);
			    $('#consult').click(function(event) {
			    	$('#load').show();
			    	$('#load').prop("hidden",false);
			        //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv);
			        verproductos(modelo);

			    });
	});

	$('.nav-link').click(function(event) {
		$('#recetasysubs').hide();
	});


});

	function updateprecio(precio,producto,ingrediente,receid){
		$.ajax({
	 		url: BASE_URL+'/receta/costototal/'+producto+'/'+ingrediente,
	        type: 'POST',
	        dataType: 'json'
	 	})
	 	.done(function(datos) {
	 		var costor = datos[0]['costototal'];
	 		//alert(costor);
	 		$.ajax({
		 		url: BASE_URL+'/receta/updatepvp/'+precio+'/'+producto+'/'+receid+'/'+costor,
		        type: 'POST',
		        dataType: 'json'
		 	})
		 	.done(function(data) {
		 		//alert(data);
		 		$('#np').empty();
		 		$('#np2').empty();
		 		$('#np').append(data[0]['producto']);
		 		$('#np2').append(precio);
		 		$('#actualizado').fadeIn(100);
					$('#actualizado').prop('hidden', false);
					//alert(data[0]['producto']); alert(data[0]['ingrediente']);
					
					setTimeout(function() {$('#consult').trigger('click');vering(producto,ingrediente,receid);$('#actualizado').fadeOut();}, 3000);
		 	});
	 	});
	}

    function verproductos(modelo,producto=false,ingrediente=false,idrec=false){
  	//alert(modelo); 
  	var empresa = $('#idempr').val();
  $('#tablaoculta').hide();
  $('#load').fadeOut(600);
  setTimeout(function() {$('#tablaoculta').fadeIn(500);$('#tablaoculta').prop("hidden",false);}, 400);
  
    	var moneda = $('#monedatienda').val();
		var t2 =$('#tablaproduct').DataTable({
            "ajax": BASE_URL+'/receta/consultarpro/'+modelo,
            "columns": [
            	{ "data": null, className: "tdcenter"},
                { "data": "codip" , className: "tdleft"},
                { "data": "producto" , className: "tdleft"},
                { "data": "costom" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		} 
            	},
            	{ "data": "porcentajec" , className: "tdright"},
                { "data": "pvpam" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		}
            	},
                { "data": "idrec" , className: "tdcenter",   
	          	render : function(data, type, row) { 
		          	if (data == 'Si') {
		              	return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="vering('+row['idpro']+',999999,'+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+' '+row['producto']+'" id="spanvering"></span>'
		         	}else{ 
		         		if (empresa.length ==0) {
		         			return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="creareceta('+row['idpro']+',999999,'+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+' '+row['producto']+'" id="spanvering"></span>'  
		         		}else{
		         			return ''+data+' <span data-toggle="tooltip" data-placement="top"  class="test" style="cursor: default; color: #337ab7"  title="'+row['titulo']+'" id="spanvering"></span>'  
		         		}
		         		
		         	}
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
    $('#tablaproduct').css("width","100%");
    t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();

    
    var t = $('#tablaproductcomp').DataTable({
            "ajax": BASE_URL+'/receta/ingredientesreceta/'+modelo,
            "columns": [
            	{ "data": null, className: "tdcenter"},
                { "data": "codigi" , className: "tdleft"},
                { "data": "ingrediente" , className: "tdleft"},
                { "data": "precioU" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		} 
            	},
                { "data": "idrec" , className: "tdcenter",   
		          	render : function(data, type, row) { 
			          	if (data == 'Si') {
			              	return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="vering(999999,'+row['idi']+','+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+' '+row['ingrediente']+'" ></span>'
			         	}else{ 
			         		if (empresa.length ==0) {
			         		return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="creareceta(999999,'+row['idi']+','+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+' '+row['ingrediente']+'" ></span>'  
			         		}else{
			         			return ''+data+' <span data-toggle="tooltip" data-placement="top"  class="test" style="cursor: default; color: #337ab7"  title="'+row['titulo']+'" id="spanvering"></span>' 
			         		}
			         	}
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
    $('#tablaproductcomp').css("width","100%");
    t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();

    if (producto != false && ingrediente != false && idrec != false) {
  		vering(producto,ingrediente,idrec);
  	}

 }

 function vering(producto,ingrediente,idrec){
 	$('#idproduct').val("");
 	$('#idproduct').val(producto);
 	$('#iding').val("");
 	$('#iding').val(ingrediente);
 	var moneda = $('#monedatienda').val();
 	var empresa = $('#idempr').val();
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
 		$('#titulo2').empty();
 		$('#titulo2').append('<b>Receta para '+receta+'</b>');
 		$('#btnagregar').val("");
 		$('#btnagregar').val(idp);
 		$('#enunciado').empty();
 		$('#enunciado').append('<h4>Nuevo ingrediente para '+receta+'</h4>');
 		$('#idrece').val("");
 		$('#idrece').val(idrec);
 		$('#inputpvp').empty();
 		$('#inputpvp').append('<label class="labels">PVP:</label>'+
                                '<div class="input-group" >'+
                                '<input id="pU" type="text" class="form-control form-control-sm pvp" name="pvp" value="'+data[0]['precioU']+'">'+
                                  '<span class="input-group-btn">'+
                                    '<button type="button" class="btn btn-sm btn-outline-primary" id="updatepvp" disabled><i id="iconupdate" class="fa fa-refresh" data-toggle="tooltip" data-placement="top" data-toggle="tooltip" data-placement="top" title="Al hacer click aqui guardara el nuevo precio de venta del producto seleccionado"></i></button>'+
                                  '</span>'+
                                 '</div>');
	 	$('#updatepvp').click(function(event) {
			var precio = $('#pU').val();
			var producto = $('#idproduct').val();
	 		var ingrediente = $('#iding').val();
	 		var receid = $('#idrece').val();
			updateprecio(precio,producto,ingrediente,receid);
		});
 		
	 		$('#pU').keyup(function(event) {
				var pu = $('#pU').val();
				if (pu != data[0]['precioU']) {
					$('#updatepvp').prop('disabled', false);
				}else{
					$('#updatepvp').prop('disabled', true);
					$('#iconupdate').attr('title', 'No se ha modificado el precio');
				}
			});
			$('#pU').number(true, 4, ',', '.');

 		$.ajax({
	 		url: BASE_URL+'/receta/costototal/'+producto+'/'+idrec,
	        type: 'POST',
	        dataType: 'json'
	 	})
	 	.done(function(datos) {
	 		$('#costot').empty();
	 		//alert(datos[0]['pvp']);
	 		var ttl = datos[0]['costot'];
	 		if (ttl == null) {
	 			var totalcosto = false;
	 			var total = false;
	 		}else{
	 			var totalcosto = ttl;
	 			var total = datos[0][0];
	 			if (datos[0]['pvp']) {
		 			var multi = total*100;
		 			$('#parapvp').prop('hidden', false);
		 			var pvp = datos[0]['pvp'];
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
  	if (empresa.length == 0) {
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
                { "data": "costoporcion" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		} 
            	},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          //var ingr = row['ingrediente'].replace(/ /gi, "@");  
          		return '<span  onclick="editaring('+producto+','+ingrediente+','+row['idi']+','+idrec+')" class="fa fa-edit test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="editar '+row['ingrediente']+'"></span>'+
              '<span style="margin-right: 8px; margin-left: 8px; "></span>'+
              '<span  onclick="eliminaring('+producto+','+row['idi']+','+row['idreceta']+','+ingrediente+')" class="fa fa-remove test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="eliminar '+row['ingrediente']+' de esta receta"></span>'+
              '<input type="hidden" id="produ'+row['idi']+'" value="'+row['cantidad']+'"/>'
          	
          	         
          }     
       }                 
            ],
            destroy: true,
            responsive: true
        });
 	}else{
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
                { "data": "costoporcion" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		} 
            	}                 
            ],
            destroy: true,
            responsive: true
        });
 	}

    $('#tablarecetario').css("width","100%");
 }

 	function detaller(idrec,iding){
 		$('#pcompra').trigger('click');

 		var producto = 999999;
 		vering(producto,iding,idrec);


 		/*$('#idrece').val("");
 		$('#idrece').val(idrec);
	 	$.ajax({
	 		url: BASE_URL+'/receta/consultasp/'+producto+'/'+idrec,
	        type: 'POST',
	        dataType: 'json'
	 	})
	 	.done(function(data) {
	 		$('#enunciado2').empty();
	 		$('#enunciado2').append('Receta de: '+data["data"][0]['receta']);
	 		$('#modaling2').modal('show');
	 	})

 		$('#tablasubs').DataTable({
            "ajax": BASE_URL+'/receta/consultasp/'+producto+'/'+idrec,
            "lengthChange": false,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft",
                render : function(data, type, row) {
                	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
                	if (row['receta_id']) {
                		 return '<i style="margin-right: 8px; margin-left: 8px; color: #337ab7">'+data+'</i>'
                	}else{
                		return '<span style="margin-right: 8px; margin-left: 8px; ">'+data+'</span>'	
                	}
                }
            	},
                { "data": "cantidad" },
                { "data": "abreviatura" },
                { "data": "precioU", className: "tdright"}                
            ],
            destroy: true,
            responsive: true
        });
    $('#tablasubs').css("width","100%");*/
 		
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
		 	$('#cuerpodelete').append('<p>Usted está por eliminar el ingrediente '+data[0]['nombre']+' '+data[0]['marca']+' de esta receta. ¿Desea continuar?</p>');
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
		 		var ttl = datos[0]['costototal'];
		 		if (ttl == null) {
		 			var totalcosto = false;
		 			var porcentajec = false;
		 		}else{
		 			var totalcosto = ttl;
		 			var multi = totalcosto*100;
					var pvp = datos[0]['pvp'];
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

	 jQuery(document).ready(function($) {
	 	$('#dh').click(function(event) {
	 		$('#hidetab').slideToggle();
	 	});
	 	$('.filtro').bind("keyup click",function(event) {
	 		//var filtro = $('#filtro').val();
	 		var producto = $('#idproduct').val();
	 		var ingrediente = $('#iding').val();
	 		var idreceta = $('#idrece').val();
	 		var idm = $('#modelos').val();
	 		var idt = $('#idtienda').val();
	 		//alert(idt);
	 		$('#tablafiltraje').DataTable({
            "ajax": BASE_URL+'/receta/loadingredientes/'+idt,
            "lengthChange": false,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "precioU", className: "tdright"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
              return '<span  onclick="agregaring('+producto+','+ingrediente+','+row['idi']+','+idreceta+')" class="test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="agregar '+row['ingrediente']+'">Agregar</span>'
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
	 		
	 		
	 	});
	 	$('#canti').keyup(function(event) {
	 		var c = $('#canti').val();
	 	if (c.length>0) {
	 		$('#agregari').prop('disabled', false);
	 	}else{
	 		$('#agregari').prop('disabled', true);
	 	}
	 	});
	 	

	 });

	 function agregaring(producto,ingrediente,iding,receta){
	 	$('#cuerpoagregar').empty();
	 	$('#canti').val('');
	 	//alert(producto); alert(ingrediente); alert(receta);
	 	$('#canti').number(true, 4, ',', '.');
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
					
				$('#bot').append('<button class="btn btn-sm btn-default" id="cancelarag">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary"  onclick="agregado('+producto+','+ingrediente+','+iding+','+receta+')" id="agregari" disabled>Agregar</button>  ');
				$('#cancelarag').click(function(event) {
					$('#mcant').modal('hide');
				});
		})
		

	 }

	 function editaring(producto,ingrediente,iding,receta){
	 	var cant = $('#produ'+iding).val();
	 	$('#cuerpoagregar').empty();
	 	$('#canti').val('');
	 	$('#canti').number(true, 4, ',', '.');
	 	$('#canti').val(cant);
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
			$('#tmcant').append('Editar cantidad de '+data[0]['nombre']+' '+data[0]['marca']+'');
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
	 		var ttl = datos[0]['costototal'];
	 		if (ttl == null) {
	 			var totalcosto = false;
	 		}else{
	 			var totalcosto = ttl;
	 		}
	 		var multi = totalcosto*100;
			var pvp = datos[0]['pvp'];
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

	function agregado(producto,ingrediente,iding,receta){

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
	 		var ttl = datos[0]['costototal'];
	 		if (ttl == null) {
	 			var totalcosto = false;
	 		}else{
	 			var totalcosto = ttl;
	 		}
	 		var multi = totalcosto*100;
			var pvp = datos[0]['pvp'];
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

	function creareceta(producto,ingrediente){
	//alert(producto);alert(ingrediente);
	var modelo = $('#modelo_id').val();
	var iding = ingrediente;
	var idpr = producto;
	$.ajax({
 		url: BASE_URL+'/receta/nombrepro/'+producto+'/'+ingrediente,
        type: 'POST',
        dataType: 'json'
 	})
 	.done(function(data) {
 		//alert(data[0]['nombre']);
 		var nombrep = data[0]['producto'];
 		if (data[0]['marca']) {
 			var marca = data[0]['marca'];
 		}else{
 			var marca = '';
 		}
 		
 		$('#cuerpo').empty();
 		$('#cuerpo').append('<h4>Desea crear una receta para '+nombrep+' '+marca+'?</h4>');
 		$('#rendimiento').number(true, 4, ',', '.');
 			
 		load('unidad_medida','umr',false,99);

 		$('#ayuda2').click(function(event) {
 			$('#help2').fadeToggle(500);
 			$('#help2').prop('hidden', false);
 		});

 		$('#umr').change(function(event) {
 			var rendimiento = $('#rendimiento').val();
 			if (rendimiento.length ==0 || rendimiento ==0){
	      	$('#agregarec').prop('disabled', true);
		    }else{
		    	$('#agregarec').prop('disabled', false);
		    }
 		});

 		$('#rendimiento').keyup(function(event) {
 			var rendimiento = $('#rendimiento').val();
 			var umr = $('#umr').val();
 			if (rendimiento.length ==0 || rendimiento ==0 || !umr){
		      	$('#agregarec').prop('disabled', true);
		    }else{
		    	$('#agregarec').prop('disabled', false);
		    }
 		});

 		/*$('#rendimiento').change(function(event) {
 			var cant = $('#rendimiento').val();
 		validarSiNumero(cant);
 		});*/
 		$('#modalrec').modal('show');
 		$('#bots').empty();
 		$('#bots').append('<button class="btn btn-sm btn-default" id="cancelarinsert">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary"  onclick="crear('+idpr+','+modelo+','+iding+')" id="agregarec" disabled>Agregar</button>  ');
			$('#cancelarinsert').click(function(event) {
			$('#modalrec').modal('hide');
		});
 		

 	});
	
	
	

	}

	function validarSiNumero(numero){
	    if (!/^([0-9])*$/.test(numero)){
	      	$('#agregarec').prop('disabled', true);
	    }else{
	    	$('#agregarec').prop('disabled', false);
	    }
	}

	 function crear(idproducto,modelo,iding){
	 	var rinde = $('#rendimiento').val();
	 	var umr = $('#umr').val()
	 	//alert(idproducto); alert(modelo);
	 	$.ajax({
 		url: BASE_URL+'/receta/crearreceta/'+idproducto+'/'+modelo+'/'+iding+'/'+rinde+'/'+umr,
            type: 'POST',
            dataType: 'json'
 		})
 		.done(function(data) {
 			
 			var idrec = data;
 			$('#modalrec').modal('hide');
 			verproductos(modelo,idproducto,iding,idrec);
 		});
	 }




    	
        