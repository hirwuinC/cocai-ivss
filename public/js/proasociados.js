$(document).ready(function() {
	$('#asoci').click(function(event) {
		$('#modaling').modal({backdrop: 'static', keyboard: false});
	});

	$('#unidad_mp').change(function(event) {
		var umpr = $('#unidad_mp').val();
		$('#unidad_medida_pr').val(umpr);
	});

	$('#unidad_ms').change(function(event) {
		var umsi = $('#unidad_ms').val();
		$('#unidad_medida_s').val(umsi);
		$.ajax({
            url: BASE_URL+'/inventario/setunidadT/'+umsi,
            type: 'POST',
            dataType: 'json'
          })
        .done(function(data) {
            document.getElementById("formulas").value=data[0]['abreviatura']+' * ';
        });
	});


	$('.cerrar').click(function(event) {
		$("input:checkbox").prop('checked',false);
		$.ajax({
			url: BASE_URL+'/inventario/vaciarsesion/',
            type: 'POST',
            dataType: 'json'
		})
         .done(function(data) {
         	$('#botonG').prop('disabled', data);
         	$('#recetasysubs').fadeOut(400);
         });
	});

	$('#bcontinuar').click(function(event) {
		/* consultar la variable de sesion hacer unset[0], montar tabla en base a esta consulta y habilitar boton*/
		/*$.ajax({
			url: BASE_URL+'/inventario/datosasoc/',
            type: 'POST',
            dataType: 'json'
		})
         .done(function(data) {
         	alert(data[0]['id']);
         });*/
    $('#botonG').prop('disabled', false);
    $('#tablarecetario').fadeOut(400);
         $('#tablarecetario').DataTable({
            "ajax": BASE_URL+'/inventario/datosasoc/',
            "lengthChange": false,
            "columns": [
                { "data": "codigo", className: "tdleft"},
                { "data": "nombre" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['marca']
		       		} 
            	},
      			{ "data": "stock", className: "tdright"},
                { "data": 'ums' , className: "tdcenter"},
                { "data": 'costo' , className: "tdcenter"},
              
                       
            ],
            destroy: true,
            responsive: true
        });
	 		$('#_10').on( 'click', function () {
			    table.page.len( 10 ).draw();
			} );
		setTimeout(function() {$('#recetasysubs').slideDown(300);$('#tablarecetario').prop('hidden',false); $('#tablarecetario').fadeIn(400);$('#recetasysubs').prop('hidden',false);$('html,body').animate({
            scrollTop: $("#recetasysubs").offset().top
        }, 1000);}, 300);
        $('#modaling').modal('hide');
    	$('#tablarecetario').css("width","100%");
	});
	
	
	$('#tipo_ingrediente').change(function(event) {
		var tipo = $('#tipo_ingrediente option:selected').text();
		if (tipo == 'Asociado') {
			
		$('#asoci').prop('hidden', false);
		$('.simples').fadeOut(500);
		$('.asoc').fadeIn(500);
		$('.asoc').prop('hidden', false);
        $('.agrupado').fadeIn(600);
        $('.agrupado').prop('hidden', false);
	 		var fam = $('#familia').val();
	 		var idt = $('#tienda').val();
	 		//alert(idt);
	 		$('#tablafiltraje').DataTable({
            "ajax": BASE_URL+'/inventario/loadingredientes/'+fam+'/false'+'/'+idt,
            "lengthChange": false,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "costo", className: "tdright"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
               return '<label class="custom-control custom-checkbox" >'+
                                          '<input type="checkbox" class="custom-control-input" name="mercancia[]" id="id'+row['idi']+'" value="'+row['idi']+'" onclick="add('+row['idi']+','+idt+')">'+
                                          '<span class="custom-control-indicator check" ></span>'+
                                        '</label>'
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
	 	//vering(999999,ingrediente,idreceta)
      	}else{
      	$.ajax({
			url: BASE_URL+'/inventario/vaciarsesion/',
            type: 'POST',
            dataType: 'json'
		})
         .done(function(data) {
         	$('#recetasysubs').fadeOut(400);
         	$('.asociated').prop('hidden', true);
      		$('#asoci').prop('hidden', true);
         });
      		
      	}
	});
});


function add(id,idt){
		
		if ($('#id'+id).is(':checked')) {
			var tipo = 1;
		}else{
			var tipo = 2;
		}
		/*alert(id);
		alert(precio);
		alert(ump);
		alert(ums);
		alert(tipo);*/
		$.ajax({
			url: BASE_URL+'/inventario/asociados/'+id+'/'+tipo+'/'+idt,
            type: 'POST',
            dataType: 'json'
		})
         .done(function(data) {
         });


}

