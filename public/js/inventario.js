//$.noConflict();
$(document).ready(function() {
  setTimeout(function(){$('#tablaSM_wrapper').removeClass('container-fluid');},500);
    $('#radiotiendas').click(function(event) {
      if ($('#radiotiendas').is(':checked')) {
        $('.xtienda').fadeIn();
        $('.xtienda').prop('hidden', false);
        $('.tablas').fadeOut();
        $('#tabs2').fadeOut();
        $('#nombretienda').empty();
        $('#asignar').prop('hidden', false);
        $('#asignar2').prop('hidden', false);
        $('#asignar').show();
        $('#asignar2').show();
        $('#asignarM').hide();
        $('#asignar2M').hide();
      }
    });
    $('#radiomodelo').click(function(event) {
      if ($('#radiomodelo').is(':checked')) {
        $('.xtienda').fadeOut();
        $('.tablas').fadeOut();
        $('#tabs2').fadeOut();
        $('.nombretienda').empty();
        $('#pventa').trigger('click');
      }
      var idmodel = $('#idmodel').val();
      var idemp = $('#idempresa').val();
      var nombreM = $('#modelname').text();
      $('.nombretienda').empty();
      $('.nombretienda').append(nombreM);
      $('#asignarM').show();
      $('#asignar2M').show();
      $('#asignarM').prop('hidden', false);
      $('#asignar2M').prop('hidden', false);
      $('#asignar').hide();
      $('#asignar2').hide();
      pormodelo(idmodel);
      pormodelopv(idmodel);
      porasignaramodelo(idmodel,idemp);
    });

    $('#infopreciou').click(function(event) {
      $('#t').empty();
      $('#t').append('<h6>Informacion sobre el precio unitario</h6>');
      $('.cuerpo').empty();
      $('.cuerpo').append(
        '<div class="alert alert-info alert-dismissable" style="text-align:left">'+
        'El precio unitario se refiere al precio de cada unidad, segun la presentacion del producto. Ej: 1 caja contiene 20 paquetes de 1 kg, el precio unitario en este caso seria por cada kg.<br>'+
      '</div>');
      $('#mfooter').empty();
      $('#mfooter').append('<button class="btn btn-sm btn-outline-primary" data-dismiss="modal"><span class="fa fa-check"></span> Cerrar</button>');
      $('#alerta').modal('show');
    });

    $('#infocontneto').click(function(event) {
      $('#t').empty();
      $('#t').append('<h6>Informacion sobre el Contenido neto</h6>');
      $('.cuerpo').empty();
      $('.cuerpo').append(
        '<div class="alert alert-info alert-dismissable" style="text-align:left">'+
        'El Contenido neto se refiere a la cantidad que refleja el empaque del producto, esta cantidad se debe expresar en la unidad de sistema. Ej: si el empaque dice cont. neto 1Kg y la unidad de sistema es gramos, el valor debe expresarse como 1000 Gr.<br>'+
      '</div>');
      $('#mfooter').empty();
      $('#mfooter').append('<button class="btn btn-sm btn-outline-primary" data-dismiss="modal"><span class="fa fa-check"></span> Cerrar</button>');
      $('#alerta').modal('show');
    });
    //alert('ok');
    /*$('#pcompra').click(function(event) {
      $('#tabs2').fadeIn('slow');
      $('.proasignados').empty();
      $('.proasignados').append('Productos de inventario asignados');
    });
    $('#pventa').click(function(event) {
      $('#tabs2').fadeIn('slow');
      $('.proasignados').empty();
      $('.proasignados').append('Productos de venta asignados');
    });*/
    var nueva = $('#newp').val();
    if (nueva) {
      $('#nuevop').prop('hidden', false);
      setTimeout(function() {$('#nuevop').fadeOut('slow');}, 5000);
    }

    var nueva1 = $('#nuevoproducto').val();
    if (nueva1 == 1) {
      $('#nuevosprods').prop('hidden', false);
      setTimeout(function() {$('#nuevosprods').fadeOut('slow');}, 5000);
    }
    $('#tipo_ingrediente').change(function(event) {
      var tipo = $('#tipo_ingrediente option:selected').text();
      var fam = $('.familia').val();
      if (tipo == 'Agrupado') {
        $('#unidad_medida_pr').val(13);
        $('#unidad_medida_s').val(13);
        $('#formulap').val('');
        $('#formulap').val('Un * ');
        $('#formulas').val('');
        $('#formulas').val('Un * ');
        $('.simples').fadeOut(500);
        $('.agrupado').fadeIn(600);
        $('.agrupado').prop('hidden', false);
        $('#botonG').prop('disabled', false);
        $('#unidad_medida_c').removeAttr('required');
      }else if (tipo == 'Asociado') {
        $('.simples').fadeOut(500);
        $('.agrupado').fadeIn(600);
        $('.agrupado').prop('hidden', false);
        $('#botonG').prop('disabled', true);
        $('#unidad_medida_c').removeAttr('required');
      }else{
        if (fam != 135) {
          $('#unidad_medida_c').attr('required', 'required');
        }else{
          $('#unidad_medida_c').removeAttr('required');
        }
        $('.simples').fadeIn(500);
        $('.agrupado').fadeOut('fast');
        $('#botonG').prop('disabled', false);
      }
    });

    $('.familia').change(function(event) {
      //$('.simples').fadeIn(500);
      load('referencia','tipo_ingrediente',false,false);
      var family = $('.familia').val();
      var tipo = $('#tipo_ingrediente').val();


        if (family != 135 && tipo != 'Agrupado' && tipo != 'Asociado') {
          $('.productoscompra').fadeIn('fast');
          $('.productoscompra').prop('hidden', false);
          $('.asoc').fadeOut('fast');
          $('.agrupado').fadeOut('fast');
        }else{
          $('#canti').fadeOut('fast');
          $('#canti').prop('hidden', true);
          $('.productoscompra').fadeOut('fast');
          $('.productoscompra').prop('hidden', true);
        }
      
      codigoPropuesto(family);
    });

    $('#sub_familia').change(function(event) {
      var sf = $('#sub_familia').val();
      if (sf == 148) {
        $('#modalsubfamilia').modal('show');
      }
    });
    $('#mcontinuar').click(function(event) {
      var subf = $('#nuevasub').val();
      var subfamily = subf.replace(/ /g, "@");
      $.ajax({
            url: BASE_URL+'/inventario/agregarsubfamilia/'+subfamily,
            type: 'POST',
            dataType: 'json'
          })
      .done(function(data) {
        load('referencia','sub_familia',false,false);
        $('#modalsubfamilia').modal('hide');
        setTimeout(function() {$('#sub_familia').val(data);}, 2500);
        
      })
      .fail(function() {
        alert("fallo al agregar una nueva sub clasificacion");
        load('referencia','sub_familia',false,false);
        $('#modalsubfamilia').modal('hide');
      });
      
    });
    $('.continue').prop('disabled', true);
    load('referencia','familia',false);
    load('unidad_medida','unidad_medida_c',false);
    load('unidad_medida','unidad_medida_pr',false);
    load('unidad_medida','unidad_medida_s',false);
    load('unidad_medida','unidad_mp',false);
    load('unidad_medida','unidad_ms',false);
    load('referencia','motivo',false,false);
    load('referencia','sub_familia',false,false);
    load('referencia','tipo_inventario',false,false);
    

    $('.umc').change(function(event) {
      $('#cantidadConsumo').val('');
      $('#cantidadConsumo').val(1);
      var idmcom = $('.umc').val();
      var valor = $('.contneto').val();
      //alert(idmcom);
      $.ajax({
            url: BASE_URL+'/inventario/setunidadT/'+idmcom,
            type: 'POST',
            dataType: 'json'
          })
        .done(function(data) {
            //alert(data[0]['abreviatura']);
            if (valor.length >0) {
                $('.formulac').val(data[0]['abreviatura']+' * '+valor);
            }else{
                $('.formulac').val(data[0]['abreviatura']+' * 1');
            }
            
        });
     $('#cantix').val('');
      if (idmcom == 8 || idmcom == 9 || idmcom == 10 || idmcom == 11 || idmcom == 16 || idmcom == 19 || idmcom == 23 ) {
        $('#canti').fadeIn('slow');
        $('#canti').prop('hidden', false);
        var mcom = $('.umc option:selected').text();
        //alert(mcom);
        $('#uc').empty();
        $('#uc').text(mcom);
        $('#abrevU').empty();
        $('#abrevU').text(mcom);
      }else{
        $('#canti').fadeOut('fast');        
      }
      
    });

    

    $('#umcompra').change(function(event) {
      var idmcom = $('#umcompra').val();
      var valor = $('#contneto').val();
      //alert(idmcom);
      $.ajax({
            url: BASE_URL+'/inventario/setunidadT/'+idmcom,
            type: 'POST',
            dataType: 'json'
          })
        .done(function(data) {
            //alert(data[0]['abreviatura']);
            if (valor.length >0) {
                $('.formulac').val(data[0]['abreviatura']+' * '+valor);
            }else{
                $('.formulac').val(data[0]['abreviatura']+' * 1');
            }
            
        });
     $('#cantix').val('');
      if (idmcom == 8 || idmcom == 9 || idmcom == 10 || idmcom == 11 || idmcom == 16 || idmcom == 19 || idmcom == 23 ) {
        $('#canti').fadeIn('slow');
        $('#canti').prop('hidden', false);
        var mcom = $('#umcompra option:selected').text();
        $('#uc').empty();
        $('#uc').text(mcom);
      }else{
        $('#canti').fadeOut('fast');        
      }
      
    });

      $('.ump1').change(function(event) {

        var unidad_p = $('.ump1').val();
        //var textoup = $('.ump option:selected').text();
        //$('#up').empty();
        //$('#up').text(textoup+' por ');
        //alert(unidad_p);
        $.ajax({
            url: BASE_URL+'/inventario/setunidadT/'+unidad_p,
            type: 'POST',
            dataType: 'json'
          })
        .done(function(data) {
            //alert(data[0]['abreviatura']);
            $('#avconsumo').empty();
            $('#avconsumo').append(data[0]['abreviatura']);
            document.getElementById("formulap").value=data[0]['abreviatura']+' * ';
        });
      });

      $('#unidad_medida_s').change(function(event) {

        var unidad_s = $('#unidad_medida_s').val();
        var textous = $('#unidad_medida_s option:selected').text();
        //alert(unidad_p);
        $.ajax({
            url: BASE_URL+'/inventario/setunidadT/'+unidad_s,
            type: 'POST',
            dataType: 'json'
          })
        .done(function(data) {
            $('#avsistema').empty();
            $('#avsistema').append(data[0]['abreviatura']);
            document.getElementById("formulas").value=data[0]['abreviatura']+' * ';
        });
      });

      //OBTENER ID DEL PROVEEDOR SELECCIONADO EN LA VISTA DE CREAR PRODUCTO

      $('#autoC').change(function(event) {
        var valor = $('#autoC').val();
        var name = valor.split(' ');
        var proveedor = name.join(':');
        //alert(proveedor);
        $.ajax({
          url: BASE_URL+'/inventario/selectProveedor/'+proveedor,
                type: 'POST',
                dataType: 'json'
        })
        .done(function(data) {
          //alert(data[0]['id']);
          $('#idProveedor').val(data[0]['id']);
        })  
      });

      //----------------------FIN-----------------------------------

    $('#contenidoN').keyup(function(event) {
        var valor = $('#contenidoN').val();
        $('#CNtemporal').val(valor);
        formulaCompra(valor);
    });

    $('#contneto').keyup(function(event) {
        var valor = $('#contneto').val();
        formulaCompra(valor);
        load('unidad_medida','umcompra',false);
    });

    $('#contenidoNe').keyup(function(event) {
        var valor = $('#contenidoNe').val();
        formulaCompra(valor);
    });


    $('.codigop').keyup(function(event) {
        var code = $('.codigop').val();
        //var subM = $('#sm').val();
        //alert(code);
        validarCodigo(code);
    });


    $('#marca').keyup(function(event) {
        var marca = $('#marca').val();
        //alert(marca);
        validarProducto(marca);
    });

    $('#nombre').keyup(function(event) {
        var marca = $('#marca').val();
        //alert(marca);
        validarProducto(marca);
    });

    $('.AT').change(function(event) {
        tienda = $(this).val();
        idt2 = $(this).attr('id');
        
        $('.continue').val(tienda);
        $('.continue').prop('disabled', false);
    });


    $('.continue').click(function(event) {
      $('#tabs2').fadeIn();
      $('#tabs2').prop('hidden', false);
      var idboton = $(this).attr("id");
      $('#botoncontinuar').val('');
      $('#botoncontinuar').val(idboton);

      setTimeout(function() {$('.tablas').fadeOut('fast');$('.tablas').fadeIn('slow');$('.tablas').prop('hidden', false);$('#pventa').trigger('click');}, 400);
        var at = $('.continue').val();
        idt = $(this).val();
        idemp = $('#idempresa').val();
        $('#idti').val('');
        $('#idti').val(idt);
        setTimeout(function() {
        tablaproduct(idt,idemp,2);
        
//alert(idt);
      $.ajax({
      url: BASE_URL+'/inventario/ingredientest/'+idt,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      nombret = $('#'+idt2+' option:selected').text();
        $('.nombretienda').empty();
        $('.nombretienda').append(nombret);
        $('#especific').empty();
        $('#especific').append(nombret);
      //alert(data.length);
      if (data.length == 0) {
        $('#bodytabla2').empty();
        $('#bodytabla2').append('<tr><td>La tienda seleccionada aun no tiene ningun producto asignado</td></tr>');
      }else{
        $('#bodytabla2').empty();
      for (var i = 0; i<= data.length; i++) {
        $('#bodytabla2').append('<tr id="t'+data[i]['idpro']+'"><td>'+data[i]['producto']+' '+data[i]['marca']+'<i class="fa fa-remove remove1" style="float: right; cursor: pointer;" ><input type="hidden" value="'+data[i]['idpro']+'"/></i></td></tr>');
      }
      }
      
      
    });
        
       }, 400); 


        setTimeout(function() {
        tablaproduct2(idt,idemp,2);
//alert(idt);
      $.ajax({
      url: BASE_URL+'/inventario/pventat/'+idt,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      nombret = $('#'+idt2+' option:selected').text();
        $('.nombretienda').empty();
        $('.nombretienda').append(nombret);
      //alert(data.length);
      if (data.length == 0) {
        $('#bodytablapro').empty();
        $('#bodytablapro').append('<tr><td>La tienda seleccionada aun no tiene ningun producto asignado</td></tr>');
      }else{
        $('#bodytablapro').empty();
        /*for (var i = 0; i<= data.length; i++) {
          $('#bodytablapro').append('<tr id="tp'+data[i]['idpro']+'"><td>'+data[i]['producto']+' <i class="fa fa-remove remove2" style="float: right; cursor: pointer;" ><input type="hidden" value="'+data[i]['idpro']+'"/></i></td></tr>');
        }*/
        tablitapv(idt,2);
        tablita(idt,2);
      }
      
      
    });
        
       }, 400);


    });

    $('#info').click(function(event) {
      $('.tablas').fadeOut('slow');
      $('#tabs2').fadeOut('slow');
      $('.nombretienda').empty();
      $('.radios').hide();
    }); 

    $('.pestanias').click(function(event) {
      $('.radios').show();
      $('.radios').prop('hidden', false);
      var modelo = $(this).text();
      $('#modelname').empty();
      $('#modelname').append(modelo);
      var idmodel = $(this).attr("id");
      $('#idmodel').val('');
      $('#idmodel').val(idmodel);
    }); 



    $(document).on("click", ".remove1", function(){
      //tipo1 es modelos, tipo 2 es tiendas especificas
      var idpro = $(this).children().val();
      var tipo = $(this).children('.tipo').val();
      var idti = $('#idti').val();
      var nombrem = $('#modelname').text();
      var btn = $('#botoncontinuar').val();
      var idm = $('#idmodel').val();
      var idemp = $('#idempresa').val();
      $('#modcontinuar').removeClass('mcontinuar2');
      $('#modcontinuar').addClass('mcontinuar');
      if (tipo == 1) {
        var enlace = BASE_URL+'/inventario/modalmodelo/'+idpro+'/'+idm;
        var textname = 'del modelo '+nombrem;
      }else{
        var enlace = BASE_URL+'/inventario/modalUpdate/'+idpro+'/'+idti;
        var textname = 'de la tienda '+nombret;
      }
      $.ajax({
            url: enlace,
            type: 'POST',
            dataType: 'json',     
        })
        .done(function(data) {
          //alert(data[0][1]);
            $('#modtitle').empty();
            $('#modtitle').append('Eliminar '+data[0]['producto']+' '+data[0]['marca']);
            $('#modbody').empty();
            
              $('#modbody').append(
              '<div class="alert alert-danger" style="text-align:left">'+
              'Usted esta por eliminar el producto "'+data[0]['producto']+'" marca "'+data[0]['marca']+'", del modelo '+textname+'. ¿Realmente desea continuar?<br>Recuerde que eliminar dicho producto establecera la existencia del mismo en cero (0), si se lo vuelve a asignar mas adelante.<br>'+
              '</div>');
              if (tipo != 1 && data[0]['existencia']>0) {
                alert("validado");
              }else if (tipo == 1) {
                verificarexistencias(idpro,idm);
              }else{
                $('#modaldelete').modal('show');
              }
              
        });
        
      
      $('.mcontinuar').click(function(event) {
        if (tipo == 1) {
          var enlace2 = BASE_URL+'/inventario/borrarasignacion/'+idpro+'/'+idm+'/'+tipo
        }else{
          var enlace2 = BASE_URL+'/inventario/borrarasignacion/'+idpro+'/'+idti+'/'+tipo
        }
        
        $.ajax({
          url: enlace2,
          type: 'POST',
          dataType: 'json',
        })
        .done(function(data) {
          $('.tablas').fadeOut('fast');
          $('#loading').fadeIn();
          $('#loading').prop('hidden', false);
          $('#modaldelete').modal('hide');
          setTimeout(function() {$('#loading').fadeOut();$('.tablas').fadeIn('slow');$('.tablas').prop('hidden', false);$('#pcompra').trigger('click');
            if (tipo == 1) {
              tablaproduct(idm,idemp,tipo);tablita(idm,tipo);
            }else{
              tablaproduct(idti,idemp,tipo);tablita(idti,tipo);
            }
          }, 1000);
        });

      });
    });

    $(document).on("click", ".remove2", function(){
      var idpro = $(this).children().val();
      var tipo = $(this).children('.tipo').val();
      var idti = $('#idti').val();
      var nombret = $('#nombretienda').text();
      var btn = $('#botoncontinuar').val();
      var nombrem = $('#modelname').text();
      var idm = $('#idmodel').val();
      var idemp = $('#idempresa').val();
      $('#modcontinuar').removeClass('mcontinuar');
      $('#modcontinuar').addClass('mcontinuar2');
      if (tipo == 1) {
        var enlaces = BASE_URL+'/inventario/nombrepro2/'+idpro+'/'+idm;
        var textname = 'del modelo '+nombrem;
      }else{
        var enlaces = BASE_URL+'/inventario/nombrepro/'+idpro+'/'+idti;
        var textname = 'de la tienda '+nombret;
      }
      $.ajax({
            url: enlaces,
            type: 'POST',
            dataType: 'json',     
        })
        .done(function(data) {
          //alert(data[0][1]);
            $('#modtitle').empty();
            $('#modtitle').append('Eliminar '+data[0]['producto']);
            $('#modbody').empty();
            $('#modbody').append(
              '<div class="alert alert-danger" style="text-align:left">'+
              'Usted esta por eliminar el producto "'+data[0]['producto']+'", '+textname+'. ¿Realmente desea continuar?<br>Recuerde que eliminar dicho producto establecera la existencia del mismo en cero (0), si se lo vuelve a asignar mas adelante.<br>'+
              '</div>');
            
        });
      $('.mcontinuar2').click(function(event) {
        if (tipo == 1) {
          var enlace2 = BASE_URL+'/inventario/borrarasignacionp/'+idpro+'/'+idm+'/'+tipo
        }else{
          var enlace2 = BASE_URL+'/inventario/borrarasignacionp/'+idpro+'/'+idti+'/'+tipo
        }
        $.ajax({
          url: enlace2,
          type: 'POST',
          dataType: 'json',
        })
        .done(function(data) {
          $('.tablas').fadeOut('fast');
          $('#loading').fadeIn();
          $('#loading').prop('hidden', false);
          $('#modaldelete').modal('hide');
          setTimeout(function() {$('#loading').fadeOut();$('.tablas').fadeIn('slow');$('.tablas').prop('hidden', false);$('#pventa').trigger('click');
            if (tipo == 1) {
              tablaproduct2(idm,idemp,tipo);tablitapv(idm,tipo);
            }else{
              tablaproduct2(idti,idemp,tipo);tablitapv(idti,tipo);
            }
          }, 1000);
        });

      });

        $('#modaldelete').modal('show');
      
      
    });

    


    


    $('#cantix').keyup(function(event) {
      var cxu = $('#cantix').val();
        if (cxu != null) {
              $('#canti').show();
              $('#cantCo').empty();
              $('#cantCo').append('<label class="control-label" style="float: left;">Ud. por '+data[0][22]+'</label>'+
                         '<input style="width: 50%" type="text" class="form-control" name="cantidad" id="cantidad" value="'+data[0][9]+'">');
          }
    });

    $('#contneto').keyup(function(event) {
      var conte = $('#contneto').val();

    });



});

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

