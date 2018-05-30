$(document).ready(function() {
	var st = 2;
	var idti = $('#idtienda').val();
	load('proveedor','proveedor',idti,999999);
	tablaproact(2);
	$('#proact').trigger('click');
	$('#proact').click(function(event) {
		$('#asignarprov').css('display', 'none');
		$('#proveedoresinact').css('display', 'none');
		$('#proveedoresact').css('display', 'block');
		tablaproact(2);
	});
	$('#proinact').click(function(event) {
		$('#asignarprov').css('display', 'none');
		$('#proveedoresact').css('display', 'none');
		$('#proveedoresinact').css('display', 'block');
		tablaproinact(1);
	});
	$('#asignacion').click(function(event) {
		$('#proveedoresact').css('display', 'none');
		$('#proveedoresinact').css('display', 'none');
		$('#asignarprov').css('display', 'block');
	});

	$('.house').click(function(event) {
        $('#d2').show();
        $('#casa').show();
        $('#edif').hide();
        $('#edificio').prop('disabled', true);
        $('#intercomunicador').prop('disabled', true);
        $('#casa').prop('disabled', false);
        $('#d2').prop('hidden', false);
        $('#house').prop('hidden', false);
        $('#edif').prop('hidden', false);
        $('#numint').prop('hidden', true);
        $('#ptoref').addClass('col-sm-offset-1');
        $('#ptoref').removeClass('col-sm-offset-0');
    });
    $('#building').click(function(event) {
        $('#d2').show();
        $('#edif').show();
        $('#casa').hide();
        $('#casa').prop('disabled', true);
        $('#edificio').prop('disabled', false);
        $('#intercomunicador').prop('disabled', false);
        $('#d2').prop('hidden', false);
        $('#house').prop('hidden', true);
        $('#edif').prop('hidden', false);
        $('#numint').prop('hidden', false);
        $('#ptoref').addClass('col-sm-offset-0');
        $('#ptoref').removeClass('col-sm-offset-1');
    });
    load('referencia','codigo_tlf',false);
    load('referencia','preguntas',false);
    load('referencia','tipo_usuario',false);
    load('referencia','tipoUid',false);
$('#estado').change(function(event) {
        $("#municipio option[value='Seleccione']").remove();
        var valor = $('#estado').val();
        $('#parroquia').empty();
        
        load('direccion','municipio',valor);
        $('#parroquia').append('<option selected disabled>Seleccione..</option>');
    });


    $('#municipio').change(function(event) {
        $("#parroquia option[value='Seleccione']").remove();
        var valor = $('#municipio').val();
        load('direccion','parroquia',valor);
        
    });


    $('#nuevoprov').click(function(event) {
    	$('#titulomodal').empty();
    	$('#titulomodal').append('Nuevo proveedor');
    	$('#tipoproceso').val('');
		$('#tipoproceso').val(1);
		var idt = $('#idtienda').val();
		$('#form-insert').attr('action', BASE_URL+'proveedores/newprov/'+idt);
		$('#guardarprov').text('Guardar Proveedor');
		$('form-control-sm').val('');
		load('direccion','estado',false);
		$('#municipio').empty();
		$('#municipio').append('<option selected disabled value="">Seleccione..</option>');
		$('#parroquia').empty();
		$('#parroquia').append('<option selected disabled value="">Seleccione..</option>');
    	$('#home').trigger('click');
    });

    $('#codigo_tlf').change(function(event) {
    	$('#addtlf').toggleClass('btn-outline-info btn-info');
    	$('#addtlf').prop('disabled', false);
    });

    $('#addtlf').click(function(event) {
    	var numerot = $('#ntlf').val();
    	var codigoid = $('#codigo_tlf').val();
    	var cod = $('#codigo_tlf option:selected').text();
    	if (numerot.length!=7) {
    		$('#modaler').modal('show');
    		$('#ntlf').focus();
    		$('#ntlf').css('color', 'red');
    	}else{
    		$('#ntlf').css('color', '#464a4c');
	    	$.ajax({
				url: BASE_URL+'/proveedores/datostlf/'+numerot+'/1'+'/'+codigoid+'/'+cod,
		        type: 'POST',
		        dataType: 'json'
			})
			.done(function(data) {
	    		mostrarnumeros();
	    	});
    	}
    	
    	
    });

    $('#ntlf').keyup(function(event) {
    	var numerot = $('#ntlf').val();
		if (numerot.length!=7) {
    		$('#ntlf').css('color', 'red');
    	}else{
    		$('#ntlf').css('color', '#464a4c');
    	}
    });

    $('#tlfs').click(function(event) {
    	$('#ntlf').val('');
    	$('#ntlf').css('color', '#464a4c');
    	$('#continuetlf').prop('hidden', false);
		$('.updatetlf').hide();
    	mostrarnumeros();
    });

    $('#guardarprov').click(function(event) {
    	$('#enviaform').trigger('click');
    });

    $('#form-insert').submit(function(event) {
        event.preventDefault();
        var enlace = $(this).attr('action');
        var formdata = $("#form-insert").serialize();
        $.ajax({
            url: enlace,
            type: 'POST',
            data: formdata,
            dataType: 'json'
        })
        .done(function(data) {
            $('#modalnewprov').modal('hide');
            var idt = $('#idtienda').val();
            if (data['proceso'] == 1) {
            	$('.info1').empty();
            	$('.info1').append('El proveedor '+data['name']+' Fue registrado de forma exitosa');
            }else{
            	$('.info1').empty();
            	$('.info1').append('El proveedor '+data['name']+' Fue actualizado de forma exitosa');
            }
            
            $('#exito').slideDown('slow');
            $('#exito').prop('hidden', false);
            setTimeout(function(){
                $('#exito').slideUp('slow');location.reload();
            },5000);
            
        })
        .fail(function(data) {
            $('#modalnewprov').modal('hide');
            var idt = $('#idtienda').val();
            if (data['proceso'] == 1) {
            	$('.info1').empty();
            	$('.info1').append('El proveedor '+data['name']+' no pudo ser registrado, por favor intente nuevamente');
            }else{
            	$('.info1').empty();
            	$('.info1').append('El proveedor '+data['name']+' no pudo ser actualizado, por favor intente nuevamente');
            }
            $('#error').slideDown('slow');
            $('#error').prop('hidden', false);
            setTimeout(function(){
                $('#error').slideUp('slow');location.reload();
            },5000);

        });
    });

    $('.cancelupdatetlf').click(function(event) {
    	$.ajax({
			url: BASE_URL+'/proveedores/vaciarsesion/',
	        type: 'POST',
	        dataType: 'json'
		})
		.done(function(data) {
			mostrarnumeros();
		});
    });

    $('#updatetlf').click(function(event) {
    	var idprov = $('#idprov').val();
    	$.ajax({
			url: BASE_URL+'/proveedores/updatetlfs/'+idprov,
	        type: 'POST',
	        dataType: 'json'
		})
		.done(function(data) {
			$('#modaltlfs').modal('hide');
			$('.info1').empty();
            $('.info1').append('Los numeros telefonicos del proveedor '+data[0]['prov']+', fueron actualizados de forma exitosa');
			$('#exito').slideDown('slow');
            $('#exito').prop('hidden', false);
            setTimeout(function(){
                $('#exito').slideUp('slow');
            },5000);
		});
    });

    $('#proveedor').change(function(event) {
    	$('#consultarasingados').removeClass('btn-outline-primary');
    	$('#consultarasingados').addClass('btn-primary');
    	$('#consultarasingados').prop('disabled', false);
    	$('#noasignados').removeClass('btn-outline-primary');
    	$('#noasignados').addClass('btn-info');
    	$('#noasignados').prop('disabled', false);
    });

    $('#consultarasingados').click(function(event) {
    	var idprov = $('#proveedor').val();
    	tablaasignados(idprov);
    });

    $('#noasignados').click(function(event) {
    	var idprov = $('#proveedor').val();
    	$('.idproveedor').val('');
    	$('.idproveedor').val(idprov);
    	tablanoasignados(idprov);
    });

    $('#asignarprods').click(function(event) {
    	$('#asign').trigger('click');
    });

    $('#editarprods').click(function(event) {
    	var idprod = $('#idmer').val();
    	var idprov = $('#idp').val();
    	editado(idprod,idprov);
    });

    $('#form-asignar').submit(function(event) {

        event.preventDefault();
        var enlace = $(this).attr('action');
        var formdata = $("#form-asignar").serialize();
        $.ajax({
            url: enlace,
            type: 'POST',
            data: formdata,
            dataType: 'json'
        })
        .done(function(data) {
        	var prod = $('#nprod').val();
            $('#modalprodxprov').modal('hide');
            $('#myModal').modal('hide');
            	$('.info1').empty();
            	$('.info1').append('el producto '+prod+' fue asignado al proveedor '+data[0]['prov']+' de forma exitosa');
	            $('#exito').slideDown('slow');
	            $('#exito').prop('hidden', false);
	            setTimeout(function(){
	                $('#exito').slideUp('slow');mostrarasignados(data[0]['idprov']);
	            },5000);
            
        })
        .fail(function(data) {
        	var prod = $('#nprod').val();
            $('#modalprodxprov').modal('hide');
            $('#myModal').modal('hide');
            	$('.info1').empty();
            	$('.info1').append('el producto '+prod+' no pudo ser asignado al proveedor '+data[0]['prov']+', por favor intente nuevamente');
	            $('#error').slideDown('slow');
	            $('#error').prop('hidden', false);
	            setTimeout(function(){
	                $('#error').slideUp('slow');mostrarasignados(data[0]['idprov']);
	            },5000);

        });
    });

    $('#desasigna').click(function(event) {
    	var idprov = $('#idprove').val();
    	var idprod = $('#idmerc').val();
    	desasignar(idprod,idprov);
    });

});

