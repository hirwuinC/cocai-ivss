$(document).ready(function() {
    $('#bt-cont').click(function(event) {
        $('#bt-enviar').trigger('click');      
    });
    $('#formdetails2').submit(function(event) {
        var tipo = $('#tipo').val();
        event.preventDefault();
        var enlace = $(this).attr('action');
        var formdata = $("#formdetails2").serialize();
        $.ajax({
            url: enlace,
            type: 'POST',
            data: formdata,
            dataType: 'json'
        })
        .done(function(data) {
            $('#modalmanual').modal('hide');
            tablapararecibir();
            
        })
        

        });
    burbujaspendientes();
    idt = $('#idtienda').val();
    //para redireccionar desde las notificaciones
    var tipe = $('#tipe').val();
    switch (tipe) {
        case '2':
            $('#envios').trigger('click');
            setTimeout(function(){
                $('#recibos').trigger('click');
            }, 600);
            
        break;
        case '3':
            $('#consultaR').trigger('click');
        break;
        case '4':
            $('#consultaE').trigger('click');
        break;
        default:
            $('#envios').trigger('click');
        break;
    }
    var fecha1 = new Date();
        if(fecha1.getMonth()+1<10){
        mes='0'+(fecha1.getMonth()+1);
        }else{
            mes =fecha1.getMonth()+1;
        } 
        if(fecha1.getDate()<10){
            dia='0'+(fecha1.getDate());
        }else{
            dia =fecha1.getDate();
        }
        //alert(mes); 
        var hoy = (fecha1.getFullYear()+"-"+(mes)+"-"+(dia));
        $('.desde').attr('max', hoy);
        $('.desde').val('');
        $('.desde').val(hoy);
        $('.hasta').attr('max', hoy);
        $('.hasta').attr('min', hoy);
        $('.hasta').val('');
        $('.hasta').val(hoy);
        $('#fecha1').attr('max', hoy);
        $('#fecha1').val('');
        $('#fecha1').val(hoy);
        $('#fecha2').attr('max', hoy);
        $('#fecha2').attr('min', hoy);
        $('#fecha2').val('');
        $('#fecha2').val(hoy);


        $('#fecha1').change(function(event) {
            var f1 = $('#fecha1').val();
            $.ajax({
                url: BASE_URL+'/compra/validarfechas/'+f1,
                type: 'POST',
                dataType: 'json'
            })
            .done(function(data) {
            $('#fecha2').attr('max', data['fechaf']);
            $('#fecha2').attr('min', data['fechai']);
            $('#fecha2').focus();

            });
            
            
        });

        $('.desde').change(function(event) {
            var f1 = $('.desde').val();
            $.ajax({
                url: BASE_URL+'/compra/validarfechas/'+f1,
                type: 'POST',
                dataType: 'json'
            })
            .done(function(data) {
            $('.hasta').attr('max', data['fechaf']);
            $('.hasta').attr('min', data['fechai']);
            $('.hasta').focus();

            });
            
            
        });


	
		
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
        $('#rmanual').css('display', 'none');
        $('#canceladas').css('display', 'none');
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
        $('#rmanual').css('display', 'none');
        $('#canceladas').css('display', 'none');
	});

	$('#consultaR').click(function(event) {
		$('#recibidas').css('display', 'block');
		$('#xrecibir').css('display', 'none');
		$('#xenviar').css('display', 'none');
		$('#enviadas').css('display', 'none');
        $('#rmanual').css('display', 'none');
        $('#canceladas').css('display', 'none');
	});

	$('#consultaE').click(function(event) {
		$('#enviadas').css('display', 'block');
		$('#recibidas').css('display', 'none');
		$('#xrecibir').css('display', 'none');
		$('#xenviar').css('display', 'none');
        $('#rmanual').css('display', 'none');
        $('#canceladas').css('display', 'none');
	});

    $('#cancels').click(function(event) {
        $('#canceladas').css('display', 'block');
        $('#recibidas').css('display', 'none');
        $('#xrecibir').css('display', 'none');
        $('#xenviar').css('display', 'none');
        $('#enviadas').css('display', 'none');
        $('#rmanual').css('display', 'none');
    });

    $('#manual').click(function(event) {
        tablaprodsmanual(idt);
        $('#rmanual').css('display', 'block');
        $('#recibidas').css('display', 'none');
        $('#xrecibir').css('display', 'none');
        $('#xenviar').css('display', 'none');
        $('#enviadas').css('display', 'none');
        $('#canceladas').css('display', 'none');
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

    $('#btn-consult3').click(function(event) {
        var status = 202
        var f1 = $('#fec1').val();
        var f2 = $('#fec2').val();
        tablacanceladas(idt,status,f1,f2);
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
            burbujaspendientes();
            
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

    $('#warning').click(function(event) {
        $('#modalexistencia').modal('show');
    });

});

function tablapararecibir(){
    var t8 = $('#tpararecibir').DataTable({
            "ajax": BASE_URL+'/transferencia/consultarsesion/',
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "codigo", className: "tdleft font11"},
                { "data": "nombre", className: "tdleft font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['marca']  
                        
                    }
                },
                { "data": "cantreci", className: "tdleft font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abreviaturar'] 
                    }
                },
                { "data": "numlote", className: "tdcenter font11"},        
                { "data": "fvencimiento", className: "tdcenter font11"}               
            ],
                "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": 0
                } ],
                //"order": [[ 1, 'asc' ]],
                destroy: true,
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tpararecibir').css("width","100%");
    t8.on( 'order.dt search.dt', function () {
    t8.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
        $('#tpararecibir_wrapper').removeClass('container-fluid');
        $('.finmanualr').fadeIn();
        $('.finmanualr').prop('hidden', false);
}

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
                { "data": "nombreremi", className: "tdleft font11",
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
                			return '<span class="fa fa-list-alt" title="Ver detalles de la requisicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+idt+',1)"></span>'+
                                    '<span class="fa fa-file-pdf-o ml-2" title="imprimir la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="printsolicitud('+row['reposicion_id']+',1)"></span>'+
                                    '<span class="fa fa-remove ml-2" title="Descartar y cancelar la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="anularrequisicion('+row['reposicion_id']+','+row['status_id']+','+idt+',1)"></span>'
                		}            
                       
                  } 
                }               
            ],
                "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": 0
                } ],
                //"order": [[ 1, 'asc' ]],
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
                			return ''+row['tiendaR']
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
                { "data": "nombreremi", className: "tdleft font11",
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
                            if (row['status_id'] == 126) {
                                return '<span class="fa fa-list-alt" title="La Solicitud aun no ha sido procesada por '+row['tiendaR']+'" style="cursor:help; cursor:pointer; color: red" onclick="detallesremi('+data+','+row['status_id']+','+row['idunt']+',2)"></span>'
                            }else{
                                return '<span class="fa fa-list-alt" title="Ver detalles de la remision '+row['num_remision']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesremi('+data+','+row['status_id']+','+row['idunt']+',2)"></span>'
                            }
                			
                        }else{
                            if (row['status_id'] == 129) {
                                return '<span class="fa fa-list-alt" title="La Solicitud aun no ha sido procesada por '+row['tiendaR']+'" style="cursor:hand; cursor:pointer; color: red" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+row['idunt']+',2)"></span>'+
                                        '<span class="fa fa-file-pdf-o ml-2" title="imprimir la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="printsolicitud('+row['reposicion_id']+',1)"></span>'+
                                        '<span class="fa fa-remove ml-2" title="Descartar y cancelar la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="anularrequisicion('+row['reposicion_id']+','+row['status_id']+','+row['idunt']+',2)"></span>'
                            }else{
                                return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+row['idunt']+',2)"></span>'+
                                        '<span class="fa fa-file-pdf-o ml-2" title="imprimir la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="printsolicitud('+row['reposicion_id']+',2)"></span>'
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
                //"order": [[ 1, 'asc' ]],
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
                { "data": "nombreremi", className: "tdleft font11",
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
                            return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+row['idunt']+',3)"></span>'+
                                    '<span class="fa fa-file-pdf-o ml-2" title="imprimir la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="printsolicitud('+row['reposicion_id']+',3)"></span>'
                        }
                       
                  } 
                }               
            ],
                "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": 0
                } ],
                //"order": [[ 1, 'asc' ]],
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
                { "data": "nombreremi", className: "tdleft font11",
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
                            return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+idt+',4)"></span>'+
                                    '<span class="fa fa-file-pdf-o ml-2" title="imprimir la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="printsolicitud('+row['reposicion_id']+',4)"></span>'
                        }
                       
                  } 
                }               
            ],
                "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": 0
                } ],
                //"order": [[ 1, 'asc' ]],
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

