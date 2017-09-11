//$.noConflict();
$(document).ready(function() {
    //alert('ok');
    load('referencia','familia',false);
    load('unidad_medida','unidad_medida_c',false);
    load('unidad_medida','unidad_medida_pr',false);
    load('unidad_medida','unidad_medida_s',false);
    load('referencia','motivo',false,false);
    //mostrar o no el input de cantidad por articulo comprado (aplica para cajas y similares que contengan unidades expresadas en kg gr lt o ml)
    $('#unidad_medida_c').change(function(event) {
        var unidad_c = $('#unidad_medida_c').val();
        var textouc = $('#unidad_medida_c option:selected').text();
        //alert(unidad_p);
        //$('#unidad_medida_p').find("option[value='opcion_1']").remove();
        if (unidad_c != '4' && unidad_c != '5' && unidad_c != '6' && unidad_c != '12' && unidad_c != '13' && unidad_c != '14' && unidad_c != '21' && unidad_c != '26' && unidad_c != '27' && unidad_c != '7' && unidad_c != '8' && unidad_c != '15' && unidad_c != '17' && unidad_c != '18' && unidad_c != '20' && unidad_c != '22' && unidad_c != '23' && unidad_c != '24' && unidad_c != '25' && unidad_c != '28' && unidad_c != '10') {
          //alert("si");
          $('#cant').show();
          $('#cantC').empty();
          $('#cantC').append('<label class="control-label" style="float: left;">Ud. por '+textouc+'</label>'+
                             '<input style="width: 50%" type="text" class="form-control" name="cantidadConsumo">');
        }else{
          $('#cant').hide();
          $('#cantC').empty();
          //alert("else");
        }
        $.ajax({
          url: BASE_URL+'/inventario/setunidadT/'+unidad_c,
            type: 'POST',
            dataType: 'json'
        })
        .done(function(data) {
          //alert(data[0]['id']);
          var valor = $('#contenidoN').val();
          document.getElementById("formulac").value=data[0]['abreviatura']+' * '+valor;
         // $('#unidad_medida_p').find("option[value='opcion_1']").remove();
        })
        
      });

      $('#unidad_medida_pr').change(function(event) {

        var unidad_p = $('#unidad_medida_pr').val();
        var textoup = $('#unidad_medida_pr option:selected').text();
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

    $('#contenidoNe').keyup(function(event) {
        var valor = $('#contenidoNe').val();
        formulaCompra(valor);
    });


    $('#code').keyup(function(event) {
        var code = $('#code').val();
        //var subM = $('#sm').val();
        //alert(code);
        validarCodigo(code);
    });

    $('#marca').keyup(function(event) {
        var marca = $('#marca').val();
        //alert(marca);
        validarProducto(marca);
    });

    $('#asignacionTienda').change(function(event) {
        var tienda = $('#asignacionTienda').val();
        alert(tienda);
    });



});

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})


function formulaCompra(valor){
  var unidad = $('#formulac').val();
  var separador = '*'; // un espacio en blanco
  var limite    = 1;
  unidadc= unidad.split(separador, limite); //alert(unidadc[0]); alert(unidadc[1]);
  document.getElementById("formulac").value=unidadc+'* '+valor;
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
          $('#glyphicon').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove" data-toggle="tooltip" data-placement="bottom" title="Este codigo esta asignado a un producto"></span>');
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
          $('#glyphi').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove" data-toggle="tooltip" data-placement="bottom" title="Este producto esta registrado con este nombre en esta marca"></span>');
          $('#glyph').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="fa fa-remove" data-toggle="tooltip" data-placement="bottom" title="Este nombre esta asignado a un producto"></span>');
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
  $('#unidad_medida_pre').empty();
  $('#unidad_medida_si').empty(); 
  load('unidad_medida','unidad_medida_co',false);
  load('unidad_medida','unidad_medida_pre',false);
  load('unidad_medida','unidad_medida_si',false); 
  load('referencia','familias',false);
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
              //$('#codeU').val(data[0][1]);
              document.getElementById("idP").value=data[0][0];
              document.getElementById("codeU").value=data[0][1];
              document.getElementById("tcrU").value=data[0][2];
              document.getElementById("productoU").value=data[0][3];
              document.getElementById("marcaU").value=data[0][4];
              document.getElementById("pUnU").value=data[0][14];
              document.getElementById("stockminU").value=data[0][11];
              document.getElementById("stockmaxU").value=data[0][12];
              document.getElementById("contenidoNe").value=data[0][5];
              if (data[0][6] == null) {
                document.getElementById("formulacU").value=data[0][23]+' *';
              }else{
                document.getElementById("formulacU").value=data[0][6];
              }
              if (data[0][7] == null) {
                document.getElementById("formulapU").value=data[0][20]+' *';
              }else{
                document.getElementById("formulapU").value=data[0][7];
              }
              if (data[0][8] == null) {
                document.getElementById("formulasU").value=data[0][17]+' *';
              }else{
                document.getElementById("formulasU").value=data[0][8];
              }
              if (data[0][9] != null) {
                  $('#canti').show();
                  $('#cantCo').empty();
                  $('#cantCo').append('<label class="control-label" style="float: left;">Ud. por '+data[0][22]+'</label>'+
                             '<input style="width: 50%" type="text" class="form-control" name="cantidad" id="cantidad" value="'+data[0][9]+'">');
              }
              $('#unidad_medida_co').append(
                          '<option value="'+data[0][21]+'" selected>'+data[0][22]+'</option>'
                      );
              $('#unidad_medida_pre').append(
                          '<option value="'+data[0][18]+'" selected>'+data[0][19]+'</option>'
                      );
              $('#unidad_medida_si').append(
                          '<option value="'+data[0][15]+'" selected>'+data[0][16]+'</option>'
                      );
              $('#familias').append(
                          '<option value="'+data[0][24]+'" selected>'+data[0][25]+'</option>'
                      );
              var opciones =['0','1'];
              var opcionesPI =['Activo','Inactivo'];
                for (var y = 0; y < opciones.length; y++) {
                    if (data[0][26] == opciones[y]) {
                      //alert(ocultar);
                      $('#status').append('<option value="'+opcionesPI[y]+'" selected>'+opcionesPI[y]+'</option>');
                    }else{
                     // alert('no');
                      $('#status').append(
                                     '<option value="'+opcionesPI[y]+'">'+opcionesPI[y]+'</option>'
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

function format(input){
  var num = input.value.replace(/\D/g, "");
  if(!isNaN(num)){
    num = num.split('').join('').replace(/([0-9])([0-9]{2})$/, '$1,$2');
    num = num.toString().split('').join('').replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
    //num = num.toString().split('').join('').replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
    input.value = num;
  }else{ alert('Solo se permiten numeros');
    input.value = input.value.replace(/[^\d\.]*/g,'');
  }
}

//Este bloque de Codigo me da problemas con las notificaciones
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
//hasta aqui arroja el problema


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
      '<center><button class="btn btn-sm btn-success" onclick="eliminarPro('+idp+','+idt+')"><span class="fa fa-ok"></span> Si</button>'+
      '<button class="btn btn-sm btn-danger" onclick="cancelar()"><span class="fa fa-remove"></span> No</button></center>'+
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
