$(document).ready(function() {
	load('referencia','padre_id',13);
	
	setTimeout(function(){
		$("#padre_id option[value='888888']").remove();
		$('#padre_id').append('<option value="888888">Productos de venta</option>');
	},1000);

	setTimeout(function(){
		var cont = $('#padre_id > option').length+1;
		$('#padre_id').attr('size', cont);
	},1000);
	
	var idt = $('#idtienda').val();
	$('#proc').trigger('click');
	DT(1);

	$('#padre_id').change(function(event) {
		var clasificacion = $('#padre_id').val();
		var idt = $('#idtienda').val();
		var texto = $('#padre_id option:selected').text();
		$.ajax({
			url: BASE_URL+'/merma/productos/'+idt+'/'+clasificacion,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			$('#family').empty();
			$('#family').append(texto);
			$('#tablaoculta').hide();
		  	$('#load').fadeOut(600);
		  	setTimeout(function() {$('#tablaoculta').fadeIn(500);$('#tablaoculta').prop("hidden",false);}, 400);
				DT(clasificacion);
		});
	});

	$('#motivo').change(function(event) {
		var motive = $('#motivo option:selected').text();
		if (motive == '[ AGREGAR NUEVO MOTIVO ]') {
			$('#modalnuevoM').modal('show');
		}
		validacion();
	});

	$('#cantidadM').keyup(function(event) {
		validacion();
	});

	$('#mcontinuar').click(function(event) {
      var mot = $('#motive').val();
      var moti = mot.replace(/ /g, "@");
      //alert(moti)
      $.ajax({
            url: BASE_URL+'/merma/agregarmotivo/'+moti,
            type: 'POST',
            dataType: 'json'
          })
      .done(function(data) {
        load('referencia','motivo',121);
        $('#modalnuevoM').modal('hide');
        setTimeout(function() {$('#motivo').val(data);}, 2500);
        
      })
      .fail(function(data) {
        alert("fallo al agregar una nueva sub clasificacion");
        load('referencia','motivo',121);
        $('#modalnuevoM').modal('hide');
      });
      
    });

	$('#mermar').click(function(event) {
		var mot = $('#motivo option:selected').text();
      	var moti = mot.replace(/ /g, "@");
      	var idpro = $('#idpro').val();
      	var tipopro = $('#tipopro').val();
      	var idt = $('#idtienda').val();
      	var cant = $('#cantidadM').val();
      	var tipo = 1;
		$.ajax({
			url: BASE_URL+'/merma/datosmerma/'+idpro+'/'+tipopro+'/'+idt+'/'+moti+'/'+tipo+'/'+cant,
            type: 'POST',
            dataType: 'json'
		})
         .done(function(data) {
		    $('#tablamermar').fadeOut(400);
	        DT2();

         });
    
	});

	$('#cancel').click(function(event) {
		$.ajax({
			url: BASE_URL+'/merma/vaciarsesion/',
            type: 'POST',
            dataType: 'json'
		})
         .done(function(data) {
         	$('#modalcancel').modal('hide');
         	$('#recetasysubs').fadeOut(400);
         	$('#botones').fadeOut(400);
         });
	});

	$('#cancelarproceso').click(function(event) {
		$('#modalcancel').modal('show');
	});

	$('#consultas').click(function(event) {
		var idt = $('#idtienda').val();
		var reversado = 2;
		$.ajax({
			url: BASE_URL+'/merma/consultas/'+idt+'/'+reversado,
            type: 'POST',
            dataType: 'json'
		})
        .done(function(data) {
        	consultarmerma(idt,reversado);
        });
	});

	$('#btn-rev').click(function(event) {
			var idt = $('#idtienda').val();
			var valor = $('#btn-rev').val();
			if (valor == 1) {
				$('#btn-rev').val('');
				$('#btn-rev').val(2);
				$('#btn-rev').text('Consultar mermas');
				$('#btn-rev').removeClass('btn-outline-danger');
				$('#btn-rev').addClass('btn-outline-primary');
				consultarmerma(idt,1);
			}else{
				$('#btn-rev').val('');
				$('#btn-rev').val(1);
				$('#btn-rev').text('Consultar reversos');
				$('#btn-rev').addClass('btn-outline-danger');
				$('#btn-rev').removeClass('btn-outline-primary');
				consultarmerma(idt,2);
			}		
	});

});

	function consultarmerma(idt,reversado){
  	$('#load').fadeOut(400);
  	setTimeout(function() {$('#tablaoculta2').fadeIn(500);$('#tablaoculta2').prop("hidden",false);}, 800);
		var t2 =$('#mermados').DataTable({
            "ajax": BASE_URL+'/merma/consultas/'+idt+'/'+reversado,
            "columns": [
            	{ "data": null, className: "tdcenter"},
                { "data": "codigi" , className: "tdleft"},
                { "data": "mercancia" , className: "tdleft"},
                { "data": "marca" , className: "tdleft"},
                { "data": "tipom" , className: "tdleft"},
                { "data": "motivo" , className: "tdleft"},
                { "data": "descripcion" , className: "tdleft"},
            	{ "data": "cant" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['abums']
		       		}
            	},
                { "data": "stock" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+row['abums']
		       		}
            	},
            	{ "data": "dia" , className: "tdcenter"}, 
                { "data": "idk",   
		          	render : function(data, type, row) { 
			          	if (row['reversado'] != 1) {
		          			return '<center><span  onclick="reversarmerma('+data+','+row['idm']+')" class="fa fa-remove test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="Deshacer la merma de '+row['ingrediente']+'"></span></center>'+
			              	'<input type="hidden" id="ing'+row['idm']+'" value="'+row['ingrediente']+'"/>'
		          		}else{
		          			return '<h6>Reversado</h6>'
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
    $('#mermados').css("width","100%");
    t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
		
	}

	function DT(clasif){
		$("#padre_id option[value='999999']").remove();
		$('#padre_id').append('<option value="999999">Todas</option>');
		
		var idt = $('#idtienda').val();
		if (clasif!=1) {
			var url = BASE_URL+'/merma/productos/'+idt+'/'+clasif;
		}else{
			var url = BASE_URL+'/merma/productos/'+idt;
		}

		var tb = $('#prods').DataTable({
		            "ajax": url,
		            "lengthChange": false,
		            "columns": [
		            	{ "data": null, className: "tdcenter"},
		                { "data": "codigo" , className: "tdleft"},
		                { "data": "producto" , className: "tdleft",
		                	render : function(data, type, row) { 
				          		if (row['tipo_producto']== 1) {//camviar idp por pvp para validar si es pv o pi
				          			return ''+data+''
				          		}else{
				          			if (row['idre'] == null) {
				          				return '<o style="color:red" title="no tiene receta">'+data+'</o>'+
				          				'<input type="hidden" id="r'+row['idp']+row['tipo_producto']+'" value="0"/>'
				          			}else{
				          				return ''+data+''+
				          				'<input type="hidden" id="r'+row['idp']+row['tipo_producto']+'" value="'+row['idre']+'"/>'
				          			}
				          		}
				       		} 
		            	},
		                { "data": "marca" , className: "tdleft",
		                	render : function(data, type, row) { 
				          		if (row['tipo_producto']== 1) {//camviar idp por pvp para validar si es pv o pi
				          			return ''+data+'<input type="hidden" id="p'+row['idp']+row['tipo_producto']+'" value="'+row['producto']+'"/>'+
				          			'<input type="hidden" id="m'+row['idp']+row['tipo_producto']+'" value="'+row['marca']+'"/>'
				          		}else{
				          			if (row['idre'] == null) {
				          				return '<o style="color:red" title="no tiene receta"><input type="hidden" id="p'+row['idp']+row['tipo_producto']+'" value="'+row['producto']+'"/></o>'
				          			}else{
				          				return '<input type="hidden" id="p'+row['idp']+row['tipo_producto']+'" value="'+row['producto']+'"/>'
				          			}
				          		}
				       		} 
		            	},
		            	{ "data": "abreviatura" , className: "tdleft",
		            		render : function(data, type, row) { 
				          		if (row['tipo_producto']== 1) {//camviar idp por pvp para validar si es pv o pi
				          			return ''+data+'<input type="hidden" id="'+row['idp']+row['tipo_producto']+'" value="'+data+'"/>'	
				          			
				          		}else{
				          			return 'Un <input type="hidden" id="'+row['idp']+row['tipo_producto']+'" value="Un"/>'	
				          		}
				       		} 
		            	},
		                { "data": "idp" , className: "tdcenter",   
				          	render : function(data, type, row) { 
				          			if (row['marca']==0) {
				          				var mark = '';
				          			}else{
				          				var mark = row['marca'];
				          			}
				          			return '<input type="radio" name="radiob" class="form-control form-control-sm" id="" onclick="mermar('+row['idp']+','+row['tipo_producto']+','+row['idum']+')" title="Mermar '+row['producto']+' '+mark+'" style="cursor: pointer; cursor:hand;">'

				          		
				       		} 
		   				}   
		            ],
		            "columnDefs": [ {
		            "searchable": false,
		            "orderable": false,
		            "targets": [0, 5]
		                } ],
		                "order": [[ 1, 'asc' ]],
		            destroy: true,
		            responsive: true,

		        });
	    $('#prods').css("width","100%");
	    tb.on( 'order.dt search.dt', function () {
	        tb.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
	}

	function DT2(){
		$.ajax({
			url: BASE_URL+'/merma/mostrardatosmerma/',
            type: 'POST',
            dataType: 'json'
		})
         .done(function(data) {
         	if (data["data"].length >0) {
         		var idt = $('#idtienda').val();
		var tb2 = $('#tablamermar').DataTable({
	            "ajax": BASE_URL+'/merma/mostrardatosmerma/',
	            "lengthChange": false,
	            "searching": false,
	            "columns": [
	            	{ "data": null, className: "tdcenter"},
	                { "data": "codigo", className: "tdleft"},
	                { "data": "nombre" , className: "tdleft"},
	      			{ "data": "marca", className: "tdleft",
	      				render : function(data, type, row) { 
				          			if (data==0) {
				          				var mark = '';
				          			}else{
				          				var mark = data;
				          			}
				          			return ''+mark+''
				       		} 
	      			},
	      			{ "data": "cantidad", className: "tdright",
	      				render : function(data, type, row) { 
	      							var c = parseFloat(data);
				          			var cant = c.toLocaleString('es-ES', { minimumFractionDigits: 4 });
				          			return ''+cant+''
				       	} 
	      			},
	                { "data": 'abreviatura' , className: "tdleft",
	                	render : function(data, type, row) { 
				          			if (row['tipopro']==1) {
				          				var abrev = row['abreviatura'];
				          			}else{
				          				var abrev = 'Un';
				          			}
				          			return ''+abrev+''
				       	} 
	            	},
	                { "data": 'motivo' , className: "tdleft"},
	                { "data": "id" , className: "tdcenter",   
				          	render : function(data, type, row) { 
				          			if (row['marca']==0) {
				          				var mark = '';
				          			}else{
				          				var mark = row['marca'];
				          			}
				          			return '<span data-toggle="tooltip" data-placement="top" onclick="removeM('+row['id']+','+row['tipopro']+','+idt+',1,2,1)" class="fa fa-remove test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="eliminar de esta lista: '+row['nombre']+' '+mark+'"></span>'				          		
				       		} 
		   				}
	              
	                       
	            ],
	            "columnDefs": [ {
	            "searchable": false,
	            "orderable": false,
	            "targets": [0, 7]
	                } ],
	                "order": [[ 1, 'asc' ]],
	            destroy: true,
	            responsive: true
	        });
		 		$('#_10').on( 'click', function () {
				    table.page.len( 10 ).draw();
				} );
				setTimeout(function() {$('#recetasysubs').slideDown(300);$('#tablamermar').prop('hidden',false); $('#tablamermar').fadeIn(400);$('#recetasysubs').prop('hidden',false);$('#botones').prop('hidden',false);$('#botones').fadeIn(400);$('html,body').animate({
		            scrollTop: $("#recetasysubs").offset().top
		        }, 1000);}, 300);
		        $('.close').trigger('click');
		    	$('#tablamermar').css("width","100%");
		    	tb2.on( 'order.dt search.dt', function () {
		        tb2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
		            cell.innerHTML = i+1;
		        } );
		    } ).draw();
         	}else{
         		$('#modalcancel').modal('hide');
	         	$('#recetasysubs').fadeOut(400);
	         	$('#botones').fadeOut(400);
	         	$('.close').trigger('click');
         	}
         	
        });

		
	}

function mermar(idp,tipoP,idum){
	$('#alert-sinrec').slideUp();
	$('#alert-stmin').slideUp();
	load('referencia','motivo',121);
	var producto = $('#p'+idp+tipoP).val();
	var marca = $('#m'+idp+tipoP).val();
	var receta = $('#r'+idp+tipoP).val();
	if (!marca) {
		var mark = '';
	}else{
		var mark = marca;
	}
	var abreviatura = $('#'+idp+tipoP).val();
	var selected = $('#padre_id option:selected').text();
	$('#mermar').prop('disabled', true);
	$('#cantidadM').val('');
	$('#cantidadM').val(1);
	$('#cantidadM').number(true, 4, ',', '.');
	$('#idpro').val('');
	$('#idpro').val(idp);
	$('#tipopro').val('');
	$('#tipopro').val(tipoP);
	$('#unim').empty();
	$('#unim').append(abreviatura);
	$('#titleM').empty();
	$('#titleM').append(producto+' '+mark);
	$('#productoamemrmar').empty();
	$('#productoamemrmar').append(producto+' '+mark);
	if (tipoP == 2) {
		if (receta == 0) {
			$('#alertpvta').removeClass('alert-info');
			$('#alertpvta').addClass('alert-danger');
			$('#h4alertpv').empty();
			$('#h4alertpv').append('El producto seleccionado, no tiene ninguna receta asignada, el proceso de merma no puede continuar.');
			$('#abrirM').prop('disabled', true);
		}else{
			$('#alertpvta').removeClass('alert-danger');
			$('#alertpvta').addClass('alert-info');
			$('#h4alertpv').empty();
			$('#abrirM').prop('disabled', false);
		}
		$('#alertpvta').slideDown();
		$('#alertpvta').prop('hidden', false);
	}else{
		$('#alert-stmin').hide();
		$('#modalmermas').modal('show');
	}
	
}


function removeM(idpro,tipopro,idt,moti,tipo,cant){
	$('#modalcancela2').modal('show');
	$('#modalcancela2 .modal-footer').empty();
	$('#modalcancela2 .modal-footer').append('<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">No</button>'+
										          '<button type="button" class="btn btn-sm btn-outline-danger" id="" onclick="removedM('+idpro+','+tipopro+','+idt+','+moti+','+tipo+','+cant+')">Si</button>');

}

function removedM(idpro,tipopro,idt,moti,tipo,cant){
	$.ajax({
		url: BASE_URL+'/merma/datosmerma/'+idpro+'/'+tipopro+'/'+idt+'/'+moti+'/'+tipo+'/'+cant,
        type: 'POST',
        dataType: 'json'
	})
     .done(function(data) {
     	DT2();
     });
}

function reversarmerma(idk,idm){
	$('#idk').val('');
	$('#idk').val(idk);
	$('#idm').val('');
	$('#idm').val(idm);
	var text = $('#ing'+idm).val();
	$('.rev').empty();
	$('.rev').append(text);
	$('#modalreversar').modal('show');
}

function validacion(){
		var idt = $('#idtienda').val();
		var cantidad = $('#cantidadM').val();
		var idpro = $('#idpro').val();
		var tipopro = $('#tipopro').val();
		$.ajax({
            url: BASE_URL+'/merma/validarmerma/'+idt+'/'+cantidad+'/'+idpro+'/'+tipopro,
            type: 'POST',
            dataType: 'json'
        })
      	.done(function(data) {
      		//data = 1: cantidad a mermar valida
      		if (data == 'error') {
	    		$('#mermar').prop('disabled', true);
      			$('#alert-sinrec').slideDown();
      			$('#alert-sinrec').prop('hidden', false);
	    	}else if (data != 'error' && data != 1) {
      			$('#validado').empty();
      			$('#validado').append(data[0]['nombre']+' '+data[0]['marca']);
      			$('#mermar').prop('disabled', true);
      			$('#alert-stmin').slideDown();
      			$('#alert-stmin').prop('hidden', false);
      		}else{
      			$('#alert-stmin').slideUp();
      			$('#mermar').prop('disabled', false);
      		}
		});
}

$(document).ready(function() {
	$('#procesar').click(function(event) {
		var idT = $('#idtienda').val();
		$.ajax({
			url: BASE_URL+'/merma/procesarmermas/'+idT,
	        type: 'POST',
	        dataType: 'json'
		})
	    .done(function(data) {
	    	$('#recetasysubs').fadeOut(400);
         	$('#botones').fadeOut(400);
 			$('#mermasOK').slideDown();
 			$('#mermasOK').prop('hidden', false);
 			setTimeout(function() {$('#mermasOK').slideUp(500);}, 6000);
	    })
	    .fail(function(datos){
 			$('#mermaserror').slideDown();
 			$('#mermaserror').prop('hidden', false);
 			setTimeout(function() {$('#mermaserror').slideUp(500);}, 6000);
	 	});
	});

	$('#cancelarM').click(function(event) {
		$('#alertpvta').slideUp();
	});
	$('#abrirM').click(function(event) {
		$('#alertpvta').slideUp();
		$('#alert-stmin').hide();
		$('#modalmermas').modal('show');
	});

	$('#reversar').click(function(event) {
		var idt = $('#idtienda').val();
		var idk = $('#idk').val();
		var idm = $('#idm').val();
		var mot = $('#motivoreverso').val();
      	var motivo = mot.replace(/ /g, "@");
		$.ajax({
			url: BASE_URL+'/merma/reversar/'+idt+'/'+idk+'/'+idm+'/'+motivo,
	        type: 'POST',
	        dataType: 'json'
		})
	    .done(function(data) {
	    	$('#modalreversar').modal('hide');
 			$('#mermareversada').slideDown();
 			$('#mermareversada').prop('hidden', false);
 			setTimeout(function() {$('#mermareversada').slideUp(500);consultarmerma(idt,1)}, 6000);
	    })
	    .fail(function(datos){
	    	$('#modalreversar').modal('hide');
 			$('#errorreversar').slideDown();
 			$('#errorreversar').prop('hidden', false);
 			setTimeout(function() {$('#errorreversar').slideUp(500);}, 6000);
	 	});
	});

	$('#close-alert').click(function(event) {
		$('#alert-stmin').slideUp();
	});
	$('#close-alert2').click(function(event) {
		$('#alert-sinrec').slideUp();
	});
});