function tablaprodsmanual(idt){
    var groupColumn = 3;
	var table = $('#tablaprodmanual').DataTable({
            "ajax": BASE_URL+'/transferencia/productosm/'+idt,
            "columns": [

                { "data": "tienda", className: "tdleft font11"},
                { "data": "codigo", className: "tdleft font11"},
                { "data": "producto", className: "tdleft font11",
                	render : function(data,type, row){
                		return ''+data+' '+row['marca']
                	}
            	},
            	{ "data": "grupo", className: "tdleft font11"},        
                { "data": "familia", className: "tdleft "},               
                { "data": "subfamilia", className: "tdleft "},               
                { "data": "stock", className: "tdright ",
                    render : function(data,type, row){
                        return ''+data+' '+row['abreviaturaS']
                    }
                },
                { "data": "idP", className: "tdcenter ",
                    render : function(data,type, row){
                        return '<a href="#" onclick="modalcantidad('+data+','+row['idT']+')">Recibir</a>'
                    }
                }               
            ],
            "columnDefs": [
                { "visible": false, "targets": groupColumn }
            ],
            "order": [[ groupColumn, 'asc' ]],
                "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="7">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
            },
                //"order": [[ 1, 'asc' ]],
                destroy: true,
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tablaprodmanual tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === groupColumn && currentOrder[1] === 'asc' ) {
            table.order( [ groupColumn, 'desc' ] ).draw();
        }
        else {
            table.order( [ groupColumn, 'asc' ] ).draw();
        }
    } );
    $('#tablaprodmanual').css("width","100%");
        $('#tablaprodmanual_wrapper').removeClass('container-fluid');
}

