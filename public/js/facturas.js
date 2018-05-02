$(document).ready(function() {
	load('direccion','estado',false);
	load('proveedor','selectp',false);
    load('unidad_medida','unidad_medida_c',false);
    $('#totalfact').number(true, 4, ',', '.');
    $('#ingresar').trigger('click');
    var idt= $('#idtienda').val();
    $('#num_factura').keyup(function(event) {
        var numerof = $('#num_factura').val();
        $('.Facturanum').empty();
        $('.Facturanum').append(numerof);
        if (numerof.length>0) {
            $('#btnseleccion').prop('disabled', false);
            $('#btnseleccion').attr('title', 'Seleccionas productos');
        }else{
            $('#btnseleccion').prop('disabled', true);
            $('#btnseleccion').attr('title', 'Ingrese el numero de factura para continuar');
        }
    });
    $('#ingresar').click(function(event) {
        $('#consults').hide();
        $('#insert').show();
    });

    $('#consultas').click(function(event) {
        $('#insert').hide();
        $('#consults').show();
    });


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
        $('#fechac').attr('max', hoy);
        $('#fechac').val('');
        $('#fechac').val(hoy);
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

        $('#btn-consult').click(function(event) {
            consultasF(1);
        });

    $('#selectp').change(function(event) {
        $('#infoproveedor').fadeIn();
        $('#infoproveedor').prop('hidden', false);
    });

    $('#infoproveedor').click(function(event) {
        var prov = $('#selectp').val();
        infodelproveedor(prov);
    });

    $('#unidad_medida_c').change(function(event) {
        var cant = $('#cantidad').val();
        var idmcom = $('#unidad_medida_c').val();
        var precio = $('#precioc').val();
        var mcom = $('#unidad_medida_c option:selected').text();
        var textumc = mcom.replace("(s)", "");
        $.ajax({
            url: BASE_URL+'/inventario/setunidadT/'+idmcom,
            type: 'POST',
            dataType: 'json'
        })
        .done(function(data) {
            $('#abreviatura').val('');
            $('#abreviatura').val(data[0]['abreviatura']);
        });
        
        $('.uc').empty();
        $('.uc').text(textumc);
        $('#uc').text(mcom);
        if (idmcom == 8 || idmcom == 9 || idmcom == 10 || idmcom == 11 || idmcom == 16 || idmcom == 19 || idmcom == 23 ) {
            $('#canti').prop('hidden', false);
            $('#canti').slideDown();
        }else{
            $('#canti').slideUp();        
        }
        if (cant.length>0 && precio.length>0) {
            $('#guardarm').prop('disabled', false);
        }else{
            $('#guardarm').prop('disabled', true);
        }
    });

    $('.monto').keyup(function(event) {
        var cant = $('#cantidad').val();
        var precio = $('#precioc').val();
        var idmcom = $('#unidad_medida_c').val();
        if (cant > 0 && idmcom!=null && precio>0) {
            $('#guardarm').prop('disabled', false);
        }else{
            $('#guardarm').prop('disabled', true);
        }
    });

    $('#formproductos').submit(function(event) {
        var edit = $('#edit').val();
        event.preventDefault();
        var formdata = $("#formproductos").serialize();
        $.ajax({
            url: BASE_URL+'/compra/tablaproductos/1',
            type: 'POST',
            data: formdata,
            dataType: 'json'
        })
        .done(function(data) {
            $('#modalcant').modal('hide');
            mostrartablacomprar();
        });
        if (edit == 1) {
            validartotal();
        }
    });

    $('#exento').prop('checked', 'checked');

    $('#exento').click(function(event) {
        $('#impuesto').number(true, 0, ',', '.');
        if ($('#exento').is(':checked')) {
            $('#porciento').fadeOut();
            $('#impuesto').val('');
            $('#impuesto').val(0);
        }else{
            $('#porciento').fadeIn();
            $('#porciento').prop('hidden', false);
        }
    });

    $('#impuesto').keyup(function(event) {
        var imp = $('#impuesto').val();
        if (imp>100) {
            $('#impuesto').css('color', 'red');
            $('#infoimpuesto').show();
            $('#infoimpuesto').prop('hidden', false);
            $('#procesar').prop('disabled', false);
        }else{
            $('#impuesto').css('color', '#464a4c');
            $('#infoimpuesto').prop('hidden', true);
            $('#procesar').prop('disabled', false);
        }
    });

    $('#formfactura').submit(function(event) {
        event.preventDefault();
        var idT = $('#idtienda').val();
        var formdata = $("#formfactura").serialize();
        $.ajax({
            url: BASE_URL+'/compra/procesarfactura/'+idT,
            type: 'POST',
            data: formdata,
            dataType: 'json'
        })
        .done(function(data) {
            $('#tablaoculta').fadeOut(400);
            $('#botones').fadeOut(400);
            $('#facturaOK').slideDown();
            $('#facturaOK').prop('hidden', false);
            setTimeout(function() {$('#facturaOK').slideUp(500);}, 6000);
        })
        .fail(function(datos){
            $('#facturaerror').slideDown();
            $('#facturaerror').prop('hidden', false);
            setTimeout(function() {$('#facturaerror').slideUp(500);}, 6000);
        });
    });

    $('#cancelarproceso').click(function(event) {
        $('#modalcancel').modal('show');
    });

    $('#cancel').click(function(event) {
        $.ajax({
            url: BASE_URL+'/compra/vaciarsesion/',
            type: 'POST',
            dataType: 'json'
        })
         .done(function(data) {
            $('#modalcancel').modal('hide');
            
            $('#tablaoculta').fadeOut(400);
            $('#botones').fadeOut(400);
         });
    });

    $('#procesar').click(function(event) {
        $('#subFormFactura').trigger('click');
    });

	$('.house').click(function(event) {
        $('#dir-prov').show();
        $('#casa').show();
        $('#edif').hide();
        $('#edificio').prop('disabled', true);
        $('#intercomunicador').prop('disabled', true);
        $('#casa').prop('disabled', false);
        $('#dir-prov').prop('hidden', false);
        $('#house').prop('hidden', false);
        $('#edif').prop('hidden', false);
        $('#numint').prop('hidden', true);
        $('#ptoref').addClass('col-sm-offset-1');
        $('#ptoref').removeClass('col-sm-offset-0');
    });
    $('#building').click(function(event) {
        $('#dir-prov').show();
        $('#edif').show();
        $('#casa').hide();
        $('#casa').prop('disabled', true);
        $('#edificio').prop('disabled', false);
        $('#intercomunicador').prop('disabled', false);
        $('#dir-prov').prop('hidden', false);
        $('#house').prop('hidden', true);
        $('#edif').prop('hidden', false);
        $('#numint').prop('hidden', false);
        $('#ptoref').addClass('col-sm-offset-0');
        $('#ptoref').removeClass('col-sm-offset-1');
    });

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
    tablaing(idt);
    
});

