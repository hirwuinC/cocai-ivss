jQuery(document).ready(function($) {
	//alert('hola');
	$('#autocomplete').change(function(event) {
		$('#autocomplete2').val("");
		$('#unidades').empty();
		$('#cantis').hide();
		$('#unicant').hide();
		var prod = $('#autocomplete').val();
        var nueva = prod.replace(/ /gi, "@");
		$('#cantidadR').empty();
		$('#cantis').show();
		$('#unicant').show();
		//alert(prod);
		$('#autocomplete2').change(function(event) {
		var marc = $('#autocomplete2').val();
		var marca = marc.replace(/ /gi, "@");

		//alert(nueva); alert(marc);
		$.ajax({
			url: BASE_URL+'/inventario/mercancia/'+nueva+'/'+marca,
            type: 'POST',
            dataType: 'json'
		})
		.done(function(data) {
			$('#cantis').prop("hidden",false);
			$('#unicant').prop("hidden",false);
			//alert(data[0]['id']);
			$('#mercid').empty();
			$('#mercid').val(data[0]['id']);
				$('#unidades').append('<option value="'+data[0]['idUS']+'">'+data[0]['US']+'</option>'+
					'<option selected value="'+data[0]['idUP']+'">'+data[0]['UP']+'</option>'+
					'<option value="'+data[0]['idUC']+'">'+data[0]['UC']+'</option>');
		})	
		
		});
	});
	var idT = $('#tiendae').val();
	//alert(idT);
	$('#tablaremi').DataTable({
            "ajax": BASE_URL+'/inventario/cargaringredientes/'+idT,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "stockt", className: "tdleft",
                	render: function(data, type,row){
                		return ''+data+' '+row['abums']
                	}
            	},
                { "data": "stmin", className: "tdleft",
                	render: function(data, type,row){
                		return ''+data+' '+row['abums']
                	}
            	},
                { "data": "stmax", className: "tdleft",
                	render: function(data, type,row){
                		return ''+data+' '+row['abums']
                	}
            	},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
              return '<a href="#" onclick="agregaringrediente('+row['idi']+','+idT+')" title="Solicitar '+row['ingrediente']+'">Solicitar</a'
          }    
       }                 
            ],
            destroy: true,
            responsive: true
        });
	$('#tablaremi_filter').css('float', 'right');
    $('#tablaremi').css("width","100%");

    $('#tablarepo').DataTable({
            "ajax": BASE_URL+'/inventario/cargaringredientes/'+idT,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "familia", className: "tdleft"},
                { "data": "stockt", className: "tdright",
                	render: function(data, type,row){
                		return ''+data+' '+row['abums']
                	}
            	},
                { "data": "stmin", className: "tdright",
                	render: function(data, type,row){
                		return ''+data+' '+row['abums']
                	}
            	},
                { "data": "stmax", className: "tdright",
                	render: function(data, type,row){
                		return ''+data+' '+row['abums']
                	}
            	},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
          	//var ingr = row['ingrediente'].replace(/ /gi, "@"); 
          		return '<a href="#" onclick="addmerc('+row['idi']+','+idT+')" title="Solicitar '+row['ingrediente']+'">Solicitar</a'
          }    
       }                 
            ],
            destroy: true,
            responsive: true
        });
    
    $('#tablarepo_filter').css('float', 'right');
    $('#tablarepo').css("width","100%");


});

function agregaringrediente(ingrediente,idt){
	//alert(ingrediente);
	$('#mercid').val('');
	$('#mercid').val(ingrediente);
	$.ajax({
		url: BASE_URL+'/receta/mercancia/'+ingrediente,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		//alert(data[0]['nombre']);
		$('#tit').empty();
		$('#tit').append('Solicitar '+data[0]['nombre']+' '+data[0]['marca']);
		$('#unidades').empty();
		if (data[0]['idUS'] != data[0]['idUP']) {
			$('#unidades').append('<option value="seleccione" selected disabled>Seleccione..</option>'+
				'<option value="'+data[0]['idUS']+'">'+data[0]['unidadS']+'</option>'+
					'<option value="'+data[0]['idUP']+'">'+data[0]['unidadP']+'</option>');
		}else{
			$('#unidades').append('<option value="seleccione" selected disabled>Seleccione..</option>'+
				'<option value="'+data[0]['idUS']+'">'+data[0]['unidadS']+'</option>');
		}
					
		});
	
	$('#modalcant').modal('show');
	

}

function addmerc(ingrediente,idt){
	$('#cantidadR').empty();
	var idemp = $('#idempresa').val();
	var idt = $('#tiendae').val();
    $('#mercid').val('');
    $('#mercid').val(ingrediente);
    if (idemp) {
    	load('proveedor','idprov',idemp,ingrediente);
    }else{
    	load('proveedor','idprov',idt,ingrediente);
    }
    
	$('#mercid').val('');
	$('#mercid').val(ingrediente);
	$.ajax({
		url: BASE_URL+'/receta/mercancia/'+ingrediente,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		//alert(data[0]['nombre']);
		$('#tit').empty();
		$('#tit').append('Solicitar '+data[0]['nombre']+' '+data[0]['marca']);
		$('#unidades').empty();
		if (data[0]['idUC']!= null && data[0]['idUC'] != data[0]['idUP']) {
			$('#unidades').append('<option value="" selected disabled>Seleccione..</option>'+
					'<option value="'+data[0]['idUC']+'">'+data[0]['unidadC']+'</option>'+
					'<option value="'+data[0]['idUP']+'">'+data[0]['unidadP']+'</option>');
		}else{
			$('#unidades').append('<option value="" selected disabled>Seleccione..</option>'+
					'<option value="'+data[0]['idUP']+'">'+data[0]['unidadP']+'</option>');
		}
					
		});
	
	$('#modalcant').modal('show');
	

}

function detallesOC(id){
    $.ajax({
        url: BASE_URL+'/compra/detallesOC/'+id,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        
        $('.titlemyt').empty();
        $('.titlemyt').append('Productos de la Orden de compra # '+data["data"][0]['num_reposicion']);
        vertabladetallesOC(id);
          
	}); 
}

function vertabladetallesOC(id){
	var t6 = $('#tabladetallesOC').DataTable({
            "ajax": BASE_URL+'/compra/detallesOC/'+id,
            "columns": [
                { "data": "codim", className: "tdleft font11"},
                { "data": "producto", className: "tdleft font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['marca']
                    }
                },
                { "data": "cant", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsol']
                    }
                },
                { "data": "stock", className: "tdright font11",
                    render : function(data,type, row){
                            return ''+data+' '+row['abrevsist']
                    }
                },        
                { "data": "stmin", className: "tdright font11",
                    render : function(data,type, row){ 
                            return ''+data+' '+row['abrevsist']
                    } 
                }

            ],
                
                "order": [[ 1, 'asc' ]],
                destroy: true,
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tabladetallesOC').css("width","100%");
	$('#tabladetallesOC_wrapper').removeClass('container-fluid');
	$('#modaldetalleOC').modal('show');  
}