function modalcantidad(idp,idt){
    $.ajax({
        url: BASE_URL+'/transferencia/detallesproducto/'+idp+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        $('#codipr').empty();
        $('#codipr').append(data[0]['codigo']);
        $('#idpro').val('');
        $('#idpro').val(idp);
        $('#idti').val('');
        $('#idti').val(idt);
        $('#umrid').empty();
        $('#umrid').append(data[0]['um_recepcion_id']);
        $('#umr').empty();
        $('#umr').append(data[0]['abreviaturar']);
        $('.titlemm').empty();
        $('.titlemm').append('Recibir el producto: '+data[0]['nombre']+' '+data[0]['marca']);
    });
    $('#modalmanual').modal('show');
}

function detallesremi(id,status,idt,tipo){
    $.ajax({
        url: BASE_URL+'/transferencia/detallesremi/'+id+'/'+status+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        if (status == 126) {
                $('#validarrecep').empty();
                $('#validarrecep').html('<b>La Solicitud aun no ha sido procesada por '+data["data"][0]['tiendar']+'</b>');   
            }else{
                $('#validarrecep').empty();
            }
        $('#validarrecep').empty();
        $('.titlemyt').empty();
        $('.titlemyt').append('Producto de la remision # '+data["data"][0]['num_remision']);
        tabladetallesremi(id,status,idt,tipo);
        $('#myModal').modal('show');
    });
    
}

