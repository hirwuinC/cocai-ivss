$(document).ready(function() {
	$('#tabla').change(function(event) {
		$('#continuar').prop('disabled', false);
		var text = $('#tabla option:selected').text();
		$('#tipotablas').empty();
		$('#tipotablas').append('Administracion de '+text);
		var texto = text.replace('es','');
		$('#campo').empty();
		$('#campo').append(text);
		$('.campo').empty();
		$('.campo').append(texto);
	});

	$('#continuar').click(function(event) {
		var tabla = $('#tabla').val();
		var empresa = $('#idtienda').val();
		consultartabla(tabla,empresa);
	});

	$('#add').click(function(event) {
		$('#modalagregar').modal('show');
	});

	$('#mcontinuar').click(function(event) {
		var tabla = $('#tabla').val();
		var empresa = $('#idtienda').val();
		var inpu = $('#nueva').val();
      	var campo = inpu.replace(/ /g, "@");
      $.ajax({
            url: BASE_URL+'/administracion/agregar/'+tabla+'/'+empresa+'/'+campo,
            type: 'POST',
            dataType: 'json'
          })
      .done(function(data) {
      	mostrarresultado(tabla,empresa);
      	$('#modalagregar').modal('hide');
      	$('#creado').slideDown('slow');
            $('#creado').prop('hidden', false);
            setTimeout(function(){
                $('#creado').slideUp('slow');
            },5000);

      })
      .fail(function(data){
      	alert("fail");
      })
	});

	$('#confirmdelete').click(function(event) {
		var id = $('#idborrar').val();
		var tabla = $('#tabla').val();
		var empresa = $('#idtienda').val();
		$.ajax({
            url: BASE_URL+'/administracion/borrar/'+id,
            type: 'POST',
            dataType: 'json'
          })
      .done(function(data) {
      	$('#modaldelete').modal('hide');
      	mostrarresultado(tabla,empresa);
      	$('#borrado').slideDown('slow');
            $('#borrado').prop('hidden', false);
            setTimeout(function(){
                $('#borrado').slideUp('slow');
            },5000);
      })

	});

});

	function consultartabla(tabla,empresa){
		$.ajax({
	      	url: BASE_URL+'/administracion/consultartabla/'+tabla+'/'+empresa,
	        type: 'POST',
	        dataType: 'json'
	    })
	    .done(function(data) {
			mostrarresultado(tabla,empresa);
		});
		
	}

	function mostrarresultado(tabla,empresa){
		var t =$('#tablas').DataTable({
            "ajax": BASE_URL+'/administracion/consultartabla/'+tabla+'/'+empresa,
            "columns": [
            	{ "data": null, className: "tdcenter"},
                { "data": "referencia" , className: "tdleft"},
                { "data": "id" , className: "tdcenter",   
	          	render : function(data, type, row) { 		         		
		         	return '<span class="fa fa-remove" style="cursor: hand; cursor: pointer; color: #337ab7" onclick="confirmardelete('+data+')" title="eliminar este registro" id="spanid"></span>' 
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
    $('#tablas').css("width","100%");
    t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
    $('#results').fadeIn();
    $('#results').prop('hidden', false);
    $('#add').prop('disabled', false);
	}

	function confirmardelete(id){
		$('#idborrar').val('');
		$('#idborrar').val(id);
		$('#modaldelete').modal('show');
	}