function verificarexistencias(idpro,idm){
    $.ajax({
      url: BASE_URL+'/inventario/validarexistencias/'+idpro+'/'+idm,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      if (data == 1) {
        $('#modaldelete').modal('show');
      }else{
        alert(data[0]['existencia']);
      }
    });
}

    function add(idp){
      //alert(id);
    if ($('#id'+idp).is(':checked')) {
      //alert('checked');
      var valor = $('#valore').val();
      valor++;
      $('#valore').val(valor);
      //alert(valor);
      if (valor>0) {
        $('#asignar').prop('disabled', false);
        $('#asignarM').prop('disabled', false);
      }else{
        $('#asignar').prop('disabled', true);
        $('#asignar').attr('title','No se han realizado cambios');
        $('#asignarM').prop('disabled', true);
        $('#asignarM').attr('title','No se han realizado cambios');
      }
    $.ajax({
      url: BASE_URL+'/receta/mercancia/'+idp,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      $('#bodytabla2').append('<tr id="t'+data[0]['id']+'"><td style="color: green">'+data[0]['nombre']+' '+data[0]['marca']+'</td></tr>');
    });
    }else {
      var valor = $('#valore').val();
      valor--;
      $('#valore').val(valor);
      //alert(valor);
      if (valor>0) {
        $('#asignar').prop('disabled', false);
        $('#asignarM').prop('disabled', false);
      }else{
        $('#asignar').prop('disabled', true);
        $('#asignar').attr('title','No se han realizado cambios');
        $('#asignarM').prop('disabled', true);
        $('#asignarM').attr('title','No se han realizado cambios');
      }
      $.ajax({
      url: BASE_URL+'/receta/mercancia/'+idp,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      $('#t'+data[0]['id']).remove();
    });
    }
    }

    function add2(idp){
      //alert(id);
    if ($('#id'+idp).is(':checked')) {
      //alert('checked');
      var valor = $('#valore2').val();
      valor++;
      $('#valore2').val(valor);
      //alert(valor);
      if (valor>0) {
        $('#asignar2').prop('disabled', false);
        $('#asignar2M').prop('disabled', false);
      }else{
        $('#asignar2').prop('disabled', true);
        $('#asignar2').attr('title','No se han realizado cambios');
        $('#asignar2M').prop('disabled', true);
        $('#asignar2M').attr('title','No se han realizado cambios');
      }
      $.ajax({
      url: BASE_URL+'/inventario/pros/'+idp,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      $('#bodytablapro').append('<tr id="tp'+data[0]['id']+'"><td style="color: green">'+data[0]['nombre']+'</td></tr>');
    });
    }else {
      var valor = $('#valore2').val();
      valor--;
      $('#valore2').val(valor);
      //alert(valor);
      if (valor>0) {
        $('#asignar2').prop('disabled', false);
        $('#asignar2M').prop('disabled', false);
      }else{
        $('#asignar2').prop('disabled', true);
        $('#asignar2').attr('title','No se han realizado cambios');
        $('#asignar2M').prop('disabled', true);
        $('#asignar2M').attr('title','No se han realizado cambios');
      }
      $.ajax({
      url: BASE_URL+'/inventario/pros/'+idp,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      $('#tp'+data[0]['id']).remove();
    });
    }
    }

