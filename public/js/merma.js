$(document).ready(function() {
	load('referencia','padre_id',13);
	var idt = $('#idtienda').val();
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
		$('#mermar').prop('disabled', false);
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

});

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
		                { "data": "producto" , className: "tdleft"},
		                { "data": "marca" , className: "tdleft",
		                	render : function(data, type, row) { 
				          		if (row['tipo_producto']== 1) {//camviar idp por pvp para validar si es pv o pi
				          			return ''+data+'<input type="hidden" id="p'+row['idp']+row['tipo_producto']+'" value="'+row['producto']+'"/>'+
				          			'<input type="hidden" id="m'+row['idp']+row['tipo_producto']+'" value="'+row['marca']+'"/>'
				          		}else{
				          			return '<input type="hidden" id="p'+row['idp']+row['tipo_producto']+'" value="'+row['producto']+'"/>'
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
	load('referencia','motivo',121);
	var producto = $('#p'+idp+tipoP).val();
	var marca = $('#m'+idp+tipoP).val();
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
	if (tipoP == 2) {
		$('#alertpvta').slideDown();
		$('#alertpvta').prop('hidden', false);
	}else{
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
		$('#modalmermas').modal('show');
	});
});