function editar(idprov){
	load('direccion','estado',false);
	$.ajax({
		url: BASE_URL+'/proveedores/datosprov/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		var idprov = data[0]['idprov'];
		var idub = data[0]['idub'];
		$('#tipoproceso').val('');
		$('#tipoproceso').val(2);
		$('#titulomodal').empty();
    	$('#titulomodal').append('Editar el proveedor '+ data[0]['prov']);
    	$('#nombre').val('');
    	$('#nombre').val(data[0]['prov']);
    	$('#rif').val('');
    	$('#rif').val(data[0]['rif']);
    	$('#rsocial').val('');
    	$('#rsocial').val(data[0]['razon_social']);
    	$('#correo').val('');
    	$('#correo').val(data[0]['correo']);
    	$('#tlfs').hide();
    	if (data[0]['nro_intercomunicador']) {
    		$('#edificio').val('');
    		$('#edificio').val(data[0]['edificio']);
    		$('#building').trigger('click');
    	}else{
    		$('#casa').val('');
    		$('#casa').val(data[0]['edificio']);
    		$('.house').trigger('click');
    	}
    	$('#calle').val('');
    	$('#calle').val(data[0]['calle']);
    	$('#urbanizacion').val('');
    	$('#urbanizacion').val(data[0]['urbanizacion']);
    	$('#p_referencia').val('');
    	$('#p_referencia').val(data[0]['punto_referencia']);
    	setTimeout(function(){
			$("#estado option[value="+ data[0]['estado_id'] +"]").attr("selected",true);
		},100);
		load('direccion','municipio',data[0]['estado_id']);
		setTimeout(function(){
			$("#municipio option[value="+ data[0]['municipio_id'] +"]").attr("selected",true);
		},100);
        load('direccion','parroquia',data[0]['municipio_id']);
        setTimeout(function(){
			$("#parroquia option[value="+ data[0]['parroquia_id'] +"]").attr("selected",true);
		},100);
		$('#form-insert').attr('action', BASE_URL+'proveedores/updateprov/'+idprov+'/'+idub);
		$('#guardarprov').text('Guardar Cambios');
		$('#modalnewprov').modal('show');
	})
	.fail(function(data) {
		alert('fail');
	});
}
function direccion(idprov){
	$.ajax({
		url: BASE_URL+'/proveedores/datosprov/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		if (data[0]['calle']) {
			var calle = ', Calle '+data[0]['calle'];
		}else{
			var calle = '';
		}
		if (data[0]['municipio']) {
			var municipio = ', Municipio '+data[0]['municipio'];
		}else{
			var municipio = '';
		}
		if (data[0]['estado']) {
			var estado = data[0]['estado'];
		}else{
			var estado = '';
		}
		if (data[0]['urbanizacion']) {
			var urbanizacion = ', urbanizacion '+data[0]['urbanizacion'];
		}else{
			var urbanizacion = '';
		}
		if (data[0]['edificio']) {
			var edificio = ', Oficina/Edif. '+data[0]['edificio']+'.';
		}else{
			var edificio = '';
		}	
		if (data[0]['nro_intercomunicador']) {
			var piso = '- Piso '+data[0]['nro_intercomunicador'];
		}else{
			var piso = '';
		}
		if (data[0]['punto_referencia']) {
			var punto_referencia = 'Punto de referencia: '+data[0]['punto_referencia'];
		}else{
			var punto_referencia = '';
		}	
		if (data[0]['parroquia']) {
			var parroquia = ', parroquia '+data[0]['parroquia'];
		}else{
			var parroquia = '';
		}	
		
		
		$('#dir').empty();
		$('#dir').append(estado+''+municipio+''+parroquia+''+urbanizacion+''+calle+''+edificio+''+piso+'<br/><br/>'+punto_referencia);
		$('#modalinfoprov').modal('show');
	});
}
function telefonos(idprov){
	$.ajax({
		url: BASE_URL+'/proveedores/vaciarsesion/',
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
	});
	$('#continuetlf').hide();
	$('.updatetlf').show();
	$('.updatetlf').prop('hidden', false);
	$.ajax({
		url: BASE_URL+'/proveedores/mostrarnumerosprov/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		$('#idprov').val('');
		$('#idprov').val(idprov);
		for (var i = 0; i < data.length; i++) {
			var numerot = data[i]['numero'];
			var codigoid = data[i]['codigo_id'];
			var cod = data[i]['codigo'];
			$.ajax({
				url: BASE_URL+'/proveedores/datostlf/'+numerot+'/1'+'/'+codigoid+'/'+cod,
		        type: 'POST',
		        dataType: 'json'
			})
			.done(function(data) {
	    		
	    	});
		}
		mostrarnumeros();
		$('#modaltlfs').modal('show');
	    
	});
}


