jQuery(document).ready(function($) {
	//alert("read");
	load('modelo','modelo_id',false);


	
    $('#cantidadxing').change(function(event) {
    	$('#botonG').prop('disabled', false);
    });

    


	$('#modelo_id').change(function(event) {
		var modelo = $('#modelo_id').val();
                     


			$('#botonf').hide();
		    $('#botonv').empty();
		    $('#botonv').append('<input type="button" class="btn btn-sm btn-outline-primary" id="consult" name="consult" value="Consultar">');
			    $('#consult').click(function(event) {
			    	$('#load').show();
			    	$('#load').prop("hidden",false);
			        //alert(fechaini); alert(fechafin); alert(tipomov); alert(motiv);
			        verproductos(modelo);

			    });
	});


});

    function verproductos(modelo){
  	//alert(modelo); 
  $('#tablaoculta').hide();
  $('#load').fadeOut(600);
  setTimeout(function() {$('#tablaoculta').fadeIn(700);$('#tablaoculta').prop("hidden",false);}, 600);
  
    $('#tablaproduct').DataTable({
            "ajax": BASE_URL+'/receta/consultarpro/'+modelo,
            "columns": [
                { "data": "codip" , className: "tdleft"},
                { "data": "producto" , className: "tdleft"},
                { "data": "costo" , className: "tdleft"},
                { "data": "pvpa" , className: "tdright" },
                { "data": "idrec" , className: "tdcenter",
          render : function(data, type, row) {
              return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="vering('+row['idpro']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+'" id="spanvering"></span>'
          }    
       }    
            ],
            destroy: true,
            responsive: true
        });
    $('#tablaproduct').css("width","100%");


 }

 function vering(producto){
 	$('#idproduct').val("");
 	$('#idproduct').val(producto);
 	//alert(producto);
 	$.ajax({
 		url: BASE_URL+'/receta/nombrepro/'+producto,
            type: 'POST',
            dataType: 'json'
 	})
 	.done(function(data) {
 		//alert(data[0]['nombre']);
 		var idp = data[0]['idpr'];
 		var producto = data[0]['producto'];
 		var idr = data[0]['idre'];
 		$('#titulo2').empty();
 		$('#titulo2').append('<b>Receta para '+producto+'</b>');
 		$('#btnagregar').val("");
 		$('#btnagregar').val(idp);
 		$('#enunciado').empty();
 		$('#enunciado').append('<h4>Nuevo ingrediente para '+producto+'</h4>');
 		$('#idrece').val("");
 		$('#idrece').val(idr);

 	})
 	
 	//alert(producto);
 	
  	$('#tablarecetario').fadeOut(400);
  	setTimeout(function() {$('#recetasysubs').slideDown(300);$('#tablarecetario').prop('hidden',false); $('#tablarecetario').fadeIn(400);$('#recetasysubs').prop('hidden',false);}, 300);
 	$('#tablarecetario').DataTable({
            "ajax": BASE_URL+'/receta/consultasp/'+producto,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "cantidad" },
                { "data": "abreviatura" },
                { "data": "precioU", className: "tdright"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
              return '<span  onclick="editaring('+row['idi']+')" class="fa fa-edit test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="editar ingrediente"></span>'+
              '<span style="margin-right: 8px; margin-left: 8px; "></span>'+
              '<span  onclick="eliminaring('+producto+','+row['idi']+','+row['idreceta']+')" class="fa fa-trash test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="eliminar ingrediente de esta receta"></span>'
          }     
       }                 
            ],
            destroy: true,
            responsive: true
        });
    $('#tablarecetario').css("width","100%");
 }

	 function eliminaring(producto, iding, idreceta){
	 	//alert(iding); alert(producto);
	 	$('#botones').empty();
	 	$('#modaldelete').modal("show");
	 	$('#cuerpodelete').empty();
	 	$('#cuerpodelete').append('<p>Usted está por eliminar el ingrediente de esta receta. ¿desea continuar?</p>');
	 	$('#botones').append('<button class="btn btn-sm btn-default" value="Cancelar" id="cancelardelete">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary" value="Continuar" onclick="eliminado('+producto+','+iding+','+idreceta+')" id="borra">Continuar</button>  ');
	 	$('#cancelardelete').click(function(event) {
			$('#modaldelete').modal("hide");
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
			$('#mensaje').empty();
			$('#mensaje').append('<img src="http://localhost/COCAI/public/img/check1.gif" alt="exito"/>');
			$('#mensaje').fadeOut(1000);
			setTimeout(function() {vering(data);}, 1000);
			
		})

	 }

	 jQuery(document).ready(function($) {
	 	$('.filtro').bind("keyup click",function(event) {
	 		//var filtro = $('#filtro').val();
	 		var producto = $('#idproduct').val();
	 		var idreceta = $('#idrece').val();


	 		$('#tablafiltraje').DataTable({
            "ajax": BASE_URL+'/receta/cargaringredientes/',
            "lengthChange": false,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "precioU", className: "tdright"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
              return '<span  onclick="agregaring('+producto+','+row['idi']+','+idreceta+')" class="fa fa-check test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="agregar"></span>'
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


	 });

	 function agregaring(producto,ingrediente,receta){
	 	//alert(producto); alert(ingrediente); alert(receta);
	 	$('#modalcant').modal('show');
	 	$('#unidadmed').empty();
	 	$.ajax({
			url: BASE_URL+'/receta/mercancia/'+ingrediente,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			$('#unidadmed').empty();
			$('#bot').empty();
				$('#unidadmed').append('<option value="'+data[0]['idUS']+'">'+data[0]['US']+'</option>'+
					'<option selected value="'+data[0]['idUP']+'">'+data[0]['UP']+'</option>');
				$('#bot').append('<button class="btn btn-sm btn-default" id="cancelarag">Cancelar</button><span style="margin-right: 1%; margin-left: 1%; "></span><button class="btn btn-sm btn-primary"  onclick="agregado('+producto+','+ingrediente+','+receta+')" id="agregari">Agregar</button>  ');
			$('#cancelarag').click(function(event) {
			$('#modalcant').modal('hide');
		});
		})
		

	 }

	 function agregado(producto,ingrediente,receta){

    	var cantxing = $('#canti').val();
    	var unidad = $('#unidadmed').val();
    	//alert(producto);alert(receta); alert(ingrediente);alert(cantxing); alert(unidad);
		$.ajax({
			url: BASE_URL+'/receta/insertIngrediente/'+producto+'/'+receta+'/'+ingrediente+'/'+cantxing+'/'+unidad,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			if (data == 'duplicado') {
				$('#cuerpoagregar').empty();
				$('#cuerpoagregar').append('<div class="alert alert-danger" style="text-align: left"><i style="float: right; color: black; font-size: 14px" class="fa fa-close" id="equis"></i></a><b>El ingrediente que intenta agregar ya pertenece a esta receta, intente con un ingrediente diferente</b></div>');
				$('#equis').click(function(event) {
					//alert("cerrar");
				$('#modalcant').modal('hide');
		});
			}else{
			$('#modalcant').modal('hide');
			$('#modaling').modal('hide');
			$('#recetasysubs').hide();
			//alert(data.length);
			$('#mensaje').empty();
			$('#mensaje').append('<img src="http://localhost/COCAI/public/img/check1.gif" alt="exito"/>');
			$('#mensaje').fadeOut(1000);
			setTimeout(function() {vering(data);}, 1000);
			}
			
			
		})
		.fail(function(data){
			alert("fallo");
		})


	 }




    	
        