function compradirecta(idP,idT){
  //alert(idP); alert(idT);
  
    $.ajax({
      url: BASE_URL+'/inventario/modalUpdate/'+idP+'/'+idT,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      $('#titulorep').empty();
      $('#titulorep').text('Reposicion por compra directa de '+data[0]['producto']+' '+data[0]['marca']);
      $('#up').empty();
      $('#up').text(data[0]['abreviaturaP']+' por ');
      $('#idp2').val('');
      $('#umsis').val('');
      $('#conver').val('');
      $('#idP2').val(data[0]['idP']);
      $('#umsis').val(data[0]['idUMS']);
      $('#conver').text(data[0]['abreviaturaS']);
      //alert(data[0]['producto'])

    });
}

function formulaCompra(valor){
  var unidad = $('.formulac').val();
  var separador = '*'; // un espacio en blanco
  var limite    = 1;
  unidadc= unidad.split(separador, limite); //alert(unidadc[0]); alert(unidadc[1]);
  $('.formulac').val(unidadc+'* '+valor);
}

function validarCodigo(code){
    $.ajax({
      url: BASE_URL+'/inventario/validarCod/'+code,
      type: 'POST',
      dataType: 'json',
    })

    .done(function(data) {
      //alert(data);
      $('#glyphicon').empty();
        if (data === true) {
          //alert('Este codigo esta asignado a un producto');
          $('#glyphicon').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove"></span>');
          $('#botonG').prop('disabled',true);
        }else{
          $('#glyphicon').empty();
          //$('#glyphicon').append('<span style="color:green" class="glyphicon glyphicon-ok"></span>');
          //alert('Este codigo no esta asignado a ningun producto');
          $('#botonG').prop('disabled',false);
        }
    })
}