function detallesrepo(id,status,idt,tipo){
    $.ajax({
        url: BASE_URL+'/transferencia/validarproductosrequisicion/'+id+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        $('#cuerpomodaler').empty();
        $('#numr').empty();
        if (data!=0){
            $('#numr').append(data[0]['num_reposicion']);
            $('#cuerpomodaler').append('<h5>Los siguientes productos de esta solicitud: </h5>');
            for (var i = 0; i < data.length; i++) {
                $('#cuerpomodaler').append('<h6 class="ml-3"><li>'+data[i]['nombre']+' '+data[i]['marca']+'</li></h6>');
            }
            $('#cuerpomodaler').append('<h5>No estan asignados a la unidad de negocio '+data[0]['tiendant']+'. Por favor comuniquese con el solicitante para cancelar esta solicitud.</h5>');
            $('#modaler').modal('show');
        }else{
            $.ajax({
                url: BASE_URL+'/transferencia/detallesrepo/'+id+'/'+status+'/'+idt,
                type: 'POST',
                dataType: 'json'
            })
            .done(function(data) {
                
                    $('.titlemyt').empty();
                    $('.titlemyt').append('Producto de la requisicion # '+data["data"][0]['num_reposicion']);
                    if (tipo == 1) {
                        $('#recept').hide();
                        $('#proccess').show();
                        $('#proccess').prop('hidden', false);
                    }else if (tipo == 2) {
                        $('#chofer').attr('readonly', true);
                        $('#placa').attr('readonly', true);
                        $('#sobre').attr('readonly', true);
                        $('#fechacarga').attr('readonly', true);
                        $('#chofer').val('');
                        $('#chofer').val(data["data"][0]['chofer']);
                        $('#placa').val('');
                        $('#placa').val(data["data"][0]['placa_vehiculo']);
                        $('#sobre').val('');
                        $('#sobre').val(data["data"][0]['num_sobre']);
                        $('#fechacarga').val('');
                        $('#fechacarga').val(data["data"][0]['fecha_carga']);
                        if (status == 129) {
                            $('#validarrecep').empty();
                            $('#validarrecep').append('La Solicitud aun no ha sido procesada por '+data["data"][0]['tiendar']);
                            $('#recept').prop('disabled', true);
                        }else{
                            $('#validarrecep').empty();
                            $('#recept').prop('disabled', false);
                        }
                        $('#proccess').hide();
                        $('#recept').show();
                        $('#recept').prop('hidden', false);
                    }else{
                        $('#validarrecep').empty();
                        $('#recept').hide();
                        $('#proccess').hide();
                    }
                    
                    tabladetallesrepo(id,status,idt,tipo);
                    $('#myModal').modal('show');
                
                
            });
        }     
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
                { "data": "cant", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsol']
                    }
                },
                { "data": "cant", className: "tdright font11 cnt",
                    render : function(data,type, row){
                        switch (tipo) {
                            case 1:
                                return '<div class="input-group" style="float: right;">'+
                                    '<input type="text" class="form-control form-control-sm monto" name="cantenv" id="cantenv1" value="'+data+'" onkeyup="evalualo()"" required>'+
                                    '<span class="input-group-addon btn-sm" id="basic-addon1">'+row['abrevsol']+'</span>'+
                                '</div>'
                            break;
                            case 2:
                                return ''+row['cantr']+' '+row['abrevsol']+'<input type="hidden" class="form-control form-control-sm monto" name="cantenv" id="cantenv1" value="'+row['cantr']+'" required readonly style="background: none; border:none">'
                            break;
                            case 3:
                                return ''+row['cantr']+' '+row['abrevsol']
                            break;
                            case 4:
                                return ''+row['cantr']+' '+row['abrevsol']
                            break;
                            
                            
                        }
                    }
                },
                { "data": "lote", className: "tdright font11",
                    render : function(data,type, row){
                        return '<div class="" style="float: right;">'+
                                    '<input type="text" class="form-control form-control-sm" name="lotenum" id="lotenum" placeholder="N° de lote" value="" required>'+
                                '</div>'
                        
                    }
                },
                { "data": "fecha_vence", className: "tdright font11",
                    render : function(data,type, row){
                        return '<div class="" style="float: right;">'+
                                    '<input type="date" class="form-control form-control-sm monto" name="fechavence" id="fechavence" value="" required>'+
                                '</div>'
                        
                    }
                },
                { "data": "stock", className: "tdright font11",
                    render : function(data,type, row){
                        if (tipo == 2 || tipo == 3) {
                            return ''+row['stockte']+' '+row['abrevsist']
                        }else{
                            return ''+data+' '+row['abrevsist']
                        }
                        
                    }
                },        
                { "data": "stmin", className: "tdright font11",
                    render : function(data,type, row){
                        if (tipo == 2 || tipo == 3) {
                            return ''+row['minte']+' '+row['abrevsist']
                        }else{
                            return ''+data+' '+row['abrevsist']
                        }
                        
                    } 
                },
                { "data": "idm", className: "tdcenter ",
                    render : function(data,type, row){
                        switch (tipo) {
                            case 1:
                                return '<a href="#" title="Procesar la remision '+row['num_remision']+'" onclick="procesarremi('+row['idr']+','+idt+','+data+','+row['idumsol']+')">Procesar</a>'
                            break;
                            case 2:
                                if (status == 126) {
                                    return '<a title="La remision '+row['num_remision']+' aun no ha sido procesada por '+row['tiendar']+'" style="color: red; cursor:help">Recibir</a>'
                                }else{
                                    return '<a href="#" title="Recibir la remision '+row['num_remision']+'" onclick="recibirremi('+row['idr']+','+row['idue']+','+data+','+row['idumsol']+')">Recibir</a>'
                                }
                                
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
                { "data": "cant", className: "tdright font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['abrevsol']
                    }
                },
                { "data": "cant", className: "tdright font11 cnt",
                    render : function(data,type, row){
                        switch (tipo) {
                            case 1:
                                evalualo(row['idm'],idt,row['reposicion_id']);
                                return '<div class="input-group" style="float: right;">'+
                                    '<input type="text" class="form-control form-control-sm monto" name="cantenv[]" id="cantenv'+row['idm']+''+row['reposicion_id']+'" value="'+data+'" onclick="formatealo('+row['idm']+','+idt+')" onkeyup="evalualo('+row['idm']+','+idt+','+row['reposicion_id']+')" autocomplete="off" required>'+
                                    '<input type="hidden" class="form-control form-control-sm" name="idmer[]" value="'+row['idm']+'">'+
                                    '<input type="hidden" class="form-control form-control-sm" name="idume[]" id="idume'+row['idm']+''+row['reposicion_id']+'" value="'+row['idumsol']+'">'+
                                    '<input type="hidden" class="form-control form-control-sm evaluar" id="valido'+row['idm']+''+row['reposicion_id']+'" >'+
                                    '<span class="input-group-addon btn-sm" id="basic-addon1">'+row['abrevsol']+'</span>'+
                                '</div>'
                            break;
                            case 2:
                                return ''+row['cantr']+' '+row['abrevsol']+'<input type="hidden" class="form-control form-control-sm monto" name="cantenv[]" id="cantenv" value="'+row['cantr']+'" required readonly style="background: none; border:none">'+
                                        '<input type="hidden" class="form-control form-control-sm" name="idmer[]" value="'+row['idm']+'">'+
                                        '<input type="hidden" class="form-control form-control-sm" name="idume[]" value="'+row['idumsol']+'">'
                            break;
                            case 3:
                                return ''+row['cantr']+' '+row['abrevsol']
                            break;
                            case 4:
                                return ''+row['cantr']+' '+row['abrevsol']
                            break;
                            
                            
                        }
                    }
                },
                { "data": "lote", className: "tdleft font11",
                    render : function(data,type, row){
                        switch (tipo) {
                            case 1:
                                return '<div class="input-group" style="float: right;">'+
                                    '<input type="text" class="form-control form-control-sm" name="lotenum[]" id="lotenum'+row['idm']+''+row['reposicion_id']+'" placeholder="N° de lote" value="" autocomplete="off" required>'+
                                '</div>'
                            break;
                            case 2:
                                return '<div class="input-group" style="float: right;">'+
                                    '<input type="text" class="form-control form-control-sm" name="lotenum[]" id="lotenum'+row['idm']+''+row['reposicion_id']+'" value="'+data+'" placeholder="N° de lote" autocomplete="off" required>'+
                                '</div>'
                            break;
                            case 3:
                                return ''+data+''
                            break;
                            case 4:
                                return ''+data+''
                            break;
                            
                            
                        }
                        
                        
                    }
                },
                { "data": "fecha_vencimiento", className: "tdleft font11",
                    render : function(data,type, row){
                        
                        switch (tipo) {
                            case 1:
                                return '<div class="" style="float: left;">'+
                                    '<input type="date" class="form-control form-control-sm" name="fvencimiento[]" id="fvencimiento'+row['idm']+''+row['reposicion_id']+'" value="" required>'+
                                '</div>'
                            break;
                            case 2:
                                return '<div class="" style="float: left;">'+
                                    '<input type="date" class="form-control form-control-sm" name="fvencimiento[]" id="fvencimiento'+row['idm']+''+row['reposicion_id']+'" value="'+data+'" required>'+
                                '</div>'
                            break;
                            case 3:
                                return ''+data+''
                            break;
                            case 4:
                                return ''+data+''
                            break;
                            
                            
                        }
                        
                    }
                },
                { "data": "stock", className: "tdright font11",
                    render : function(data,type, row){
                        if (tipo == 2 || tipo == 3) {
                            return ''+row['stockte']+' '+row['abrevsist']
                        }else{
                            return ''+data+' '+row['abrevsist']
                        }
                    }
                },        
                { "data": "stmin", className: "tdright font11",
                    render : function(data,type, row){
                        if (tipo == 2 || tipo == 3) {
                            return ''+row['minte']+' '+row['abrevsist']
                        }else{
                            return ''+data+' '+row['abrevsist']
                        }
                    } 
                },
                { "data": "idm", className: "tdcenter "}

            ],"columnDefs": [
                { "visible": false, "targets": 8 }/*,
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

function formatealo(idm,idt){
    $('.monto').number(true, 4, ',', '.');
}

function evalualo(idm,idt,idr){
    var cantidad = $('#cantenv'+idm+idr).val();
    var idum = $('#idume'+idm+idr).val();
    $.ajax({
        url: BASE_URL+'/transferencia/validarcantidades/'+idm+'/'+idt+'/'+cantidad+'/'+idum,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        //var resta1 = data[0]['existencia']-cantidad;
        if (data == 1) {
            //alert("existencia menor a cero");
            $('#mti').empty();  
            $('#mti').append('Existencia excedida');  
            $('#cuerpomodalex').empty();  
            $('#cuerpomodalex').append('La cantidad a enviar de al menos un producto, excede su existencia.<br>por favor verifique antes de poder completar la transferencia');
            $('#valido'+idm+idr).val('');
            $('#valido'+idm+idr).val(data);
            $('#cantenv'+idm+idr).css('color', 'red');
            $('#modalexistencia').modal('show');
        }else if (data == 2) {
            $('#mti').empty();  
            $('#mti').append('Existencia minima superada');
            $('#cuerpomodalex').empty();  
            $('#cuerpomodalex').append('El stock minimo de al menos uno de los productos sera superado.<br>Por favor proceda con precaucion');
            $('#valido'+idm+idr).val('');
            $('#valido'+idm+idr).val(data);
            $('#cantenv'+idm+idr).css('color', '#EAB31F');
            
            //alert("stock minimo superado");
        }else if (data == 3) {
            $('#mti').empty();  
            $('#mti').append('Existencia agotada');
            $('#cuerpomodalex').empty();  
            $('#cuerpomodalex').append('La existencia de al menos un producto quedara en cero(0).<br> Por favor proceda con precaucion');
           // alert("existencia sera cero");
            $('#valido'+idm+idr).val('');
            $('#valido'+idm+idr).val(data);
            $('#cantenv'+idm+idr).css('color', '#FA6E21');
            
        }else{
            //alert("permitidio");
            $('#valido'+idm+idr).val('');
            $('#valido'+idm+idr).val(data);
            $('#cantenv'+idm+idr).css('color', '#464a4c');
            
        }
       
        var check = activaodesactiva();
        if(check == 4) {
            $('#proccess').prop('disabled', false);
            $('#warning').hide();
        }else if (check == 3) {
            $('#warning').css('color', '#FA6E21');
            $('#proccess').prop('disabled', false);
            $('#warning').show();
            $('#warning').prop('hidden', false);
        }else if (check == 2) {
            $('#warning').css('color', '#EAB31F');
            $('#proccess').prop('disabled', false);
            $('#warning').show();
            $('#warning').prop('hidden', false);
        }else {
            $('#warning').css('color', 'red');
            $('#warning').show();
            $('#warning').prop('hidden', false);
            $('#proccess').prop('disabled', true);
        }
        
    });
    
}

    function activaodesactiva() {
        var validos = 4;
        $("input.evaluar").each(function() {
        var $this = $(this);
                if( $this.val() == 1 ) {
                    validos = $this.val();
                    return validos;
                }else if ($this.val() == 2) {
                    validos = $this.val();
                    return validos;
                }else if ($this.val() == 3) {
                    validos = $this.val();
                    return validos;
                }
        });
        if(validos == 1) {
            return validos;
        }else if (validos == 2) {
            return validos;
        }else {
            return validos;
        }
    }

function burbujaspendientes(){
    var idt = $('#idtienda').val();
    //para agregar la cantidad de envios pendientes por recibir y por enviar
$.ajax({
        url: BASE_URL+'/transferencia/contartransferencias/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        xe = data[0]['xenviar'];
        xr = data[0]['xrecibir'];
        if (xe == 0) {
            $('#xe').empty();
        }else if (xe >9) {
            $('#xe').empty();
            $('#xe').append('<h6 style="background: #d9534f; color:white; font-size: 11px; border-radius: 50px; padding:3px 3px 3px 3px">9+</h6>');
        }else{
            $('#xe').empty();
            $('#xe').append('<h6 style="background: #d9534f; color:white; font-size: 11px; border-radius: 50px; padding:1px 4px 1px 4px">'+xe+'</h6>');
        }
        if (xr == 0) {
            $('#xr').empty();
        }else if (xr >9) {
            $('#xr').empty();
            $('#xr').append('<h6 style="background: #d9534f; color:white; font-size: 11px; border-radius: 50px; padding:3px 3px 3px 3px">9+</h6>');
        }else{
            $('#xr').empty();
            $('#xr').append('<h6 style="background: #d9534f; color:white; font-size: 11px; border-radius: 50px; padding:1px 4px 1px 4px">'+xr+'</h6>');
        }
    
    });
}

function anularrequisicion(idr,status_id,idt,tipo){
    $.ajax({
        url: BASE_URL+'/transferencia/detallesrepo/'+idr+'/'+status_id+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        $('#numer').empty();
        $('#numer').append(data["data"][0]['num_reposicion']);
        
        
    });
    $('#modalanularreq').modal('show');
    $('#anularrepo').click(function(event) {
        anulada(idr,status_id,idt,tipo);
    });
    
}

function anulada(idr,status_id,idt,tipo){
    $.ajax({
        url: BASE_URL+'/transferencia/anularrequisiciones/'+idr,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        $('#modalanularreq').modal('hide');
        $('.enviaorecibe').empty();
        $('.enviaorecibe').append('La solicitud N°'+data[0]['num_reposicion']+' fue cancelada de forma exitosa');
        $('#procesada').slideDown('slow');
        $('#procesada').prop('hidden', false);
        if (tipo == 1) {
            var st1 = 126;
            var st2 = 129;
            setTimeout(function(){
                $('#envios').trigger('click');
                $('#procesada').slideUp('slow');
            },5000);
        }else{
            var st1 = 127;
            var st2 = 201;
            setTimeout(function(){
                $('#recibos').trigger('click');
                $('#procesada').slideUp('slow');
            },5000);
            
        }
    });
}

function tablacanceladas(idt,status,f1,f2){
    var tc = $('#tablacanceladas').DataTable({
            "ajax": BASE_URL+'/transferencia/consultarcanceladas/'+idt+'/'+status+'/'+f1+'/'+f2,
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
                { "data": "nombreremi", className: "tdleft font11",
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
                            return '<span class="fa fa-list-alt" title="Ver detalles de la remision '+row['num_remision']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesremi('+data+','+row['status_id']+','+row['idunt']+',4)"></span>'
                        }else{
                            return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesrepo('+row['reposicion_id']+','+row['status_id']+','+row['idunt']+',4)"></span>'+
                                    '<span class="fa fa-file-pdf-o ml-2" title="imprimir la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="printsolicitud('+row['reposicion_id']+',5)"></span>'
                        }
                       
                  } 
                }               
            ],
                "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": 0
                } ],
                //"order": [[ 1, 'asc' ]],
                destroy: true,
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tablacanceladas').css("width","100%");
    tc.on( 'order.dt search.dt', function () {
    tc.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
        $('#tablacanceladas_wrapper').removeClass('container-fluid');
    
}

    function printsolicitud(idr,tipo){
        switch (tipo) {
            case 1:
                var url = BASE_URL+'printer?r='+idr+'&st1=126&st2=129&tipo='+tipo;
            break;
            case 2:
                var url = BASE_URL+'printer?r='+idr+'&st1=127&st2=201&tipo='+tipo; 
            break;
            case 3:
                var f1 = $('#desde').val();
                var f2 = $('#hasta').val();
                var url = BASE_URL+'printer?r='+idr+'&st1=128&st2=134&tipo='+tipo+'&f1='+f1+'&f2='+f2;
            break;
            case 4:
                var f1 = $('#fecha1').val();
                var f2 = $('#fecha2').val();
                var url = BASE_URL+'printer?r='+idr+'&st1=128&st2=134&tipo='+tipo+'&f1='+f1+'&f2='+f2;  
            break;
            case 5:
                var f1 = $('#fec1').val();
                var f2 = $('#fec2').val();
                var url = BASE_URL+'printer?r='+idr+'&st1=202&st2=202&tipo='+tipo+'&f1='+f1+'&f2='+f2;  
            break;
        }
        abrir_emergente(url);
    }
    