function productos(idprov){
	$.ajax({
		url: BASE_URL+'/proveedores/productosasignados/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		var moneda = $('#monedatienda').val();
		var proasign = $('#tablaproasig').DataTable({
	            "ajax": BASE_URL+'/proveedores/productosasignados/'+idprov,
	            "columns": [
	                { "data": null, className: "tdcenter font11"},
	                { "data": "codigom", className: "tdleft font11"},
	                { "data": "codiprov", className: "tdleft font11"},
	                { "data": "producto", className: "tdleft font11"},
	                { "data": "marca", className: "tdleft font11"},
	                { "data": "precioU", className: "tdright font11",
	                	render: function(data, type, row){
                            $('.titlemyt').empty();
                            $('.titlemyt').append('Productos asignados a '+row['prov']);
	                		return ''+data+' '+moneda+''
	                	}
	            	},
	                { "data": "precioprovF", className: "tdright font11",
	                	render: function(data, type, row){
	                		return ''+data+' '+moneda+''
	                	}
	            	}              
	            ],
	                //"order": [[ 1, 'asc' ]],
	                destroy: true,
	                responsive: true
	                }); 
	    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
	$('#tablaproasig').css("width","100%");
    proasign.on( 'order.dt search.dt', function () {
    proasign.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
	$('#tablaproasig_wrapper').removeClass('container-fluid');
	});	
	$('#modalasignados').modal('show');
}
function cambiarstatus(idprov,st){
	$.ajax({
		url: BASE_URL+'/proveedores/cambiarstatus/'+idprov+'/'+st,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		$('#modalcambiastatus').modal('hide');
		if (st == 1) {
			$('.info1').empty();
	        $('.info1').append('El proveedor '+data[0]['prov']+' Fue desactivado de forma exitosa');
			$('#exito').slideDown('slow');
	        $('#exito').prop('hidden', false);
	        $('#proinact').trigger('click');
	        setTimeout(function(){
                $('#exito').slideUp('slow');
            },5000);
		}else{
			$('.info1').empty();
	        $('.info1').append('El proveedor '+data[0]['prov']+' Fue reactivado de forma exitosa');
			$('#exito').slideDown('slow');
	        $('#exito').prop('hidden', false);
			$('#proact').trigger('click');
			setTimeout(function(){
                $('#exito').slideUp('slow');
            },5000);
		}
		
		
	});
}

function mostrarnumeros(){
	$.ajax({
		url: BASE_URL+'/proveedores/mostrarnumeros/',
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		$('#tablatelefonos').slideDown('slow');
		$('#tablatelefonos').prop('hidden', false);
	    var ttlf = $('#tablatlfs').DataTable({
	    		"paging":   false,
		        //"ordering": false,
		        "info":     false,
		        "searching": false,
	            "ajax": BASE_URL+'/proveedores/mostrarnumeros',
	            "columns": [
	                { "data": "codigo", className: "tdleft font11",
	                	render : function(data, type, row) {
	                            return ''+data+'-'+row['numero']
	                  }
	            	},
	                { "data": "numero", className: "tdcenter ",
	                    render : function(data, type, row) {
	                            return '<span class="ico faicons fa fa-remove" title="eliminar este numero de la lista ('+row['numero']+')" onclick="borrarnumero('+data+','+2+','+row['codigo_id']+')"></span>'
	                  } 
	                }               
	            ],
	                //"order": [[ 1, 'asc' ]],
	                destroy: true,
	                responsive: true
	                }); 
	    $('#_10').on( 'click', function () {
	        table.page.len( 10 ).draw();
	    } );
	    $('#tablatlfs').css("width","100%");
	    $('#tablatlfs_wrapper').removeClass('container-fluid');
	})
	.fail(function(data){
		$('#tablatelefonos').slideUp('slow');
		
	})
	
    
}

function borrarnumero(num,tipo,codigo_id,codigo){
	$.ajax({
				url: BASE_URL+'/proveedores/datostlf/'+num+'/'+tipo+'/'+codigo_id+'/'+codigo,
		        type: 'POST',
		        dataType: 'json'
			})
			.done(function(data) {
	    		mostrarnumeros();
	    	});
}

function tablaproact(st){
	var idt = $('#idtienda').val();
	var act = $('#tablaprov').DataTable({
	            "ajax": BASE_URL+'/proveedores/consultar/'+idt+'/'+st,
	            "columns": [
	                { "data": null, className: "tdcenter font11"},
	                { "data": "nombre", className: "tdleft font11"},
	                { "data": "rif", className: "tdleft font11"},
	                { "data": "razon_social", className: "tdleft font11"},
	                { "data": "correo", className: "tdleft font11"},
	                { "data": "id", className: "tdcenter ",
	                    render : function(data, type, row) {
	                            return '<i class="ico faicons fa fa-edit" data-toggle="tooltip" data-placement="top" title="Editar" onclick="editar('+data+')"></i>'+
                                            '<i class="ico faicons fa fa-map-marker ml-2" data-toggle="tooltip" data-placement="top" title="Ver direccion" onclick="direccion('+data+')"></i>'+
                                            '<i class="ico faicons fa fa-phone ml-2" data-toggle="tooltip" data-placement="top" title="Ver numeros telefonicos" onclick="telefonos('+data+')"></i>'+
                                            '<o data-toggle="tooltip" data-placement="top" title="Ver productos que vende"><i class="ico faicons fa fa-list-alt ml-2" onclick="productos('+data+')"></i></o>'+
                                            '<i class="ico faicons fa fa-remove ml-2" data-toggle="tooltip" data-placement="top" title="desactivar proveedor '+row['nombre']+'" onclick="actoinact('+data+',1)"></i>'
	                  } 
	                }               
	            ],
	                //"order": [[ 1, 'asc' ]],
	                destroy: true,
	                responsive: true
	                }); 
	    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
	$('#tablaprov').css("width","100%");
    act.on( 'order.dt search.dt', function () {
    act.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
	$('#tablaprov_wrapper').removeClass('container-fluid');
}

function tablaproinact(st){
	var idt = $('#idtienda').val();
	var inact = $('#tablaprovin').DataTable({
	            "ajax": BASE_URL+'/proveedores/consultar/'+idt+'/'+st,
	            "columns": [
	                { "data": null, className: "tdcenter font11"},
	                { "data": "nombre", className: "tdleft font11"},
	                { "data": "rif", className: "tdleft font11"},
	                { "data": "razon_social", className: "tdleft font11"},
	                { "data": "correo", className: "tdleft font11"},
	                { "data": "id", className: "tdcenter ",
	                    render : function(data, type, row) {
	                            return '<o data-toggle="tooltip" data-placement="top" title="Ver productos que vende"><i class="ico faicons fa fa-list-alt ml-2" onclick="productos('+data+')"></i></o>'+
                                        '<i class="ico faicons fa fa-circle-o ml-2" data-toggle="tooltip" data-placement="top" title="Reactivar proveedor '+row['nombre']+'" onclick="actoinact('+data+',2)"></i>'
	                  } 
	                }               
	            ],
	                //"order": [[ 1, 'asc' ]],
	                destroy: true,
	                responsive: true
	                }); 
	    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
	$('#tablaprovin').css("width","100%");
    inact.on( 'order.dt search.dt', function () {
    inact.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
	$('#tablaprovin_wrapper').removeClass('container-fluid');
}

function actoinact(idprov,st){
	$.ajax({
		url: BASE_URL+'/proveedores/datosprov/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		if (st == 2) {
			$('#cuerpomodalex').empty();
			$('#cuerpomodalex').append('Desea continuar con la reactivacion del proveedor '+data[0]['prov']+'?');
			$('#cuerpomodalex').removeClass('alert-danger');
			$('#cuerpomodalex').addClass('alert-info');
			$('#btn-si').attr('onclick', 'cambiarstatus('+idprov+','+st+')');
		}else{
			$('#cuerpomodalex').empty();
			$('#cuerpomodalex').append('Desea continuar con la desactivacion del proveedor '+data[0]['prov']+'?');
			$('#cuerpomodalex').addClass('alert-danger');
			$('#cuerpomodalex').removeClass('alert-info');
			$('#btn-si').attr('onclick', 'cambiarstatus('+idprov+','+st+')');
		}
		$('#modalcambiastatus').modal('show');
	});

}

function tablaasignados(idprov){
	$.ajax({
		url: BASE_URL+'/proveedores/productosasignados/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		mostrarasignados(idprov);
	})
	.fail(function(data){
		alert("fail");
	});
}

function tablanoasignados(idprov){
	var idt = $('#idtienda').val();
	$.ajax({
		url: BASE_URL+'/proveedores/productosnoasignados/'+idprov+'/'+idt,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		var text = $('#proveedor option:selected').text();
		$('.titlemyt').empty();
		$('.titlemyt').append('Asignacion de productos a: '+text);
		$('.nprov').empty();
		$('.nprov').append(text);
		$('#myModal').modal('show');
		mostrarnoasignados(idprov,idt);
	})
	.fail(function(data){
		alert("fail");
	});
}

function mostrarasignados(idprov){
	var moneda = $('#monedatienda').val();
	var asign = $('#tablaasignados').DataTable({
	            "ajax": BASE_URL+'/proveedores/productosasignados/'+idprov,
	            "columns": [
	                { "data": null, className: "tdcenter font11"},
	                { "data": "codigom", className: "tdleft font11"},
	                { "data": "codiprov", className: "tdleft font11"},
	                { "data": "producto", className: "tdleft font11"},
	                { "data": "marca", className: "tdleft font11"},
	                { "data": "precioU", className: "tdright font11",
	                	render: function(data, type, row){
	                		return ''+data+' '+moneda+''
	                	}
	            	},
	                { "data": "precioprovF", className: "tdright font11",
	                	render: function(data, type, row){
	                		return ''+data+' '+moneda+''
	                	}
	            	},
	                { "data": "mercancia_id", className: "tdcenter ",
	                    render : function(data, type, row) {
	                            return '<i title="editar producto '+row['producto']+' '+row['marca']+'" class="ico faicons fa fa-edit" onclick="editarmerc('+data+','+row['proveedor_id']+')"></i>'+ 
	                            '<i title="Desasignacion producto '+row['producto']+' '+row['marca']+'" class="ico faicons fa fa-remove ml-2" onclick="desasignacion('+data+','+row['proveedor_id']+')"></i>'+
	                            '<input type="hidden" id="npd'+data+''+idprov+'" value="'+row['mercancia']+'">'+
	                            '<input type="hidden" id="pre'+data+''+idprov+'" value="'+row['precioprov']+'">'+
	                            '<input type="hidden" id="cod'+data+''+idprov+'" value="'+row['codiprov']+'">'
	                  } 
	                }               
	            ],
	                //"order": [[ 1, 'asc' ]],
	                destroy: true,
	                responsive: true
	                }); 
	    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
	$('#tablaasignados').css("width","100%");
    asign.on( 'order.dt search.dt', function () {
    asign.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
	$('#tablaasignados_wrapper').removeClass('container-fluid');
}

function mostrarnoasignados(idprov,idt){
	var asign = $('#tablanoasignados').DataTable({
	            "ajax": BASE_URL+'/proveedores/productosnoasignados/'+idprov+'/'+idt,
	            "columns": [
	                { "data": null, className: "tdcenter font11"},
	                { "data": "codigo", className: "tdleft font11"},
	                { "data": "producto", className: "tdleft font11"},
	                { "data": "marca", className: "tdleft font11"},
	                { "data": "clasificacion", className: "tdleft font11"},
	                { "data": "stock", className: "tdright font11",
	                	render : function(data, type, row){
	                		return ''+data+' '+row['avums']+''
	                	}
	            	},
	                { "data": "stmin", className: "tdright font11",
	                	render : function(data, type, row){
	                		return ''+data+' '+row['avums']+''
	                	}
	            	},
	                { "data": "idpro", className: "tdcenter ",
	                    render : function(data, type, row) {
	                            return '<o data-toggle="tooltip" data-placement="top" title="asignar producto'+row['producto']+' '+row['marca']+'"><i class="ico faicons fa fa-circle-o" onclick="asignacion('+data+','+idprov+')"></i></o>'+
	                            		'<input type="hidden" id="np'+data+''+idprov+'" value="'+row['mercancia']+'">'
	                  } 
	                }               
	            ],
	                //"order": [[ 1, 'asc' ]],
	                destroy: true,
	                responsive: true
	                }); 
	    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
	$('#tablanoasignados').css("width","100%");
    asign.on( 'order.dt search.dt', function () {
    asign.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
	$('#tablanoasignados_wrapper').removeClass('container-fluid');
}

function asignacion(idprod, idprov){
	var producto = $('#np'+idprod+idprov).val();
	$('#idmer').val('');
	$('#idmer').val(idprod);
	$('#tipo').empty();
	$('#tipo').append('Asignar ');
	$('#tipo2').empty();
	$('#tipo2').append('al ');
	$('.nprod').empty();
	$('.nprod').append(producto);
	$('.nprod').val('');
	$('.nprod').val(producto);
	$('#editarprods').hide();
	$('#asignarprods').show();
	$('#modalprodxprov').modal('show');
}

function desasignacion(idprod,idprov){
	$('#idmerc').val('');
	$('#idmerc').val(idprod);
	$('#idprove').val('');
	$('#idprove').val(idprov);
	$.ajax({
		url: BASE_URL+'/proveedores/datosprov/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		var proveedor = data[0]['prov'];
		var producto = $('#npd'+idprod+idprov).val();
		$('.nprov').empty();
		$('.nprov').append(proveedor);
		$('.nprov').val('');
		$('.nprov').val(proveedor);
		$('.nprod').empty();
		$('.nprod').append(producto);
		$('.nprod').val('');
		$('.nprod').val(producto);
		$('#modaldesa').modal('show');
	});
		
	
}

function desasignar(idprod,idprov){
	$.ajax({
		url: BASE_URL+'/proveedores/desasignar/'+idprod+'/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		var nprod = $('#nprod').val();
		$('#modaldesa').modal('hide');
		$('.info1').empty();
        $('.info1').append('El producto '+nprod+' ya no esta asignado al proveedor '+data[0]['prov']);
		$('#exito').slideDown('slow');
        $('#exito').prop('hidden', false);
        setTimeout(function(){
            $('#exito').slideUp('slow');mostrarasignados(data[0]['idprov']);
        },5000);
	})
	.fail(function(data){
		alert('fail');
	})
}

function editarmerc(idprod,idprov){
	var pre = $('#pre'+idprod+idprov).val();
	var cod = $('#cod'+idprod+idprov).val();
	$('#codiprov').val('');
	$('#codiprov').val(cod);
	$('#preciounit').val('');
	$('#preciounit').val(pre);
	$.ajax({
		url: BASE_URL+'/proveedores/datosprov/'+idprov,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
    	$('.idproveedor').val('');
    	$('.idproveedor').val(idprov);
		var proveedor = data[0]['prov'];
		var producto = $('#npd'+idprod+idprov).val();
		$('#idmer').val('');
		$('#idmer').val(idprod);
		$('.nprod').empty();
		$('.nprod').append(producto);
		$('#tipo').empty();
		$('#tipo').append('Editar ');
		$('#tipo2').empty();
		$('#tipo2').append('para el ');
		$('.nprod').val('');
		$('.nprod').val(producto);
		$('.nprov').empty();
		$('.nprov').append(proveedor);
		$('.nprov').val('');
		$('.nprov').val(proveedor);
		$('#editarprods').show();
		$('#asignarprods').hide();
		$('#modalprodxprov').modal('show');
	});
}

function editado(idprod,idprov){
	var codigo = $('#codiprov').val();
	var precio = $('#preciounit').val();
	if (!codigo) {
		var codigo = false;
	}
	if (!precio) {
		var precio = false;
	}
	$.ajax({
		url: BASE_URL+'/proveedores/editado/'+idprod+'/'+idprov+'/'+codigo+'/'+precio,
        type: 'POST',
        dataType: 'json'
	})
	.done(function(data) {
		var prod = $('#nprod').val();
		$('#modalprodxprov').modal('hide');
            	$('.info1').empty();
            	$('.info1').append('el producto '+prod+' fue actualizado para el proveedor '+data[0]['prov']+' de forma exitosa');
	            $('#exito').slideDown('slow');
	            $('#exito').prop('hidden', false);
	            setTimeout(function(){
	                $('#exito').slideUp('slow');mostrarasignados(data[0]['idprov']);
	            },5000);
	});
}