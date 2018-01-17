//$.noConflict();
$(document).ready(function() {
    //alert('ok');

    $('.continue').prop('disabled', true);
    load('referencia','familia',false);
    load('unidad_medida','unidad_medida_c',false);
    load('unidad_medida','unidad_medida_pr',false);
    load('unidad_medida','unidad_medida_s',false);
    load('referencia','motivo',false,false);
    

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

      $('.ump').change(function(event) {

        var unidad_p = $('.ump').val();
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

    $('.AT').change(function(event) {
        tienda = $(this).val();
        idt2 = $(this).attr('id');
        
        $('.continue').val(tienda);
        $('.continue').prop('disabled', false);
    });


    $('.continue').click(function(event) {

      setTimeout(function() {$('.tablas').fadeOut('fast');$('.tablas').fadeIn('slow');$('.tablas').prop('hidden', false);}, 100);
        var at = $('.continue').val();
        idt = $(this).val();
        idemp = $('#idempresa').val();
        $('#idti').val('');
        $('#idti').val(idt);
        setTimeout(function() {
        var t = $('#tablaproduct').DataTable({

            "ajax": BASE_URL+'/inventario/ingredientes/'+idt+'/'+idemp,
            "columns": [
                { "data": null, className: "tdcenter"},
                { "data": "codigo" , className: "tdleft"},
                { "data": "mercancia" , className: "tdleft"},
                { "data": "idpro" , className: "tdcenter",  
                  render : function(data, type, row) { 
                        return '<label class="custom-control custom-checkbox" >'+
                                          '<input type="checkbox" class="custom-control-input" name="mercancia[]" id="id'+row['idpro']+'" value="'+row['idpro']+'" onclick="add('+row['idpro']+')">'+
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
        $('#tablaproduct').css("width","100%");
        t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
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
      //alert(data.length);
      if (data.length == 0) {
        $('#bodytabla2').empty();
        $('#bodytabla2').append('<tr><td>La tienda seleccionada aun no tiene ningun producto asignado</td></tr>');
      }else{
        $('#bodytabla2').empty();
      for (var i = 0; i<= data.length; i++) {
        $('#bodytabla2').append('<tr id="t'+data[i]['idpro']+'"><td>'+data[i]['producto']+' '+data[i]['marca']+'<i class="fa fa-remove" style="float: right; cursor: pointer;" ><input type="hidden" value="'+data[i]['idpro']+'"/></i></td></tr>');
      }
      }
      
      
    });
        
       }, 400); 
    });

    $('#info').click(function(event) {
      $('.tablas').fadeOut('slow');
    });  



    $(document).on("click", ".fa-remove", function(){
      var idpro = $(this).children().val();
      var idti = $('#idti').val();
      var nombret = $('#nombretienda').text();
      //alert(idt);
      //alert(idpro);
      $.ajax({
            url: BASE_URL+'/inventario/modalUpdate/'+idpro+'/'+idti,
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
              'Usted esta por eliminar el producto "'+data[0]['producto']+'" marca "'+data[0]['marca']+'", de la tienda '+nombret+'. ¿Realmente desea continuar?<br>Recuerde que eliminar dicho producto establecera la existencia del mismo en cero (0), si se lo vuelve a asignar mas adelante.<br>'+
              '</div>');
            
        });
        $('#modaldelete').modal('show');
      
      $('#mcontinuar').click(function(event) {
        $.ajax({
          url: BASE_URL+'/inventario/borrarasignacion/'+idpro+'/'+idti,
          type: 'POST',
          dataType: 'json',
        })
        .done(function(data) {
          //alert("llego aqui");
          $('#modaldelete').modal('hide');
          $('.fa-remove').closest("tr").remove();
          $('#continue').trigger('click');
        });

      });
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
      }else{
        $('#asignar').prop('disabled', true);
        $('#asignar').attr('title','No se han realizado cambios');
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
      }else{
        $('#asignar').prop('disabled', true);
        $('#asignar').attr('title','No se han realizado cambios');
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
    $.ajax({
            url: BASE_URL+'/inventario/validarProducto/'+name+'/'+resultN,
            type: 'POST',
            dataType: 'json',
          })

    .done(function(data) {
      //alert(data);
      $('#glyphi').empty();
        if (data === true) {
          //alert('Este codigo esta asignado a un producto');
          $('#glyphi').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove" ></span>');
          $('#glyph').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove" ></span>');
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
  carga('unidad_medida','unidad_medida_si',false,false,idP,idT); 
  carga('referencia','familias',false,false,idP,idT);
  //alert(idP);alert(idT);
      $.ajax({
            url: BASE_URL+'/inventario/modalUpdate/'+idP+'/'+idT,
            type: 'POST',
            dataType: 'json',
          })
          .done(function(data) {
            //alert(data[0][6]);
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
              $('#idP').val(data[0]['idP']);
              $('.abrevia').empty();
              $('.abrevia').append('('+data[0]['abreviaturaS']+')');
              $('#abrevU').empty();
              $('#abrevU').append(data[0]['abreviaturaP']+' por '+data[0]['unidadC']);
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
              /*if (data[0]['cantidad_presentacion'] != null) {
                  $('#canti').show();
                  $('#cantCo').empty();
                  $('#cantCo').append('<label class="control-label" style="float: left;">Ud. por '+data[0][22]+'</label>'+
                             '<input style="width: 50%" type="text" class="form-control" name="cantidad" id="cantidad" value="'+data[0][9]+'">');
              }*/
              var opciones =['0','1'];
              var opcionesPI =['Activo','Inactivo'];
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
              
          })

}


function activarCod(idSm, idm){
  //alert(idm);
  load('grupo','grup',false,idSm);
  codigoPropuesto(idSm,idm)
}




   window.onload =function codigoPropuesto(){
   // $('#kodigo').empty();
    var idT = $('#idT').val(); 
    $('#co').empty();
    $.ajax({
                url: BASE_URL+'/inventario/codigoP/'+idT,
                type: 'post',
                dataType: 'json'
        })
        .done(function(cod) {
          //alert(cod[1]);
            document.getElementById("co").value=cod[1]+'00'+cod[0];
                /*$('#kodigo').append(
                     '<label class="control-label" style="float: left;">Codigo</label>'+
                     '<input type="text" class="form-control" name="codigo" value="'+cod[1]+''+cod[2]+'00'+cod[0]+'" id="c">'
                    );*/
               /* $('#code').append(
                     '<label class="control-label" style="float: left;">Codigo</label>'+
                     '<input type="text" class="form-control" id="co" name="codigo" value="'+cod[1]+''+cod[2]+'00'+cod[0]+'">'
                    );  */
        })
        .fail(function() {
             //   alert('Error');
        })
        .always(function() {
                console.log("complete");
        });
    
}



function confirmacionDelete(idp,idt){
  //alert(idp);
$('#alerta').modal('show');
$('#cuerpo').empty();
$.ajax({
      url: BASE_URL+'/inventario/modalUpdate/'+idp+'/'+idt,
      type: 'POST',
      dataType: 'json',     
  })
  .done(function(data) {
    //alert(data[0][1]);
      $('#cuerpo').empty();
      $('#cuerpo').append(
        '<div class="alert alert-danger alert-dismissable" style="text-align:left">'+
        'Usted esta por eliminar el producto "'+data[0]['producto']+'" marca "'+data[0]['marca']+'". Realmente desea continuar?<br>Recuerde que eliminar dicho producto puede afectar las recetas en el que este forma parte y de la unidades de negocio que se encuentra asignado.<br>'+
      '<center><button style="margin-right: 3px" class="btn btn-sm btn-outline-success" onclick="eliminarPro('+idp+','+idt+')"><span class="fa fa-check"></span> Si</button>'+
      '<button class="btn btn-sm btn-outline-danger" onclick="cancelar()"><span class="fa fa-remove"></span> No</button></center>'+
      '</div>');
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
       '<strong>¡Advertencia!</strong> Esta formula debe convertir la U/M de compra en la U/M de sistema.<br> Ejemplo: (U/M) / CN o (U/M) * CN <br> U/M = Unidad de medida <br> CN = Contenido neto'+
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
    $('#cuerpo').empty();
    $('#t').empty();
    $('#t').append('¡Conversion!');
    $('#cuerpo').append(
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
          }else if(item == 'unidad_medida_pr'){
            if (data[i]['id'] == data2[0]['idUMP']) {
              select.append('<option selected value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }else{
              select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }
          }else if (item == 'unidad_medida_si') {
            if (data[i]['id'] == data2[0]['idUMS']) {
              select.append('<option selected value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }else{
              select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');
            }
          }else if (item == 'familias') {
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
      $.ajax({
         data: data,
         type: 'post',
         url: BASE_URL+'inventario/insertasignacion/',
         success: function(data){
              $('#asignar').blur();
              $('#exitofin').slideDown();
              $('#exitofin').prop('hidden', false);
              $('html,body').animate({
                  scrollTop: $("#exitofin").offset().top
              }, 1200);
              setTimeout(function() {$('#exitofin').slideUp();$('#continue').trigger('click');}, 3000);
         }
      });
 });