function infodelproveedor(prov){
    $.ajax({
            url: BASE_URL+'/compra/datosproveedor/'+prov,
            type: 'POST',
            dataType: 'json'
        })
        .done(function(data) {
            $('#nombreprov').empty();
            $('#nombreprov').append(data[0]['nombreprov']);
            $('#rifprov').empty();
            $('#rifprov').append(data[0]['rif']);
            $('#razonprov').empty();
            $('#razonprov').append(data[0]['razon_social']);
            $('#correoprov').empty();
            $('#correoprov').append(data[0]['correo']);
            $('#estado').empty();
            $('#estado').append(data[0]['estado']);
            $('#municipio').empty();
            $('#municipio').append(data[0]['municipio']);
            $('#parroquia').empty();
            $('#parroquia').append(data[0]['parroquia']);
            $('#urbanizacion').empty();
            $('#urbanizacion').append(data[0]['urbanizacion']);
            $('#calle').empty();
            $('#calle').append(data[0]['calle']);
            $('#edificio').empty();
            $('#edificio').append(data[0]['edificio']);
            $('#tlf').empty();
            $('#tlf').append(data[0]['cod_tlf']+'-'+data[0]['numero']);

            
        });
        $('#modalinfoprov').modal('show');
}

function mostrartablacomprar(){
    $('#tablaoculta').hide();
    $('#loading').fadeIn();
    $('#loading').prop('hidden', false);
    var idt = $('#idtienda').val();
        $.ajax({
            url: BASE_URL+'/compra/datoscompra',
            type: 'POST',
            dataType: 'json'
        })
        .done(function(data) {
            var valor = data["data"].length;
            $('#loading').fadeOut();
            if (valor!=0) {
            setTimeout(function(){$('#tablaoculta').fadeIn('slow');$('#tablaoculta').prop('hidden', false);$('#botones').fadeIn('slow');$('#botones').prop('hidden', false);},1100);
            var moneda = $('#monedatienda').val();
           var t2 = $('#tablacompra').DataTable({
            "ajax": BASE_URL+'/compra/datoscompra',
            "lengthChange": false,
            "columns": [
                { "data": null, className: "tdcenter"},
                { "data": "codigo", className: "tdleft"},
                { "data": "nombre", className: "tdleft",
                    render : function(data, type, row) {
                        //var ingr = row['ingrediente'].replace(/ /gi, "@"); 
                        return ''+data+' '+row['marca']
                    }
                },
                { "data": "cantidad", className: "tdright",
                    render : function(data, type, row) {
                        var ca = parseFloat(data);
                        var cantidad = ca.toLocaleString('es-ES', { minimumFractionDigits: 4 });
                        //var ingr = row['ingrediente'].replace(/ /gi, "@"); 
                        return ''+cantidad+' '+row['abreviatura']
                    }
                },
                { "data": "precioc", className: "tdright",
                    render : function(data, type, row) {
                        var c = parseFloat(data);
                        var cant = c.toLocaleString('es-ES', { minimumFractionDigits: 4 });
                        //var ingr = row['ingrediente'].replace(/ /gi, "@"); 
                        return ''+cant+' '+moneda
                    }
                },
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
            //var ingr = row['ingrediente'].replace(/ /gi, "@"); 
               return '<span data-toggle="tooltip" data-placement="top" onclick="observaciones('+row['id']+',1)" class="fa fa-file-text test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="Ver observaciones del producto: '+row['nombre']+' '+row['marca']+'">'+
               '</span><span data-toggle="tooltip" data-placement="top" onclick="comprar('+row['id']+',1)" class="fa fa-edit test ml-2" style="cursor: pointer; cursor:hand; color: #337ab7"  title="Editar informacion agregada de: '+row['nombre']+' '+row['marca']+'"></span>'+
               '</span><span data-toggle="tooltip" data-placement="top" onclick="removeM('+row['id']+','+idt+','+2+')" class="fa fa-remove test ml-2" style="cursor: pointer; cursor:hand; color: #337ab7"  title="eliminar de esta lista: '+row['nombre']+' '+row['marca']+'"></span>'
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
        $('#tablacompra').css("width","100%");
        t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
        $('#tablacompra_wrapper').removeClass('container-fluid');
    }else{
        
        $('#tablaoculta').fadeOut('slow');
        $('#tablaoculta').fadeOut('slow');
    }
        });
        
}

function observaciones(id,tipo){
    if (tipo == 1) {
        var link = BASE_URL+'/compra/datoscompra/'+id;
    }else{
        var link = BASE_URL+'/compra/datosdevolucion/'+id;
    }
    $.ajax({
        url: link,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        if (tipo == 1) {
            var nombre = data['nombre'];
            var marca = data['marca'];
            var comentario = data['comentario'];
        }else{
            var nombre = data[0]['nombre'];
            var marca = data[0]['marca'];
            var comentario = data[0]['comentario'];
        }
        $('#obs').empty();
        $('#obs').append(nombre+' '+marca);
        if (data == 0) {
            $('#detalle').empty();
            $('#detalle').append('No se registraron observaciones para el producto '+nombre+' '+marca);
        }else{
            if (data['comentario'] == '') {
                $('#detalle').empty();
                $('#detalle').append('No se registraron observaciones para el producto '+nombre+' '+marca);
            }else{
                $('#detalle').empty();
                $('#detalle').append(comentario);
                
            }
        } 
        $('#modaldetalles').modal('show');
    })
    .fail(function(data) {
        alert("fail");
    });
}

function removeM(idpro,idt,tipo){
    $('#modalcancela2').modal('show');
    $('#modalcancela2 .modal-footer').empty();
    $('#modalcancela2 .modal-footer').append('<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">No</button>'+
                                                  '<button type="button" class="btn btn-sm btn-outline-danger" id="" onclick="removedM('+idpro+','+idt+','+tipo+')">Si</button>');
}

function removedM(idpro,idt,tipo){
    $.ajax({
        url: BASE_URL+'/compra/tablaproductos/'+tipo+'/'+idpro+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
     .done(function(data) {
        $('#modalcancela2').modal('hide');
        mostrartablacomprar();
     });
     validartotal();
}

function tablaing(idt){
    //alert(idt);
     var t2 = $('#tablaingredientes').DataTable({
            "ajax": BASE_URL+'/compra/materiaprima/'+idt,
            "lengthChange": false,
            "columns": [
                { "data": null, className: "tdcenter"},
                { "data": "codigi" , className: "tdleft"},
                { "data": "mercancia" , className: "tdleft"},
                { "data": "marca" , className: "tdleft"},
                { "data": "stock" , className: "tdright",
                    render : function(data, type, row) { 
                        var mayor = Math.max(row['stock_max'], row['existencia']);
                        var menor = Math.min(row['stock_min'], row['existencia']);
                        if (mayor==row['existencia'] && mayor!=row['stock_max']) {
                            return '<o style="color: green; cursor:help" title="La existencia es superior al stock maximo">'+data+' '+row['abums']+'</o>'
                        }else if (menor==row['existencia'] && menor != row['stock_min']) {
                            return '<o style="color: red; cursor:help" title="La existencia es inferior al stock minimo">'+data+' '+row['abums']+'</o>'
                        }else{
                            return ''+data+' '+row['abums']
                        }
                        
                    }
                },
                { "data": "stmin" , className: "tdright",
                    render : function(data, type, row) { 
                        return ''+data+' '+row['abums']
                    }
                },
                { "data": "stmax" , className: "tdright",
                    render : function(data, type, row) { 
                        return ''+data+' '+row['abums']
                    }
                },
                { "data": "idi",   
                    render : function(data, type, row) {
                        if (row['marca']==0) {
                            var mark = '';
                        }else{
                            var mark = row['marca'];
                        }
                        return '<input type="radio" name="radiob" class="form-control form-control-sm" id="" onclick="comprar('+row['idi']+')" title="Seleccionar '+row['mercancia']+' '+mark+'" style="cursor: pointer; cursor:hand;">'
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
    $('#tablaingredientes').css("width","100%");
    t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
    $('#tablaingredientes_wrapper').removeClass('container-fluid');
}
    
    function comprar(iding,edit){
        //alert(iding);
        $('#idpro').val('');
        $('#idpro').val(iding);
        $.ajax({
          url: BASE_URL+'/receta/mercancia/'+iding,
          type: 'POST',
          dataType: 'json'
        })
        .done(function(data) {
        $('#mtitle').empty();
        $('#mtitle').append('cantidad comprada de '+data[0]['nombre']+' '+data[0]['marca']);
        if (edit != 1) {
            $('.monto').val('');
            $('#comentario').val('');
            $('#edit').val('');
        }else{
            $('#edit').val('');
            $('#edit').val(edit);
            $.ajax({
            url: BASE_URL+'/compra/datoscompra/'+iding,
            type: 'POST',
            dataType: 'json'
            })
            .done(function(data) {
                $('.monto').val('');
                $('#comentario').val('');
                $('#cantidad').val(data['cant']);
                $('#precioc').val(data['precioc']);
            });
            
        }
        
        $('#cant1').empty();
        $('#cant1').append(data[0]['unidadC']);
        $('#cant2').empty();
        $('#cant2').append(data[0]['unidadP']);
        $('#cant3').empty();
        $('#cant3').append(data[0]['unidadS']);
        $('#iduc').val('');
        $('#iduc').val(data[0]['idUC']);
        $('#idup').val('');
        $('#idup').val(data[0]['idUP']);
        $('#idus').val('');
        $('#idus').val(data[0]['idUS']);
        $('#modalcant').modal('show');
        });
    }

    function consultasF(tipo){
        //alert(tipo);
        var idt = $('#idtienda').val();
        var ide = $('#idempresa').val();
        
        var f1 = $('#fecha1').val();
        var f2 = $('#fecha2').val();
        $.ajax({
          url: BASE_URL+'/compra/consultarF/'+idt+'/'+tipo+'/'+f1+'/'+f2,
          type: 'POST',
          dataType: 'json'
        })
        .done(function(data) {
            tablafacturas(idt,ide,tipo,f1,f2);
        })
        .fail(function(data) {
            alert("No hay registro de facturas de esta unidad de negocios en el rango de fechas seleccionado");
        });
        
    }



    function tablafacturas(idt,ide,tipo,f1,f2){
        $('#rowfacturas').slideDown();
        $('#rowfacturas').prop('hidden', false);
        $('#h4title').empty();
        $('#h4title').append('Facturas');
        var moneda = $('#monedatienda').val();
        if (ide!=0) {
            var t3 = $('#facturas').DataTable({
            "ajax": BASE_URL+'/compra/consultarF/'+idt+'/'+tipo+'/'+f1+'/'+f2,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "num_factura", className: "tdleft font11"},
                { "data": "fecha_carga", className: "tdcenter font11"},
                { "data": "fecha_factura", className: "tdcenter font11"},
                { "data": "total_factura" , className: "tdright font11",
          render : function(data, type, row) {            
               return ''+data+' '+moneda+''
          }    
       },
       { "data": "impuesto" , className: "tdright font11",
          render : function(data, type, row) {            
               return ''+data+' '+moneda+' ('+row['porcImp']+'%)'
          }    
       },
       { "data": "ttl" , className: "tdright font11",
          render : function(data, type, row) {            
               return ''+data+' '+moneda+''
          }    
       },
       { "data": "nombreprov", className: "tdleft font11"},               
       { "data": "idF", className: "tdcenter ",
            render : function(data, type, row) {            
               return '<span  onclick="productosfactura('+data+')" class="fa fa-list-alt test " style="cursor: pointer; cursor:hand; color: #337ab7"  title="Ver los productos de la factura # '+row['num_factura']+'"></span>'+
               '<span  onclick="pdf('+data+')" class="fa fa-file-pdf-o test ml-2" style="cursor: pointer; cursor:hand; color: #337ab7"  title="Exportar la factura # '+row['num_factura']+'"></span>'+
              '<input type="hidden" id="fac'+data+'" value="'+row['ttl']+'"/>'
          } 
        },               
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
        }else{
            ide = idt;
            var t3 = $('#facturas').DataTable({
            "ajax": BASE_URL+'/compra/consultarF/'+idt+'/'+tipo+'/'+f1+'/'+f2+'/'+ide,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "tienda", className: "tdleft font11"},
                { "data": "num_factura", className: "tdleft font11"},
                { "data": "fecha_carga", className: "tdcenter font11"},
                { "data": "fecha_factura", className: "tdcenter font11"},
                { "data": "total_factura" , className: "tdright font11",
                    render : function(data, type, row) {            
                        return ''+data+' '+moneda+''
                    }    
                },
                { "data": "impuesto" , className: "tdright font11",
                    render : function(data, type, row) {            
                        return ''+data+' '+moneda+' ('+row['porcImp']+'%)'
                    }    
                },
                { "data": "ttl" , className: "tdright font11",
                    render : function(data, type, row) {            
                        return ''+data+' '+moneda+''
                    }    
                },
                { "data": "nombreprov", className: "tdleft font11"},               
                { "data": "idF", className: "tdcenter ",
                    render : function(data, type, row) {            
                       return '<span  onclick="productosfactura('+data+')" class="fa fa-list-alt test " style="cursor: pointer; cursor:hand; color: #337ab7"  title="Ver los productos de la factura # '+row['num_factura']+'"></span>'+
                       '<span  onclick="pdf('+data+')" class="fa fa-file-pdf-o test ml-2" style="cursor: pointer; cursor:hand; color: #337ab7"  title="Exportar la factura #  '+row['num_factura']+'"></span>'+
                      '<input type="hidden" id="fac'+data+'" value="'+row['ttl']+'"/>'
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
        }
           
            $('#_10').on( 'click', function () {
                table.page.len( 10 ).draw();
            } );
        $('#facturas').css("width","100%");
        t3.on( 'order.dt search.dt', function () {
        t3.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
        $('#facturas_wrapper').removeClass('container-fluid');
            $('#tbfact').fadeIn();
            $('#tbfact').prop('hidden', false);
            $('#tbdev').hide();

        
    }

    function productosfactura(idf){
        var idt = $('#idtienda').val();
        $.ajax({
          url: BASE_URL+'/compra/productosfactura/'+idf,
          type: 'POST',
          dataType: 'json'
        })
        .done(function(data) {
            if (data["data"].length>0) {
                $('#mdf').empty();
            $('#mdf').append(data["data"][0]['num_factura']);
            var moneda = $('#monedatienda').val();
            var t4 = $('#detallefactura').DataTable({
            "ajax": BASE_URL+'/compra/productosfactura/'+idf,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "codigo", className: "tdleft font11"},
                { "data": "nombre", className: "tdleft font11"},
                { "data": "marca", className: "tdcenter font11"},
                { "data": "cantidad", className: "tdcenter font11",
                    render : function(data, type, row) {            
                        return ''+data+' '+row['abreviatura']+''
                    }
                },
                { "data": "precioUpro" , className: "tdright font11",
                    render : function(data, type, row) {            
                        return ''+data+' '+moneda+''
                    }    
                },
                { "data": "precioproT" , className: "tdright font11",
                    render : function(data, type, row) {            
                        return ''+data+' '+moneda+''
                    }    
                },           
                { "data": "idF", className: "tdcenter ",
                    render : function(data, type, row) {            
                       return '<span  onclick="devolucion('+data+','+row['idmer']+','+row['idum']+')" class="fa fa-undo test " style="cursor: pointer; cursor:hand; color: #337ab7"  title="Generar la nota de credito del producto '+row['nombre']+' '+row['marca']+'"></span>'+
                       '<form action="'+BASE_URL+'compra/devolucion/'+idt+'" method="post" accept-charset="utf-8" role="form" id="formdev'+row['idmer']+''+row['idF']+'">'+
                       '<input type="hidden" id="producto'+row['idmer']+''+row['idF']+'" name="producto" value="'+row['nombre']+' '+row['marca']+'"/>'+
                       '<input type="hidden" id="canti'+row['idmer']+''+row['idF']+'" name="canti" value="'+row['cantidad']+'"/>'+
                       '<input type="hidden" id="cant'+row['idmer']+''+row['idF']+'" name="cant" value="'+row['cant']+'"/>'+
                       '<input type="hidden" id="cantx'+row['idmer']+''+row['idF']+'" name="cantx" value="'+row['cantidadx']+'"/>'+
                       '<input type="hidden" id="fact'+row['idmer']+''+row['idF']+'" name="fact" value="'+row['num_factura']+'"/>'+
                       '<input type="hidden" id="conte'+row['idmer']+''+row['idF']+'" name="conte" value="'+row['contenido_neto']+'"/>'+
                       '<input type="hidden" id="abrev'+row['idmer']+''+row['idF']+'" name="abrev" value="'+row['abreviatura']+'"/>'+
                       '<input type="hidden" id="idf'+row['idmer']+''+row['idF']+'" name="idf" value="'+row['idF']+'"/>'+
                       '<input type="hidden" id="idmer'+row['idmer']+''+row['idF']+'" name="idmer" value="'+row['idmer']+'"/>'+
                       '<input type="hidden" id="idum'+row['idmer']+''+row['idF']+'" name="idum" value="'+row['idum']+'"/>'+
                       '<input type="hidden" id="prec'+row['idmer']+''+row['idF']+'" name="preciop" value="'+row['pup']+'"/>'+
                       '<input type="hidden" id="com'+row['idmer']+''+row['idF']+'" name="comentario" value=""/>'+
                        '<input type="submit" id="btn'+row['idmer']+''+row['idF']+'" hidden>'+
                       '</form>'
                       
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
    $('#detallefactura').css("width","100%");
    t4.on( 'order.dt search.dt', function () {
    t4.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
        $('#detallefactura_wrapper').removeClass('container-fluid');
        $('#closemodal').trigger('click');
        setTimeout(function(){
            $('#modaldetalleF').modal('show');
        },1000);
        
    }else{
        $('#closemodal').trigger('click');
        alert("Todos los productos de esta factura fueron devueltos");
    }
            
        })
        .fail(function(data) {
            alert("fail");
        });

        
    }

    function devolucion(idf,idmer,idum){
        var productname = $('#producto'+idmer+idf).val();
        var cantidad = $('#canti'+idmer+idf).val();
        var facturanum = $('#fact'+idmer+idf).val();
        var abreviatura = $('#abrev'+idmer+idf).val();
        $('.productname').empty();
        $('.productname').append(productname);
        $('#cantdev').empty();
        $('#cantdev').append(cantidad+' '+abreviatura);
        $('#fnum').empty();
        $('#fnum').append(facturanum);
        $('#modaldevolucion').modal('show');
        $('#com'+idmer+''+idf).addClass('coments');
        $('#devolver').click(function(event) {
            devolver(idmer,idf);
            $('.botonform').trigger('click');
        });
    }

    function devolver(idmer,idf){
        $('#formdev'+idmer+''+idf).addClass('enviarform');
        $('#btn'+idmer+''+idf).addClass('botonform');
        
        var idt = $('#idtienda').val();
        $('.enviarform').submit(function(e){
            e.preventDefault();
            var formdata = $('.enviarform').serialize();
            $.ajax({
                url: BASE_URL+'/compra/devolucion/'+idt,
                type: 'POST',
                data: formdata,
                dataType: 'json'
            })
            .done(function(data) {
                $('#modaldevolucion').modal('hide');
                productosfactura(idf);
                consultasF(1);
            });
        });  
    } 

    function consultardevoluciones(idt,ide,f1,f2){
        if (ide.length==0) {
            ide = idt;
            var enlace = BASE_URL+'/compra/consultarD/'+idt+'/'+f1+'/'+f2+'/'+ide;
        }else{
            var enlace = BASE_URL+'/compra/consultarD/'+idt+'/'+f1+'/'+f2;
        }
        $.ajax({
          url: enlace,
          type: 'POST',
          dataType: 'json'
        })
        .done(function(data) {
            $('#tbdev').fadeIn();
            $('#tbdev').prop('hidden', false);
            $('#tbfact').hide();
            tabladevoluciones(idt,ide,f1,f2);
        });
    }

    function tabladevoluciones(idt,ide,f1,f2){
        $('#rowfacturas').slideDown();
        $('#rowfacturas').prop('hidden', false);
        $('#h4title').empty();
        $('#h4title').append('Notas de credito');
        var empresa = $('#idempresa').val();
        var moneda = $('#monedatienda').val();
        if (empresa.length !=0) {
            var enlace2 = BASE_URL+'/compra/consultarD/'+idt+'/'+f1+'/'+f2;
            var D1 = $('#devoluciones').DataTable({
            "ajax": enlace2,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "codigo", className: "tdleft font11"},
                { "data": "nombre", className: "tdcenter font11"},
                { "data": "marca" , className: "tdright font11"},
       { "data": "cantidad" , className: "tdright font11",
          render : function(data, type, row) {            
               return ''+data+' '+row['abreviatura']+''
          }    
       },
       { "data": "puum" , className: "tdright font11",
          render : function(data, type, row) {            
               return ''+data+' '+moneda+''
          }    
       },
       { "data": "num_factura", className: "tdleft font11"},               
       { "data": "fecha_factura", className: "tdleft font11"},               
       { "data": "fecha_devolucion", className: "tdleft font11"},                             
       { "data": "idmhf", className: "tdcenter ",
            render : function(data, type, row) {            
               return '<span  onclick="infodelproveedor('+row['idprov']+')" class="fa fa-info-circle test " style="cursor: pointer; cursor:hand; color: #337ab7"  title="Ver detalles del proveedor"></span>'+
               '<span  onclick="observaciones('+data+',2)" class="fa fa-file-text test ml-2" style="cursor: pointer; cursor:hand; color: #337ab7"  title="Ver observaciones de la nota de credito del producto '+row['nombre']+' '+row['marca']+'"></span>'+
              '<input type="hidden" id="fac'+data+'" value="'+row['ttl']+'"/>'
          } 
        },               
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
        }else{
            ide = idt;
            var enlace2 = BASE_URL+'/compra/consultarD/'+idt+'/'+f1+'/'+f2+'/'+ide;
            var D1 = $('#devoluciones').DataTable({
            "ajax": enlace2,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "tienda", className: "tdcenter font11"},
                { "data": "codigo", className: "tdleft font11"},
                { "data": "nombre", className: "tdcenter font11"},
                { "data": "marca" , className: "tdright font11"},
       { "data": "cantidad" , className: "tdright font11",
          render : function(data, type, row) {            
               return ''+data+' '+row['abreviatura']+''
          }    
       },
       { "data": "puum" , className: "tdright font11",
          render : function(data, type, row) {            
               return ''+data+' '+moneda+''
          }    
       },
       { "data": "num_factura", className: "tdleft font11"},               
       { "data": "fecha_factura", className: "tdleft font11"},               
       { "data": "fecha_devolucion", className: "tdleft font11"},                             
       { "data": "idmhf", className: "tdcenter ",
            render : function(data, type, row) {            
               return '<span  onclick="infodelproveedor('+row['idprov']+')" class="fa fa-info-circle test " style="cursor: pointer; cursor:hand; color: #337ab7"  title="Ver detalles del proveedor"></span>'+
               '<span  onclick="observaciones('+data+',2)" class="fa fa-file-text test ml-2" style="cursor: pointer; cursor:hand; color: #337ab7"  title="Ver observaciones de la nota de credito del producto '+row['nombre']+' '+row['marca']+'"></span>'+
              '<input type="hidden" id="fac'+data+'" value="'+row['ttl']+'"/>'
          } 
        },               
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
        }
           
            $('#_10').on( 'click', function () {
                table.page.len( 10 ).draw();
            } );
        $('#devoluciones').css("width","100%");
        D1.on( 'order.dt search.dt', function () {
        D1.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
        $('#devoluciones_wrapper').removeClass('container-fluid');
    }

    function pdf(idf){
        var url = BASE_URL+'factura?f='+idf;
        abrir_emergente(url);
    }

    function validartotal(){
        var imp = $('#impuesto').val();
            var ttlfact = $('#totalfact').val();
            var moneda = $('#monedatienda').val();
            if (imp != 0) {
                var enlace = BASE_URL+'/compra/validartotalF/'+imp;
            }else{
                var enlace = BASE_URL+'/compra/validartotalF/';
            }
            $.ajax({
                url: enlace,
                type: 'POST',
                dataType: 'json'
            })
            .done(function(data) {
                montoSup = data - ttlfact;
                montoInf = ttlfact - data;
                if (data>ttlfact) {
                    $('#procesar').prop('disabled', true);
                    $('#msjerror').empty();
                    $('#msjerror').append('la sumatoria de precio de los productos agregados es superior al total de la factura por un monto de '+montoSup+' '+moneda+'<br>'+
                        '<h5>Por favor verifique los valores ingresados e intente nuevamente</h5>');
                    $('#modaltotalf').modal('show');
                    $('#totalfact').css('border-color', 'red');
                    $('#errortotalfactura').show();                
                    $('#errortotalfactura').prop('hidden', false);
                }else if (data<ttlfact) {
                    $('#procesar').prop('disabled', true);
                    $('#msjerror').empty();
                    $('#msjerror').append('la sumatoria de precio de los productos es inferior al total de la factura por un monto de '+montoInf+' '+moneda+'<br>'+
                        '<h5>Por favor verifique los valores ingresados e intente nuevamente</h5>');
                    $('#modaltotalf').modal('show');                    
                    $('#totalfact').css('border-color', 'red');
                    $('#errortotalfactura').show();
                    $('#errortotalfactura').prop('hidden', false);
                }else{
                    $('#errortotalfactura').hide();
                    $('#totalfact').css('border-color', '#00000026'); 
                    $('#procesar').prop('disabled', false);
                }
            });
    }

    $(document).ready(function() {
        $('#comentarios').keyup(function(event) {
            var comentario = $('#comentarios').val();
            //alert(comentario);
            $('.coments').val('');
            $('.coments').val(comentario);
        });
        $('#btn-rev').click(function(event) {
            var idt = $('#idtienda').val();
            var valor = $('#btn-rev').val();
            var ide = $('#idempresa').val();
            var tipo = 1;
            var f1 = $('#fecha1').val();
            var f2 = $('#fecha2').val();
            if (valor == 1) {
                $('#btn-rev').val('');
                $('#btn-rev').val(2);
                $('#btn-rev').text('Consultar facturas');
                $('#btn-rev').removeClass('btn-outline-danger');
                $('#btn-rev').addClass('btn-outline-primary');
                consultardevoluciones(idt,ide,f1,f2);
            }else{
                $('#btn-rev').val('');
                $('#btn-rev').val(1);
                $('#btn-rev').text('Consultar notas de credito');
                $('#btn-rev').addClass('btn-outline-danger');
                $('#btn-rev').removeClass('btn-outline-primary');
                tablafacturas(idt,ide,tipo,f1,f2);
            }       
        });

        $('.closeMI').click(function(event) {
            validartotal();  
        });
    });

        