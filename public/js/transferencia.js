$(document).ready(function() {
	$('#envios').trigger('click');
		idt = $('#idtienda').val();
		var st1 = 126;
		var st2 = 129;
		var tipo = 1;
		$.ajax({
			url: BASE_URL+'/transferencia/notificacion/'+idt+'/'+st1+'/'+st2+'/'+tipo,
	        type: 'POST',
	        dataType: 'json'
		})
		.done(function(data) {
			tablaxenviar(idt,st1,st2,tipo);
		});

	$('#envios').click(function(event) {
		var st1 = 126;
		var st2 = 129;
		var tipo = 1;
		tablaxenviar(idt,st1,st2,tipo);
		$('#xenviar').css('display', 'block');
		$('#xrecibir').css('display', 'none');
		$('#recibidas').css('display', 'none');
		$('#enviadas').css('display', 'none');
	});

	$('#recibos').click(function(event) {
		var st1 = 127;
		var st2 = 201;
		var tipo = 2;
		tablaxrecibir(idt,st1,st2,tipo);
		$('#xrecibir').css('display', 'block');
		$('#xenviar').css('display', 'none');
		$('#recibidas').css('display', 'none');
		$('#enviadas').css('display', 'none');
	});

	$('#consultaR').click(function(event) {
		$('#recibidas').css('display', 'block');
		$('#xrecibir').css('display', 'none');
		$('#xenviar').css('display', 'none');
		$('#enviadas').css('display', 'none');
	});

	$('#consultaE').click(function(event) {
		$('#enviadas').css('display', 'block');
		$('#recibidas').css('display', 'none');
		$('#xrecibir').css('display', 'none');
		$('#xenviar').css('display', 'none');
	});

    $('#btn-consult').click(function(event) {
        var st1 = 128;
        var st2 = 134;
        var tipo = 2;
        var f1 = $('#desde').val();
        var f2 = $('#hasta').val();
        tablarecibidas(idt,st1,st2,tipo,f1,f2);
    });

    $('#btn-consult2').click(function(event) {
        var st1 = 128;
        var st2 = 134;
        var tipo = 1;
        var f1 = $('#fecha1').val();
        var f2 = $('#fecha2').val();
        tablaenviadas(idt,st1,st2,tipo,f1,f2);
    });

    $('#formdetails').submit(function(event) {
        var tipo = $('#tipo').val();
        event.preventDefault();
        var enlace = $(this).attr('action');
        var formdata = $("#formdetails").serialize();
        $.ajax({
            url: enlace,
            type: 'POST',
            data: formdata,
            dataType: 'json'
        })
        .done(function(data) {
            $('#myModal').modal('hide');
            var idt = $('#idtienda').val();
            if (tipo == 1) {
                var st1 = 126;
                var st2 = 129;
                var tipos = 1;
                $('.enviaorecibe').empty();
                $('.enviaorecibe').append('Mercancia enviada de forma exitosa');
            }else{
                var st1 = 127;
                var st2 = 201;
                var tipos = 2;
                $('.enviaorecibe').empty();
                $('.enviaorecibe').append('Mercancia recibida de forma exitosa');
            }
            $('#procesada').slideDown('slow');
            $('#procesada').prop('hidden', false);
            setTimeout(function(){
                tablaxenviar(idt,st1,st2,tipos);
                tablaxrecibir(idt,st1,st2,tipos);
                $('#procesada').slideUp('slow');
            },5000);
            
        })
        .fail(function(data) {
            $('#myModal').modal('hide');
            var idt = $('#idtienda').val();
            if (tipo == 1) {
                var st1 = 126;
                var st2 = 129;
                var tipos = 1;
                $('.enviaorecibe').empty();
                $('.enviaorecibe').append('El envio de la mercancia no pudo ser procesado <br> <h6>Por favor intente nuevamente</h6>');
            }else{
            var st1 = 127;
                var st2 = 201;
                var tipos = 2;                    
                $('.enviaorecibe').empty();
                $('.enviaorecibe').append('La recepcion de la mercancia no pudo ser procesada <br> <h6>Por favor intente nuevamente</h6>');
            }
            $('#erroralprocesar').slideDown('slow');
            $('#erroralprocesar').prop('hidden', false);
            setTimeout(function(){
                tablaxenviar(idt,st1,st2,tipos);
                tablaxrecibir(idt,st1,st2,tipos);
                $('#erroralprocesar').slideUp('slow');
            },5000);

        });
    });

    $('#proccess').click(function(event) {
        var idr = $('#idrepos').val();
        var idt = $('#idtienda').val();
        procesarrepo(idr,idt);
    });

    $('#recept').click(function(event) {
        var idr = $('#idrepos').val();
        var idt = $('#idtienda').val();
        recibirrepo(idr,idt);
    });

});

