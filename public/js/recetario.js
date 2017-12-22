jQuery(document).ready(function($) {
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

    function verproductos(modelo){
  	//alert(modelo); 
  $('#tablaoculta').hide();
  $('#load').fadeOut(600);
  setTimeout(function() {$('#tablaoculta').fadeIn(500);$('#tablaoculta').prop("hidden",false);}, 400);
  
    	var moneda = "Bs";
		var t2 =$('#tablaproduct').DataTable({
            "ajax": BASE_URL+'/receta/consultarpro/'+modelo,
            "columns": [
            	{ "data": null, className: "tdcenter"},
                { "data": "codip" , className: "tdleft"},
                { "data": "producto" , className: "tdleft"},
                { "data": "costom" , className: "tdleft",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		} 
            	},
                { "data": "pvpam" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		}
            	},
                { "data": "idrec" , className: "tdcenter",   
	          	render : function(data, type, row) { 
		          	if (data == 'Si') {
		              	return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="vering('+row['idpro']+',999999,'+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+'" id="spanvering"></span>'
		         	}else{ 
		         		return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="creareceta('+row['idpro']+',999999,'+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+'" id="spanvering"></span>'  
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
			         		return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="creareceta(999999,'+row['idi']+','+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+' '+row['ingrediente']+'" ></span>'  
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


 }

 function vering(producto,ingrediente,idrec){
 	$('#idproduct').val("");
 	$('#idproduct').val(producto);
 	$('#iding').val("");
 	$('#iding').val(ingrediente);
 	var moneda = "Bs";
 	//alert(producto);alert(ingrediente);
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

 	});
 	
 	//alert(producto);alert(ingrediente);alert(idrec);
 	
  	$('#tablarecetario').fadeOut(400);
  	setTimeout(function() {$('#recetasysubs').slideDown(300);$('#tablarecetario').prop('hidden',false); $('#tablarecetario').fadeIn(400);$('#recetasysubs').prop('hidden',false);$('html,body').animate({
            scrollTop: $("#tablarecetario").offset().top
        }, 1000);}, 300);
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
              return '<span  onclick="editaring('+row['idi']+')" class="fa fa-edit test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="editar ingrediente"></span>'+
              '<span style="margin-right: 8px; margin-left: 8px; "></span>'+
              '<span  onclick="eliminaring('+producto+','+row['idi']+','+row['idreceta']+')" class="fa fa-trash test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="eliminar '+row['ingrediente']+' de esta receta"></span>'
          }     
       }                 
            ],
            destroy: true,
            responsive: true
        });

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

	 function eliminaring(producto, iding, idreceta){
	 	//alert(iding); alert(producto);
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
		 	$('#botones').append('<button class="btn btn-sm btn-default" value="Cancelar" id="cancelardelete">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary" value="Continuar" onclick="eliminado('+producto+','+iding+','+idreceta+')" id="borra">Continuar</button>  ');
		 	$('#cancelardelete').click(function(event) {
				$('#modaldelete').modal("hide");
			});
	 	});
	 }

	 function eliminado(producto, ingrediente, idreceta){
	 	//alert(producto); alert(ingrediente); alert(idreceta);
	 	$.ajax({
			url: BASE_URL+'/receta/eliminaringrediente/'+producto+'/'+ingrediente+'/'+idreceta,
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
			
			setTimeout(function() {vering(producto,ingrediente,idreceta);$('#mensaje').fadeOut();}, 300);
			
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
	 		//alert(idt);
	 		$('#tablafiltraje').DataTable({
            "ajax": BASE_URL+'/receta/loadingredientes/'+idm,
            "lengthChange": false,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "precioU", className: "tdright"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
              return '<span  onclick="agregaring('+producto+','+ingrediente+','+row['idi']+','+idreceta+')" class="fa fa-check test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="agregar"></span>'
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
			$('#bot').empty();
				$('#unidadmedf').val(data[0]['US']);
				$('#unidadmed').val(data[0]['idUS']);
					
				$('#bot').append('<button class="btn btn-sm btn-default" id="cancelarag">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary"  onclick="agregado('+producto+','+ingrediente+','+iding+','+receta+')" id="agregari" disabled>Agregar</button>  ');
				$('#cancelarag').click(function(event) {
					$('#mcant').modal('hide');
				});
		})
		

	 }

	function agregado(producto,ingrediente,idng,receta){

    	var cantxing = $('#canti').val();
    	var unidad = $('#unidadmed').val();
    	//alert(producto);alert(ingrediente);alert(receta);
		$.ajax({
			url: BASE_URL+'/receta/insertIngrediente/'+producto+'/'+receta+'/'+idng+'/'+cantxing+'/'+unidad,
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
			setTimeout(function() {vering(producto,ingrediente,receta);$('#mensaje').fadeOut();}, 300);
			
			}
			
			
		})
		.fail(function(data){
			alert("fallo");
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
 		$('#modalrec').modal('show');
 		$('#bots').empty();
 		$('#bots').append('<button class="btn btn-sm btn-default" id="cancelarinsert">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary"  onclick="crear('+idpr+','+modelo+','+iding+')" id="agregarec">Agregar</button>  ');
			$('#cancelarinsert').click(function(event) {
			$('#modalrec').modal('hide');
		});
 		

 	})
	
	
	

	}

	 function crear(idproducto,modelo,iding){
	 	//alert(idproducto); alert(modelo);
	 	$.ajax({
 		url: BASE_URL+'/receta/crearreceta/'+idproducto+'/'+modelo+'/'+iding,
            type: 'POST',
            dataType: 'json'
 		})
 		.done(function(data) {
 			$('#modalrec').modal('hide');
 			verproductos(modelo);
 		});
	 }




    	
        