function validarProducto(marca){
   n = marca.split(' ');
   resultN= n.join(':');

   var name = $('#nombre').val();
   var nomb = name.replace(/ /g, "@");
   var codigo = $('#co').val();
   //alert(resultN);
    $.ajax({
            url: BASE_URL+'/inventario/validarProducto/'+nomb+'/'+resultN+'/'+codigo,
            type: 'POST',
            dataType: 'json',
          })

    .done(function(data) {
      //alert(data);
      $('#glyphicon').empty();
      $('#glyphi').empty();
      $('#glyph').empty();
        if (data === true) {
          //alert('Este codigo esta asignado a un producto');
          $('#glyphi').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove" ></span>');
          $('#glyph').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove" ></span>');
          $('#glyphicon').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove"></span>');
          $('#botonG').prop('disabled',true);
        }else{
          $('#glyphi').empty();
          $('#glyph').empty();
          //$('#glyphicon').append('<span style="color:green" class="glyphicon glyphicon-ok"></span>');
          //alert('Este codigo no esta asignado a ningun producto');
          $('#botonG').prop('disabled',false);
        }
    })
}


function modalUpdate(idP,idT){
  $('#unidad_medida_co').empty();
  $('#unidad_medida_pr').empty();
  $('#unidad_medida_si').empty(); 
  carga('unidad_medida','unidad_medida_co',false,false,idP,idT);
  carga('unidad_medida','unidad_medida_pr',false,false,idP,idT);
  carga('unidad_medida','unidad_mp1',false,false,idP,idT);
  carga('unidad_medida','unidad_ms1',false,false,idP,idT);
  carga('unidad_medida','unidad_medida_si',false,false,idP,idT); 
  carga('referencia','familias',false,false,idP,idT);
  carga('referencia','sub_familia',false,false,idP,idT);
  carga('referencia','tipo_inventario',false,false,idP,idT);
  //alert(idP);alert(idT);
      $.ajax({
            url: BASE_URL+'/inventario/modalUpdate/'+idP+'/'+idT,
            type: 'POST',
            dataType: 'json',
          })
          .done(function(data) {
            //alert(data[0][6]);
            var fam = data[0]['idf'];
            var tipo = data[0]['tipo_ingrediente'];

            $('#enunciadoU').empty();
            $('#enunciadoU').append('<h4 class="modal-title">Esta modificando el producto '+data[0][3]+' marca '+data[0][4]+'</h4>');
              $('#codi').val(data[0]['codigo']);
              $('#c_tcr').val(data[0]['codigo_anterior']);
              $('#nombre').val(data[0]['producto']);
              $('#marca').val(data[0]['marca']);
              $('#pU').val(data[0]['precio_unitario']);
              $('#stockmin').val(data[0]['stock_min']);
              $('#stockmax').val(data[0]['stock_max']);
              $('#contenidoN').val(data[0]['contenido_neto']);
              $('#existencia').val(data[0]['existencia']);
              $('#cantidad').val(data[0]['cantidad_presentacion']);
              $('#tipo_ingrediente').val(data[0]['tipo_ingrediente']);
              $('#tipoing_id').val(data[0]['tipo_mercancia_id']);
              $('#description').val(data[0]['descripcion']);
              $('#idP').val(data[0]['idP']);
              $('.abrevia').empty();
              $('.abrevia').append('('+data[0]['abreviaturaS']+')');
              $('#avsistema').empty();
              $('#avsistema').append('('+data[0]['abreviaturaS']+')');
              $('#avconsumo').empty();
              $('#avconsumo').append('('+data[0]['abreviaturaP']+')');
              $('#abrevU').empty();
              $('#abrevU').append(data[0]['unidadC']);
              if (data[0]['formula_c'] == null) {
                $('#formulac').value=data[0][23]+' *';
              }else{
                $('#formulac').val(data[0][6]);
              }
              if (data[0]['formula_p'] == null) {
                $('#formulap').val(data[0][20]+' *');
              }else{
                $('#formulap').val(data[0]['formula_p']);
              }
              if (data[0]['formula_s'] == null) {
                $('#formulas').val(data[0][17]+' *');
              }else{
                $('#formulas').val(data[0]['formula_s']);
              }
              if (tipo == 'Agrupado') {
                $('#simplesdiv').removeClass('form-group');
                $('#unidad_medida_pr').val(13);
                $('#unidad_medida_s').val(13);
                $('#formulap').val('');
                $('#formulap').val('Un * ');
                $('#formulas').val('');
                $('#formulas').val('Un * ');
                $('.simples').hide();
                $('.agrupado').show();
                $('.asociated').hide();
                $('.agrupado').prop('hidden', false);
                $('#botonG').prop('disabled', false);
              }else if (tipo == 'Asociado') {
                $('.simples').hide();
                $('.agrupado').show();
                $('.asociated').show();
                $('.agrupado').prop('hidden', false);
                $('.asociated').prop('hidden', false);
                $('#asoci').prop('hidden', false);
                $('#botonG').prop('disabled', false);
              }else{
                $('#simplesdiv').addClass('form-group');
                $('#asoci').prop('hidden', true);
                $('.asociated').hide();
                $('.simples').show();
                $('.simples').prop('hidden', false);
                $('.agrupado').hide();
                $('#botonG').prop('disabled', false);
                $('#botonG').prop('disabled', false);
                if (data[0]['idf'] != 135) {
                  $('.productoscompra').fadeIn('fast');
                  $('.productoscompra').prop('hidden', false);
                }else{
                  $('#canti').fadeOut('fast');
                  $('#canti').prop('hidden', true);
                  $('.productoscompra').fadeOut('fast');
                  $('.productoscompra').prop('hidden', true);
                }
              }
              /*if (data[0]['cantidad_presentacion'] != null) {
                  $('#canti').show();
                  $('#cantCo').empty();
                  $('#cantCo').append('<label class="control-label" style="float: left;">Ud. por '+data[0][22]+'</label>'+
                             '<input style="width: 50%" type="text" class="form-control" name="cantidad" id="cantidad" value="'+data[0][9]+'">');
              }*/
              var opciones =['0','1'];
              var opcionesPI =['Activo','Inactivo'];
              $('#status').empty();
                for (var y = 0; y < opciones.length; y++) {
                    if (data[0][26] == opciones[y]) {
                      //alert(ocultar);
                      $('#status').append('<option value="'+opciones[y]+'" selected>'+opcionesPI[y]+'</option>');
                    }else{
                     // alert('no');
                      $('#status').append(
                                     '<option value="'+opciones[y]+'">'+opcionesPI[y]+'</option>'
                                    );
                    }                   
                  }
            $('#tablafiltraje').DataTable({
            "ajax": BASE_URL+'/inventario/loadingredientes/'+fam+'/false'+'/'+idT,

            "lengthChange": false,
            "columns": [
                { "data": "codigi", className: "tdleft"},
                { "data": "ingrediente", className: "tdleft"},
                { "data": "costo", className: "tdright"},
                { "data": null , className: "tdcenter",
          render : function(data, type, row) {
            //var ingr = row['ingrediente'].replace(/ /gi, "@"); 
               return '<label class="custom-control custom-checkbox" >'+
                                          '<input type="checkbox" class="custom-control-input" name="mercancia[]" id="id'+row['idi']+'" value="'+row['idi']+'" onclick="add('+row['idi']+','+idT+')">'+
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
        
              
          })

}


function activarCod(idSm, idm){
  //alert(idm);
  load('grupo','grup',false,idSm);
  codigoPropuesto(idSm,idm)
}

function pormodelo(idmodel){
  $.ajax({
    url: BASE_URL+'/inventario/consultamodelo/'+idmodel,
    type: 'post',
    dataType: 'json'
  })
  .done(function(data) {
    //alert(data.length);
    $('.tablas').fadeIn();
    $('.tablas').prop('hidden', false);
    $('#tabs2').fadeIn();
    $('#tabs2').prop('hidden', false);
    if (data.length == 0) {
        $('#bodytabla2').empty();
        $('#bodytabla2').append('<tr><td>El modelo seleccionado aun no tiene productos asignados</td></tr>');
      }else{
        $('#bodytabla2').empty();
        /*for (var i = 0; i<= data.length; i++) {
          $('#bodytabla2').append('<tr id="t'+data[i]['idpro']+'"><td>'+data[i]['producto']+' '+data[i]['marca']+'<i class="fa fa-remove remove1" style="float: right; cursor: pointer;" ><input type="hidden" value="'+data[i]['idpro']+'"/></i></td></tr>');
        }*/
    }
  })
}

function pormodelopv(idmodel){
  $.ajax({
      url: BASE_URL+'/inventario/consultamodelopv/'+idmodel,
      type: 'POST',
      dataType: 'json',
    })
    .done(function(data) {
      $('.tablas').fadeIn();
    $('.tablas').prop('hidden', false);
    $('#tabs2').fadeIn();
    $('#tabs2').prop('hidden', false);
      //alert(data.length);
      if (data.length == 0) {
        $('#bodytablapro').empty();
        $('#bodytablapro').append('<tr><td>El modelo seleccionado aun no tiene productos asignados</td></tr>');
      }else{
        $('#bodytablapro').empty();
        /*for (var i = 0; i<= data.length; i++) {
          $('#bodytablapro').append('<tr id="tp'+data[i]['idpro']+'"><td>'+data[i]['producto']+' <i class="fa fa-remove remove2" style="float: right; cursor: pointer;" ><input type="hidden" value="'+data[i]['idpro']+'"/></i></td></tr>');
        }*/
        tablitapv(idmodel,1);
        tablita(idmodel,1);
      }
      
      
    });
}

function porasignaramodelo(idmodel,idemp){
  tablaproduct(idmodel,idemp,1);
  tablaproduct2(idmodel,idemp,1);
}

function tablaproduct(id1,idemp,tipo){
  if (tipo == 1) {
    var enlace = BASE_URL+'/inventario/notinmodel/'+id1+'/'+idemp
  }else{
    var enlace = BASE_URL+'/inventario/ingredientes/'+id1+'/'+idemp
  }
  var t = $('#tablaproduct').DataTable({

            "ajax": enlace,
            "columns": [
                { "data": null, className: "tdcenter"},
                { "data": "codigo" , className: "tdleft"},
                { "data": "mercancia" , className: "tdleft"},
                { "data": "clasificacion" , className: "tdleft"},
                { "data": "idpro" , className: "tdcenter",  
                  render : function(data, type, row) { 
                        return '<label class="custom-control custom-checkbox" >'+
                                          '<input type="checkbox" class="custom-control-input" name="mercancia[]" id="id'+row['idpro']+'" value="'+row['idpro']+'" onclick="add('+row['idpro']+')">'+
                                          '<span class="custom-control-indicator check" ></span>'+
                                        '</label>'
                  } 
                },
                { "data": "idpro", className: "tdcenter"},  
            ],
            "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "visible": false,
            "targets": 5
                } ],
                "order": [[ 5, 'desc' ]],
            destroy: true,
            responsive: true

        });
        $('#tablaproduct').css("width","100%");
        t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
    $('#tablaproduct_wrapper').removeClass('container-fluid');
}

function tablaproduct2(id1,idemp,tipo){
  if (tipo == 1) {
    var enlace = BASE_URL+'/inventario/notinmodelpv/'+id1+'/'+idemp
  }else{
    var enlace = BASE_URL+'/inventario/pventa/'+id1+'/'+idemp
  }
  var t2 = $('#tablaproduct2').DataTable({

            "ajax": enlace,
            "columns": [
                { "data": null, className: "tdcenter"},
                { "data": "codigo" , className: "tdleft"},
                { "data": "product" , className: "tdleft"},
                { "data": "clasificacion" , className: "tdleft"},
                { "data": "idpro" , className: "tdcenter",  
                  render : function(data, type, row) { 
                        return '<label class="custom-control custom-checkbox" >'+
                                          '<input type="checkbox" class="custom-control-input" name="producto[]" id="id'+row['idpro']+'" value="'+row['idpro']+'" onclick="add2('+row['idpro']+')">'+
                                          '<span class="custom-control-indicator check" ></span>'+
                                        '</label>'
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
        $('#tablaproduct2').css("width","100%");
        t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
        $('#tablaproduct2_wrapper').removeClass('container-fluid');
}

function tablitapv(id,tipo){
  if (tipo == 1) {
    var enlace = BASE_URL+'/inventario/consultamodelopv/'+id
  }else{
    var enlace = BASE_URL+'/inventario/pventat/'+id
  }
  var ta = $('#tablapv').DataTable({
            "ajax": enlace,
            "columns": [

                { "data": "product" , className: "tdleft"},
                { "data": "idpro" , className: "tdcenter",  
                  render : function(data, type, row) { 
                        return '<i class="fa fa-remove remove2" style="float: right; cursor: pointer;"><input class="idpr" type="hidden" value="'+row['idpro']+'"/><input class="tipo" type="hidden" value="'+tipo+'"/></i>'
                  } 
                },
                { "data": "idpro", className: "tdcenter"},  
            ],
            "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "visible": false,
            "info" : false,
            "targets": 2
                } ],
                "order": [[ 2, 'desc' ]],
            destroy: true,
            responsive: true

        });
        $('#tablapv').css("width","100%");
        $('#tablapv_info').hide();
        $('#tablapv_wrapper').removeClass('container-fluid');
}

function tablita(id,tipo){
  //alert(tipo);
  if (tipo == 1) {
    var enlace = BASE_URL+'/inventario/consultamodelo/'+id
  }else{
    var enlace = BASE_URL+'/inventario/ingredientest/'+id
  }
  var ta2 = $('#tablapi').DataTable({
            "ajax": enlace,
            "columns": [

                { "data": "mercancia" , className: "tdleft"},
                { "data": "idpro" , className: "tdcenter",  
                  render : function(data, type, row) { 
                        return '<i class="fa fa-remove remove1" style="float: right; cursor: pointer;"><input class="idpr" type="hidden" value="'+row['idpro']+'"/><input class="tipo" type="hidden" value="'+tipo+'"/></i>'
                  } 
                },
                { "data": "idpro", className: "tdcenter"},  
            ],
            "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "visible": false,
            "info" : false,
            "targets": 2
                } ],
                "order": [[ 2, 'desc' ]],
            destroy: true,
            responsive: true

        });
        $('#tablapi').css("width","100%");
        $('#tablapi_info').hide();
        $('#tablapi_wrapper').removeClass('container-fluid');
}

function codigoPropuesto(familia){
   // $('#kodigo').empty();
    
    $('#co').empty();
    $.ajax({
                url: BASE_URL+'/inventario/codigoP/'+familia,
                type: 'post',
                dataType: 'json'
        })
        .done(function(cod) {
          $('#co').val(cod);
        })
        .fail(function() {
          $('#co').val('');
        })
        .always(function() {
          console.log("complete");
        });
    
}



function confirmacionDelete(idp,idt){
  //alert(idp);

$('#cuerpoi').empty();
$.ajax({
      url: BASE_URL+'/inventario/modalUpdate/'+idp+'/'+idt,
      type: 'POST',
      dataType: 'json',     
  })
  .done(function(data) {
    //alert(data[0][1]);
      $('#cuerpoi').empty();
      $('#cuerpoi').append(
        '<div class="alert alert-danger alert-dismissable" style="text-align:left">'+
        'Usted esta por eliminar el producto "'+data[0]['producto']+'" marca "'+data[0]['marca']+'". Realmente desea continuar?<br>Recuerde que eliminar dicho producto puede afectar las recetas en el que este forma parte y de la unidades de negocio que se encuentra asignado.<br>'+
      '<center><button style="margin-right: 3px" class="btn btn-sm btn-outline-success" onclick="eliminarPro('+idp+','+idt+')"><span class="fa fa-check"></span> Si</button>'+
      '<button class="btn btn-sm btn-outline-danger" onclick="cancelar()"><span class="fa fa-remove"></span> No</button></center>'+
      '</div>');
      $('#alerta').modal('show');
})
}

function cancelar(valor){
  //alert(id);
  if (valor == 1) {
    $('#error').modal('hide');
  }else{
    $('#alerta').modal('hide');
  }


}

function eliminarPro(idp, idt){


//alert(id);alert(submodelo);alert(grupi);alert(numeroP);alert(estado);
$('#alerta').modal('hide');
  $.ajax({
    url: BASE_URL+'/inventario/delete/'+idp+'/'+idt,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
      if (data == true) {
        window.location=BASE_URL+'inventario/evaluar/'+idt;
      }else{
        window.location=BASE_URL+'inventario/evaluar/'+idt;
      }
  })
  .fail(function() {
    window.location=BASE_URL+'inventario/evaluar/'+idt;
  })
  .always(function() {
    console.log("complete");
  }); 
  
}


function tablaCombo(data){
  $('#cuerpoT').empty();
  $('#tituloCombo').empty();
  //alert(data[0][2]['nombre']);
  var tamañoData = data.length;
      if (tamañoData > 0) {
        //alert(tamañoData);
        $('#tituloCombo').append('Conformar combo');
        $('#tablita').show('toggle');
        for (var i = 0; i <= data.length; i++) {
           $('#cuerpoT').append('<tr>'+
                               '<td>'+data[i]['codigo_padre']+'</td>'+
                               '<td>'+data[i]['codigo']+'</td>'+
                               '<td>'+data[i]['nombre']+'</td>'+
                               '<td>'+data[i]['cantidad']+'</td>'+
                               '<th>'+
                               '<center><a Onclick="eliminarAgregadoCombo('+data[i]['id']+')">'+
                                '<span  class="fa fa-remove"></span>'+
                                '</a></center>'+
                                '</th>'+
                               '</tr>'
                              );
        }
      }
}

function armarCombo(idSm, idC){
  //alert(idC);
  //$('#tituloCombo').empty(); 
  $('#tituloCombo').append('Conformar combo');
  //$('#codeCombo').empty(); 
  load('grupo','grupo',false,idSm);
  document.getElementById("codeCombo").value=idC;
  $.ajax({
    url: BASE_URL+'/producto/cargarTablaCombo/'+idC,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
      // alert(data['nombreP']);
      $('#tituloCombo').append('Conformar combo');
      tablaCombo(data);
  })
}

function agregarAlCombo(){
  var nombre; 
  var tipo=$('#tipo').val();
  var grupo=$('#grupo').val();
  var producto=$('#producto').val();
  var cantidad=$('#cantidad').val();
  var codigoPadre=$('#codeCombo').val();
  var subm=$('#sm').val(); 
  //alert(tipo); alert(grupo); alert(producto); alert(cantidad); alert(codigoPadre); alert(subm);
  if (producto == null || producto == "undefined") {
     nombre = grupo;
  }else{
     nombre = producto;
  }
  $.ajax({
    url: BASE_URL+'/producto/insertCombo/'+tipo+'/'+cantidad+'/'+nombre+'/'+codigoPadre+'/'+subm,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
    //$('#tipo').empty(); $('#grupo').empty(); $('#producto').empty(); $('#cantidad').empty(); $('#codeCombo').empty();
      tablaCombo(data);
  })
}

function eliminarAgregadoCombo(id){
  //alert(id);
  var codigoPadre=$('#codeCombo').val();
  var subM=$('#sm').val();
  $.ajax({
    url: BASE_URL+'/producto/eliminarCombo/'+id+'/'+codigoPadre+'/'+subM,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
    //$('#tipo').empty(); $('#grupo').empty(); $('#producto').empty(); $('#cantidad').empty(); $('#codeCombo').empty();
      tablaCombo(data);
  })

}

function infoFormula(){
    $('#alerta').modal('show');
    $('#cuerpo').empty();
    $('#t').empty();
    $('#t').append('¡Informacion!<br><br>');
    $('#cuerpo').append(
      '<div class="alert alert-info alert-dismissable" style="text-align:left">'+
       '<strong>¡Advertencia!</strong> Estas formulas deben convertir las U/M de compra o consumo en la U/M de sistema.<br> Ejemplo:<br></Ejemplo:br> (U/M) / CN ó (U/M) * CN <br> U/M = Unidad de medida <br> CN = Contenido neto'+
       '</div>'
    );
}

function infoConversion(idP, idT){
  //alert(idP); alert(idT);
  $.ajax({
    url: BASE_URL+'/inventario/modalUpdate/'+idP+'/'+idT,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
    $('#alerta').modal('show');
    $('.cuerpo').empty();
    $('#t').empty();
    $('#t').append('¡Conversion!');
    $('.cuerpo').append(
      '<div class="alert alert-info alert-dismissable" style="text-align:left">'+
       '<p>El producto tiene una existencia de: <br>'+data[0]['conversion']+'</p>'+
       '</div>'
    );
  })
}

function asignacionProveedor(){
    var code = $('#codigoP').val();
    var price = $('#precioP').val();
    var valor = $('#autoC').val();
    var name = valor.split(' ');
    var proveedor = name.join(':');
    //alert(proveedor); alert(code); alert(price);
    
    $.ajax({
      url: BASE_URL+'/inventario/carrito/'+proveedor+'/'+code+'/'+price,
            type: 'POST',
            dataType: 'json'
    })
    .done(function(data) {
      //alert(data[0]['nombre']);
      $('#columna').empty();
      $('#codigoP').val('');
      $('#precioP').val('');
      $('#autoC').val('');
      for (var i = 0; i < data.length; i++) {
          $('#columna').append('<tr>'+
                                 '<td style="text-align:left">'+data[i]['nombre']+'</td>'+
                                 '<td style="text-align:left">'+data[i]['codigo']+'</td>'+
                                 '<td style="text-align:left">'+data[i]['precio']+'</td>'+
                                 '<td>'+
                                 '<center>'+
                                 '<a onclick="deleteProve('+i+')">'+
                                 '<span  class="fa fa-remove"></span>'+
                                 '</a>'+
                                 '</center>'+
                                 '</th>'+
                               '</tr>'
                              );
          };
      //$('#prove').val(data[0]['id']);
    });
}

function deleteProve(indice){
  //alert(indice);
  if (indice == 0) {
    var indice = 'cero';
  }
  $.ajax({
      url: BASE_URL+'/inventario/deleteElementoCarrito/'+indice,
            type: 'POST',
            dataType: 'json'
    })
    .done(function(data) {
      if (data == false) {
        //alert('por aqui');
        $('#columna').empty();
      }else{
      $('#columna').empty();
        for (var i = 0; i < data.length; i++) {
          $('#columna').append('<tr>'+
                                 '<td style="text-align:left">'+data[i]['nombre']+'</td>'+
                                 '<td style="text-align:left">'+data[i]['codigo']+'</td>'+
                                 '<td style="text-align:left">'+data[i]['precio']+'</td>'+
                                 '<td>'+
                                 '<center>'+
                                 '<a onclick="deleteProve('+i+')">'+
                                 '<span  class="fa fa-remove"></span>'+
                                 '</a>'+
                                 '</center>'+
                                 '</th>'+
                               '</tr>'
                              );
          };
        }
    });
}

function productoU(id){
  alert(id);
}

function carga(tabla,item,valor,model,idP,idT){
    //alert(idP);
  var select = $('#'+item);
  //alert(select);
  $.ajax({
    url: BASE_URL+'main/gets/'+tabla+'/'+item+'/'+valor+'/'+model,
    dataType: 'json',
    
    
  })
  .done(function(data) {
    
      $.ajax({
      url: BASE_URL+'inventario/modalUpdate/'+idP+'/'+idT,
      dataType: 'json',
      })
      .done(function(data2) {
      //alert(data2[0]['idUMC']);
          select.empty();
          select.append('<option disabled>Seleccione..</option>');
        for (var i = 0; i < data.length; i++) {
          if (item == 'unidad_medida_co') {
            if (data[i]['id'] == data2[0]['idUMC']) {
              select.append('<option selected value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }else{
              select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }
            idmcom = data2[0]['idUMC'];
            if (idmcom == 8 || idmcom == 9 || idmcom == 10 || idmcom == 11 || idmcom == 16 || idmcom == 19 || idmcom == 23 ) {
              $('#canti').fadeIn('slow');
              $('#canti').prop('hidden', false);
            }else{
              $('#canti').fadeOut('fast');        
            }
          }else if(item == 'unidad_medida_pr' || item == 'unidad_mp1'){
            if (data[i]['id'] == data2[0]['idUMP']) {
              select.append('<option selected value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }else{
              select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }
          }else if(item == 'tipo_inventario'){
            if (data[i]['id'] == data2[0]['tipo_inventario_id']) {
              select.append('<option selected value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }else{
              select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }
          }else if (item == 'unidad_medida_si' || item == 'unidad_ms1') {
            if (data[i]['id'] == data2[0]['idUMS']) {
              select.append('<option selected value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }else{
              select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }
          }else if (item == 'familias' || item == 'sub_familia') {
            if (data[i]['id'] == data2[0]['idf']) {
              select.append('<option selected value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }else{
              select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }
          }
        }
      })
    
    
    
  })
  .fail(function() {
    alert("Error en el select "+item);
  })
  .always(function() {
      
  });

}


/*function descarga(idSm, idM, idD){
  alert(idSm); alert(idM); alert(idD);
  $.ajax({
    url: BASE_URL+'/producto/descarga/'+idSm+'/'+idM+'/'+idD,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
      alert(data[0]); alert(data[1]); alert(data[2]);
       // Empezamos por 0 en el array
    var aIndex = 0;
    // Iniciamos un timer que se ejecute cada 100ms
    var Ainterval = setInterval(function(){
      // Si el numero del index(array) es menor seguir
      if(aIndex < data.length){
        // Indicar el src al iframe
        alert(BASE_URL+'public/comunicaciones/'+data[aIndex]);
        $('#downloader').attr('src',BASE_URL+'public/comunicaciones/'+data[aIndex]);
        // Subir el index(array)
        //alert(aIndex);
        aIndex++;
      // En caso de que sea mayor, limpiar timer.
      } else {clearInterval(Ainterval);}
    }, 100);
  })
}*/
  $(document).on('click','#asignar',function(e) {
  var data = $("#form-asignar").serialize();
  var btn =$('#botoncontinuar').val();
      $.ajax({
         data: data,
         type: 'post',
         url: BASE_URL+'inventario/insertasignacion/',
         success: function(data){
              $('#asignar').blur();
              $('.exitofin').slideDown();
              $('.exitofin').prop('hidden', false);
              $('html,body').animate({
                  scrollTop: $(".exitofin").offset().top
              }, 1200);
              setTimeout(function() {$('.exitofin').slideUp();$('#loading').fadeIn();$('#loading').prop('hidden', false);$('#loading').fadeOut();$('#'+btn).trigger('click');}, 3000);
              setTimeout(function() {$('#pcompra').trigger('click');}, 5000);
         }
      });
 });  

  $(document).on('click','#asignar2',function(e) {
  var data = $("#form-asignar").serialize();
  var btn =$('#botoncontinuar').val();
      $.ajax({
         data: data,
         type: 'post',
         url: BASE_URL+'inventario/insertasignacionp/',
         success: function(data){
              $('#asignar2').blur();
              $('.exitofin').slideDown();
              $('.exitofin').prop('hidden', false);
              $('html,body').animate({
                  scrollTop: $(".exitofin").offset().top
              }, 1200);
              setTimeout(function() {$('.exitofin').slideUp();$('#loading').fadeIn();$('#loading').prop('hidden', false);$('#loading').fadeOut();$('#'+btn).trigger('click');}, 3000);

         }
      });
 });

$(document).on('click','#asignarM',function(e) {
  var data = $("#form-asignar").serialize();
  var btn =$('#botoncontinuar').val();
      $.ajax({
         data: data,
         type: 'post',
         url: BASE_URL+'inventario/asignacionxmodelo/',
         success: function(data){
              $('#asignar').blur();
              $('.exitofin').slideDown();
              $('.exitofin').prop('hidden', false);
              $('html,body').animate({
                  scrollTop: $(".exitofin").offset().top
              }, 1200);
              setTimeout(function() {$('.exitofin').slideUp();$('#loading').show();$('#loading').prop('hidden', false);$('#loading').fadeOut();$('#radiomodelo').trigger('click');}, 3000);
              setTimeout(function() {$('#pcompra').trigger('click');}, 5000);
         }
      });
 });  

  $(document).on('click','#asignar2M',function(e) {
  var data = $("#form-asignar").serialize();
  var btn =$('#botoncontinuar').val();
  
      $.ajax({
         data: data,
         type: 'post',
         url: BASE_URL+'inventario/asignacionxmodelopv/',
         success: function(data){
              $('#asignar2').blur();
              $('.exitofin').slideDown();
              $('.exitofin').prop('hidden', false);
              $('html,body').animate({
                  scrollTop: $(".exitofin").offset().top
              }, 1200);
              setTimeout(function() {$('.exitofin').slideUp();$('#loading').show();$('#loading').prop('hidden', false);$('#loading').fadeOut();$('#radiomodelo').trigger('click');}, 3000);
              setTimeout(function() {$('#pventa').trigger('click');}, 5000);
         }
      });
});