function tablaxenviar(idt,st1,st2,tipo){
	var t1 = $('#tablaxenviar').DataTable({
            "ajax": BASE_URL+'/transferencia/notificacion/'+idt+'/'+st1+'/'+st2+'/'+tipo,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "tiendaremi", className: "tdleft font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+''
                		}else{
                			return ''+row['tiendarepo']
                		}
                		
                	}
            	},
                { "data": "num_remision", className: "tdleft font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+''
                		}else{
                			return ''+row['num_reposicion']
                		}
                		
                	}
            	},
                { "data": "nombreremi", className: "tdcenter font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+' '+row['apellidoremi']
                		}else{
                			return ''+row['nombrerepo']+' '+row['apellidorepo']
                		}
                		
                	}
            	},
            	{ "data": "fecharemi", className: "tdcenter font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+'<br/>'+row['horaremi']
                		}else{
                			return ''+row['fecharepo']+'<br/>'+row['horarepo']
                		}
                		
                	}
            	},        
                { "data": "remision_id", className: "tdcenter ",
                    render : function(data, type, row) {
                    	if (row['reposicion_id'] == 0) {
                			return '<span class="fa fa-list-alt" title="Ver detalles de la remision '+row['num_remision']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesremi('+data+','+row['status_id']+','+idt+',1)"></span>'
                		}else{
                			return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+idt+',1)"></span>'
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
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tablaxenviar').css("width","100%");
    t1.on( 'order.dt search.dt', function () {
    t1.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
        $('#tablaxenviar_wrapper').removeClass('container-fluid');
}

function tablaxrecibir(idt,st1,st2,tipo){
	var t2 = $('#tablaxrecibir').DataTable({
            "ajax": BASE_URL+'/transferencia/notificacion/'+idt+'/'+st1+'/'+st2+'/'+tipo,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "tiendaR", className: "tdleft font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+''
                		}else{
                			return ''+row['tiendarepo']
                		}
                		
                	}
            	},
                { "data": "num_remision", className: "tdleft font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+''
                		}else{
                			return ''+row['num_reposicion']
                		}
                		
                	}
            	},
                { "data": "nombreremi", className: "tdcenter font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+' '+row['apellidoremi']
                		}else{
                			return ''+row['nombrerepo']+' '+row['apellidorepo']
                		}
                		
                	}
            	},
            	{ "data": "fecharemi", className: "tdcenter font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+'<br/>'+row['horaremi']
                		}else{
                			return ''+row['fecharepo']+'<br/>'+row['horarepo']
                		}
                		
                	}
            	},        
                { "data": "remision_id", className: "tdcenter ",
                    render : function(data, type, row) {
                    	if (row['reposicion_id'] == 0) {
                			return '<span class="fa fa-list-alt" title="Ver detalles de la remision '+row['num_remision']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesremi('+data+','+row['status_id']+','+row['idunt']+',2)"></span>'
                        }else{
                            return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+row['idunt']+',2)"></span>'
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
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tablaxrecibir').css("width","100%");
    t2.on( 'order.dt search.dt', function () {
    t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
        $('#tablaxrecibir_wrapper').removeClass('container-fluid');
}

function tablarecibidas(idt,st1,st2,tipo,f1,f2){
	var t3 = $('#tablarecibidas').DataTable({
            "ajax": BASE_URL+'/transferencia/notificacion/'+idt+'/'+st1+'/'+st2+'/'+tipo+'/'+f1+'/'+f2,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "tiendaR", className: "tdleft font11"},
                { "data": "num_remision", className: "tdleft font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+''
                		}else{
                			return ''+row['num_reposicion']
                		}
                		
                	}
            	},
                { "data": "nombreremi", className: "tdcenter font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+' '+row['apellidoremi']
                		}else{
                			return ''+row['nombrerepo']+' '+row['apellidorepo']
                		}
                		
                	}
            	},
            	{ "data": "fecharemi", className: "tdcenter font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+'<br/>'+row['horaremi']
                		}else{
                			return ''+row['fecharepo']+'<br/>'+row['horarepo']
                		}
                		
                	}
            	},        
                { "data": "remision_id", className: "tdcenter ",
                    render : function(data, type, row) {
                    	if (row['reposicion_id'] == 0) {
                			return '<span class="fa fa-list-alt" title="Ver detalles de la remision '+row['num_remision']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesremi('+data+','+row['status_id']+','+row['idunt']+',3)"></span>'
                        }else{
                            return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+row['idunt']+',3)"></span>'
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
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tablarecibidas').css("width","100%");
    t3.on( 'order.dt search.dt', function () {
    t3.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
        $('#tablarecibidas_wrapper').removeClass('container-fluid');
}

function tablaenviadas(idt,st1,st2,tipo,f1,f2){
	var t4 = $('#tablaenviadas').DataTable({
            "ajax": BASE_URL+'/transferencia/notificacion/'+idt+'/'+st1+'/'+st2+'/'+tipo+'/'+f1+'/'+f2,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "tiendaremi", className: "tdleft font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+''
                		}else{
                			return ''+row['tiendarepo']
                		}
                		
                	}
            	},
                { "data": "num_remision", className: "tdleft font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+''
                		}else{
                			return ''+row['num_reposicion']
                		}
                		
                	}
            	},
                { "data": "nombreremi", className: "tdcenter font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+' '+row['apellidoremi']
                		}else{
                			return ''+row['nombrerepo']+' '+row['apellidorepo']
                		}
                		
                	}
            	},
            	{ "data": "fecharemi", className: "tdcenter font11",
                	render : function(data,type, row){
                		if (row['reposicion_id'] == 0) {
                			return ''+data+'<br/>'+row['horaremi']
                		}else{
                			return ''+row['fecharepo']+'<br/>'+row['horarepo']
                		}
                		
                	}
            	},        
                { "data": "remision_id", className: "tdcenter ",
                    render : function(data, type, row) {
                    	if (row['reposicion_id'] == 0) {
                			return '<span class="fa fa-list-alt" title="Ver detalles de la remision '+row['num_remision']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesremi('+data+','+row['status_id']+','+idt+',4)"></span>'
                        }else{
                            return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+idt+',4)"></span>'
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
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tablaenviadas').css("width","100%");
    t4.on( 'order.dt search.dt', function () {
    t4.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
        $('#tablaenviadas_wrapper').removeClass('container-fluid');
}

function detallesremi(id,status,idt,tipo){
    $.ajax({
        url: BASE_URL+'/transferencia/detallesremi/'+id+'/'+status+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        $('.titlemyt').empty();
        $('.titlemyt').append('Producto de la remision # '+data["data"][0]['num_remision']);
        tabladetallesremi(id,status,idt,tipo);
        $('#myModal').modal('show');
    });
    
}

function detallesrepo(id,status,idt,tipo){
    $.ajax({
        url: BASE_URL+'/transferencia/detallesrepo/'+id+'/'+status+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        $('.titlemyt').empty();
        $('.titlemyt').append('Producto de la reposicion # '+data["data"][0]['num_reposicion']);
        if (tipo == 1) {
            $('#recept').hide();
            $('#proccess').show();
            $('#proccess').prop('hidden', false);
        }else if (tipo == 2) {
            $('#proccess').hide();
            $('#recept').show();
            $('#recept').prop('hidden', false);
        }else{
            $('#recept').hide();
            $('#proccess').hide();
        }
        
        tabladetallesrepo(id,status,idt,tipo);
        $('#myModal').modal('show');
    });
}

function tabladetallesremi(id,status,idt,tipo){
    var t5 = $('#tabladetallesremi').DataTable({
            "ajax": BASE_URL+'/transferencia/detallesremi/'+id+'/'+status+'/'+idt,
            "columns": [
                { "data": "codim", className: "tdleft font11"},
                { "data": "producto", className: "tdleft font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['marca']
                    }
                },
                { "data": "cantidad", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsol']
                    }
                },
                { "data": "cantidad", className: "tdright font11 cnt",
                    render : function(data,type, row){
                        switch (tipo) {
                            case 1:
                                return '<div class="input-group" style="float: right;">'+
                                    '<input type="text" class="form-control form-control-sm monto" name="cantenv" id="cantenv" value="'+data+'" onkeyup="format(this)" required>'+
                                    '<span class="input-group-addon btn-sm" id="basic-addon1">'+row['abrevsol']+'</span>'+
                                '</div>'
                            break;
                            case 2:
                                return ''+row['cantidad_recibida']+' '+row['abrevsol']+'<input type="hidden" class="form-control form-control-sm monto" name="cantenv" id="cantenv" value="'+row['cantidad_recibida']+'" required readonly style="background: none; border:none">'
                            break;
                            case 3:
                                return ''+row['cantidad_recibida']+' '+row['abrevsol']
                            break;
                            case 4:
                                return ''+row['cantidad_recibida']+' '+row['abrevsol']
                            break;
                            
                            
                        }
                    }
                },
                { "data": "existencia", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsist']
                    }
                },        
                { "data": "stock_min", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsist']
                    } 
                },
                { "data": "idm", className: "tdcenter ",
                    render : function(data,type, row){
                        switch (tipo) {
                            case 1:
                                return '<a href="#" title="Procesar la remision '+row['num_remision']+'" onclick="procesarremi('+row['idr']+','+idt+','+data+','+row['idumsol']+')">Procesar</a>'
                            break;
                            case 2:
                                return '<a href="#" title="Recibir la remision '+row['num_remision']+'" onclick="recibirremi('+row['idr']+','+row['idue']+','+data+','+row['idumsol']+')">Recibir</a>'
                            break;
                            case 3:
                                return 'Recibido'
                            break;
                            case 4:
                                return 'Enviado'
                            break;
                            
                            
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
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tabladetallesremi').css("width","100%");
    
        $('#tabladetallesremi_wrapper').removeClass('container-fluid');
}

function tabladetallesrepo(id,status,idt,tipo){
    $('#idrepos').val('');
    $('#idrepos').val(id);
    var t6 = $('#tabladetallesremi').DataTable({
            "ajax": BASE_URL+'/transferencia/detallesrepo/'+id+'/'+status+'/'+idt,
            "columns": [
                { "data": "codim", className: "tdleft font11"},
                { "data": "producto", className: "tdleft font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['marca']
                    }
                },
                { "data": "cantidad", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsol']
                    }
                },
                { "data": "cantidad", className: "tdright font11 cnt",
                    render : function(data,type, row){
                        switch (tipo) {
                            case 1:
                                return '<div class="input-group" style="float: right;">'+
                                    '<input type="text" class="form-control form-control-sm monto" name="cantenv[]" id="cantenv" value="'+data+'" onkeyup="format(this)" required>'+
                                    '<input type="hidden" class="form-control form-control-sm" name="idmer[]" value="'+row['idm']+'">'+
                                    '<input type="hidden" class="form-control form-control-sm" name="idume[]" value="'+row['idumsol']+'">'+
                                    '<span class="input-group-addon btn-sm" id="basic-addon1">'+row['abrevsol']+'</span>'+
                                '</div>'
                            break;
                            case 2:
                                return ''+row['cantidad_recibida']+' '+row['abrevsol']+'<input type="hidden" class="form-control form-control-sm monto" name="cantenv[]" id="cantenv" value="'+row['cantidad_recibida']+'" required readonly style="background: none; border:none">'+
                                        '<input type="hidden" class="form-control form-control-sm" name="idmer[]" value="'+row['idm']+'">'+
                                        '<input type="hidden" class="form-control form-control-sm" name="idume[]" value="'+row['idumsol']+'">'
                            break;
                            case 3:
                                return ''+row['cantidad_recibida']+' '+row['abrevsol']
                            break;
                            case 4:
                                return ''+row['cantidad_recibida']+' '+row['abrevsol']
                            break;
                            
                            
                        }
                    }
                },
                { "data": "existencia", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsist']
                    }
                },        
                { "data": "stock_min", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsist']
                    } 
                },
                { "data": "idm", className: "tdcenter "}

            ],"columnDefs": [
                { "visible": false, "targets": 6 }/*,
                { "visible": true, "orderable": false, "targets": [0,1,2,3,4] }*/
            ],
                
                "order": [[ 1, 'asc' ]],
                destroy: true,
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tabladetallesremi').css("width","100%");
    
    
        $('#tabladetallesremi_wrapper').removeClass('container-fluid');

}

function procesarremi(idr,idt,idm,idum){
    $('#tipo').val('');
    $('#tipo').val(1);
    $('#formdetails').attr('action', BASE_URL+'transferencia/procesarRemision/'+idr+'/'+idt+'/'+idm+'/'+idum);
    $('#btn-subm').trigger('click');
}

function recibirremi(idr,idt,idm,idum){
    $('#tipo').val('');
    $('#tipo').val(2);
    $('#formdetails').attr('action', BASE_URL+'transferencia/recibirRemision/'+idr+'/'+idt+'/'+idm+'/'+idum);
    $('#btn-subm').trigger('click');
}

function procesarrepo(idr,idt){
    $('#tipo').val('');
    $('#tipo').val(1);
    $('#formdetails').attr('action', BASE_URL+'transferencia/procesarreposicion/'+idr+'/'+idt);
    $('#btn-subm').trigger('click');
}

function recibirrepo(idr,idt){
    $('#tipo').val('');
    $('#tipo').val(2);
    $('#formdetails').attr('action', BASE_URL+'transferencia/recibirReposicion/'+idr+'/'+idt);
    $('#btn-subm').trigger('click');
}

