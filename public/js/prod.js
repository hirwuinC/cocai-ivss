$(document).ready(function() {
	//alert('ok');
    //---------------COMBOS----------------------
	  load2('referencia','dia_disponible',false,false);
  	load2('referencia','tipo_producto',false,false);
  	load2('referencia','tipo_manejo',false,false);
    //-----------PRODUCTOS-----------------------
    load2('referencia','dia_disponibles',false,false);
    load2('referencia','tipo_productos',false,false);
    load2('referencia','tipo_manejos',false,false);
    //-----------UPDATE PRODUCTOS-----------------------
    load2('referencia','dia_disponiblesU',false,false);
    load2('referencia','tipo_productosU',false,false);
    load2('referencia','tipo_manejosU',false,false);
    load2('referencia','familia_id',false,false);
    load2('unidad_medida','unidad_medida_c',false,false);
    


    //mostrar o no el input de cantidad por articulo comprado (aplica para cajas y similares que contengan unidades expresadas en kg gr lt o ml)
    $('#unidad_medida_c').change(function(event) {
        var unidad_c = $('#unidad_medida_c').val();
        var textouc = $('#unidad_medida_c option:selected').text();
        //alert(unidad_c);
        //$('#unidad_medida_p').find("option[value='opcion_1']").remove();
        $.ajax({
          url: BASE_URL+'/inventario/setunidadT/'+unidad_c,
            type: 'POST',
            dataType: 'json'
        })
        .done(function(data) {
          //alert(data[0]['padre_id']);
          load2('unidad_medida','unidad_medida_p',data[0]['id'],data[0]['padre_id']);
          
        })
        
        
        

        $('#unidad_medida_p').change(function(event) {

        var unidad_p = $('#unidad_medida_p').val();
        var textoup = $('#unidad_medida_p option:selected').text();
        if (textoup == 'Unidad' || textoup == 'Pieza') {
          alert("iguales");
          $('#contenidoneto').hide();
        }else{
          alert("diferente");
          $('#contenidoneto').show();
        }
        //alert(textouc);
        if (unidad_c != '4' && unidad_c != '5' && unidad_c != '6' && unidad_c != '12' && unidad_c != '13' && unidad_c != '14' && unidad_c != '21' && unidad_c != '26' && unidad_c != '27') {
          $('#cantx').empty();
          $('#cantx').append('<label class="control-label" style="float: left;">Cant. por '+textouc+'</label>'+
                                        '<input style="width: 100%" type="text" class="form-control" name="cantidad" id="cantidad">');
        }else{
          $('#cantx').empty();
          //alert("else");
        }
        $.ajax({
            url: BASE_URL+'/inventario/setunidadT/'+unidad_p,
            type: 'POST',
            dataType: 'json'
          })
        .done(function(data) {
            //alert(data[0]['abreviatura']);
            switch (data[0]['padre_id']) {
              case '1':
                $('#unidadS').empty();
                $('#unidadS').val('6');
              break;
              case '2':
                $('#unidadS').empty();
                $('#unidadS').val('12');
              break;
              case '3':
                $('#unidadS').empty();
                $('#unidadS').val('27');
              break;               
              default:
                $('#unidadS').empty();
                $('#unidadS').val('13');
              break;
            }
        });
      });
        
      });

    //---------MODAL DE CONFORMACION DE GRUPO: DEPENDENCIA DEL SELECT "TIPO"
    $('#tipo').change(function(event) {
        var tipo = $('#tipo').val();
        var idSm = $('#sm').val();
        $('#producto').empty();
        $('#cantidad').empty();
        //alert(tipo);
        if (tipo == 'P') {
           $('#product').show('toggle');
           load('grupo','grupo',false,idSm);
        }else{
          $('#product').hide('toggle');
          load('grupo','grupo',false,idSm);
        }
    });

    $('#grupo').change(function(event) {
        $('#producto').empty();
        $('#cantidad').empty();
        var idG = $('#grupo').val();
        //alert(idG);
        load('producto','producto',idG,false);

    });

    $('#co').keyup(function(event) {
        var code = $('#co').val();
        var subM = $('#sm').val();
        //alert(code);
        validarCodigo(code, subM);
    });

    $('#nombre').keyup(function(event) {
        var name = $('#nombre').val();
        var idsm = $('#sm').val();
        //alert(name);
        validarName(name, idsm);
    });

});

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

function idpro(idP,idT){
    // setear el id del sub modelo a la modal de modificar el nombre del mismo
    //alert(idP);
    $.ajax({
            url: BASE_URL+'/inventario/datosPT/'+idP+'/'+idT,
            type: 'POST',
            dataType: 'json',
          })

    .done(function(data) {
      //alert(data[0]['idM']);
      $('#enunciado').empty();
      $('#enunciado').append('<b>Actualizando los datos de '+data[0]['producto']+' '+data[0]['marca']+'</b>');
      $('#stockmin').empty();
      $('#stockmin').val(data[0]['stock_min']);
      $('#idmer').empty();
      $('#idmer').val(idP);
      $('#idtienda').empty();
      $('#idtienda').val(idT);
      $('#stockmax').empty();
      $('#stockmax').val(data[0]['stock_max']);
      $('#pU').empty();
      $('#pU').val(data[0]['precio_unitario']);
    });
}

function validarCodigo(code, subM){
    $.ajax({
            url: BASE_URL+'/producto/validarCod/'+code+'/'+subM,
            type: 'POST',
            dataType: 'json',
          })

    .done(function(data) {
      //alert(data);
      $('#glyphicon').empty();
        if (data === true) {
          //alert('Este codigo esta asignado a un producto');
          $('#glyphicon').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="bottom" title="Este codigo esta asignado a un producto"></span>');
          $('#botonG').prop('disabled',true);
        }else{
          //$('#glyphicon').append('<span style="color:green" class="glyphicon glyphicon-ok"></span>');
          //alert('Este codigo no esta asignado a ningun producto');
          $('#botonG').prop('disabled',false);
        }
    })
}

function validarName(name, idsm){
   n = name.split(' ');
   resultN= n.join(':');
    $.ajax({
            url: BASE_URL+'/producto/validarNombre/'+resultN+'/'+idsm,
            type: 'POST',
            dataType: 'json',
          })

    .done(function(data) {
      //alert(data);
      $('#glyphi').empty();
        if (data === true) {
          //alert('Este codigo esta asignado a un producto');
          $('#glyphi').append('<span style="color:red; margin-top:75%; margin-right:115%; font-size:20px;" class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="bottom" title="Este nombre esta asignado a un producto"></span>');
          $('#botonG').prop('disabled',true);
        }else{
          //$('#glyphicon').append('<span style="color:green" class="glyphicon glyphicon-ok"></span>');
          //alert('Este codigo no esta asignado a ningun producto');
          $('#botonG').prop('disabled',false);
        }
    })
}

function idM_Sm(idsM,idm,id){
	  // setear el id del sub modelo a la modal de modificar el nombre del mismo
	  //alert(id);
	  var probando = id; 
	  $('#idm').empty();
	  $('#idSubM').empty();
	  //input del sub modelo
	  document.getElementById("idp").value=id;
	  document.getElementById("idSubM").value=idsM;
	  document.getElementById("idMo").value=idm;
	  modalOtros(id);
}

function modalOtros(id){
  //alert(id);
  $('#dia_disponibles').empty();
  $('#tipo_productos').empty();
  $('#tipo_manejos').empty();
  $("#editOtros").modal();
      $.ajax({
            url: BASE_URL+'/producto/modalUpdate/'+id,
            type: 'POST',
            dataType: 'json',
          })
          .done(function(data) {
            //alert(data.dias.length);
              var idD = data.producto[0][4];
              var idTP = data.producto[0][5];
              var idTM = data.producto[0][6];
              $('#title').empty();
              $('#bu').empty();
              $('#tcr').empty();
              $('#kod').empty();
              $('#co').empty();
              $('#pa').empty();
              $('#pb').empty();
              $('#proI').empty();
              $('#oculta').empty();
              $('#title').append('<h4 class="modal-title">Esta modificando el producto: '+data.producto[0][1]+'</h4>');
              document.getElementById("cod").value=data.producto[0][11];
              document.getElementById("tCr").value=data.producto[0][7];
              document.getElementById("name").value=data.producto[0][1];
              document.getElementById("cos").value=data.producto[0][12];
              document.getElementById("pvpA").value=data.producto[0][13];
              document.getElementById("pvpB").value=data.producto[0][14];
              for (var i = 0; i < data.dias.length; i++) {
                  if (data.dias[i][0] === idD) {
                      $('#dia_disponibles').append(
                          '<option value="'+data.dias[i][0]+'" selected>'+data.dias[i][1]+'</option>'
                      );
                  }
                  else{
                      $('#dia_disponibles').append(
                            '<option value="'+data.dias[i][0]+'">'+data.dias[i][1]+'</option>'
                        );
                    }
                  }
                  for (var j = 0; j < data.tipoP.length; j++) {
                    if (data.tipoP[j][0] == idTP) {
                      $('#tipo_productos').append(
                          '<option value="'+data.tipoP[j][0]+'" selected>'+data.tipoP[j][1]+'</option>'
                      );
                  }else{
                      $('#tipo_productos').append(
                            '<option value="'+data.tipoP[j][0]+'">'+data.tipoP[j][1]+'</option>'
                        );
                    }
                  }
                  for (var k = 0; k < data.tipoM.length; k++) {
                    if (data.tipoM[k][0] == idTM) {
                      $('#tipo_manejos').append(
                          '<option value="'+data.tipoM[k][0]+'" selected>'+data.tipoM[k][1]+'</option>'
                      );
                  }else{
                      $('#tipo_manejos').append(
                            '<option value="'+data.tipoM[k][0]+'">'+data.tipoM[k][1]+'</option>'
                        );
                    }
                  }
                var ocultar = data.producto[0][3];
                var pro_inactivo = data.producto[0][2];
                if (ocultar== '1') {
                  ocultar = 'Si';
                }else{
                  ocultar='No';
                }
                if (pro_inactivo == '1') {
                  pro_inactivo = 'Inactivo';
                }else{
                  pro_inactivo ='Activo';
                }
                var opciones =['No','Si'];
                var opcionesPI =['Activo','Inactivo'];
                  for (var y = 0; y < opciones.length; y++) {
                    if (ocultar == opciones[y]) {
                      //alert(ocultar);
                      $('#oculta').append('<option value="'+ocultar+'" selected>'+ocultar+'</option>');
                    }else{
                     // alert('no');
                      $('#oculta').append(
                                     '<option value="'+opciones[y]+'">'+opciones[y]+'</option>'
                                    );
                    }

                    if (pro_inactivo == opcionesPI[y]) {
                      //alert(ocultar);
                      $('#proI').append('<option value="'+pro_inactivo+'" selected>'+pro_inactivo+'</option>');
                    }else{
                     // alert('no');
                      $('#proI').append(
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

function txt(idsm,idm,idD){
  //alert(idsm); alert(idm); alert(idD);
  $('#alerta').modal('show');
  $('#cuerpo').empty();
  $('#cuerpo').append('Usted esta por enviar una actualizacion de precios. Realmente desea continuar?<br><br>');
   $('#cuerpo').append(
  //'<label>'
  '<button class="btn btn-sm btn-success" onclick="actualizacionPrecios('+idsm+','+idm+','+idD+')"><span class="glyphicon glyphicon-ok"></span> Si</button>'+
  '<button class="btn btn-sm btn-danger" onclick="cancelar()"><span class="glyphicon glyphicon-remove"></span> No</button>'
);
  
}

function codigoPropuesto(idSm,idm){
   // $('#kodigo').empty();
    $('#co').empty();
    $.ajax({
                url: BASE_URL+'/producto/codigoP/'+idm+'/'+idSm,
                type: 'post',
                dataType: 'json'
        })
        .done(function(cod) {
            document.getElementById("co").value=cod[1]+''+cod[2]+'00'+cod[0];
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
                alert('Error');
        })
        .always(function() {
                console.log("complete");
        });
    
}

function actualizacionPrecios(idSM,idM,idD){
  //alert(id);
  $('#espera').show();
  //alert(idSM);
 // alert(idD);
 // alert(idM);
  $.ajax({
          url: BASE_URL+'/producto/txt/'+idSM+'/'+idM+'/'+idD,
          type: 'POST',
          dataType: 'json',
          
        })
        .done(function(result) {
            //alert(result);
            
            if (result == true) {
              $('#espera').hide();
              $('#alerta').modal('show');
              $('#cuerpo').empty();
              $('#cuerpo').append('Su actualizacion de precios fue enviada exitosamente.<br><br>');
              
              $('#cuerpo').append(
                '<button class="btn btn-sm btn-success" onclick="cancelar()"><span class="glyphicon glyphicon-ok"></span> Finalizar</button>');
            }else{
              $('#alerta').modal('show');
              $('#cuerpo').empty();
              $('#cuerpo').append('Su actualizacion de precios no fue enviada. Por favor intente nuevamente<br><br>');
              
              $('#cuerpo').append(
                '<button class="btn btn-sm btn-danger" onclick="cancelar()"><span class="glyphicon glyphicon-remove"></span> Cerrar</button>');
            
            }
        })
}

function confirmacionDelete(idsm, idm, idp){
  //alert(idp);
$('#alerta').modal('show');
$('#cuerpo').empty();
$.ajax({
      url: BASE_URL+'/producto/nombreProAlert/'+idp,
      type: 'POST',
      dataType: 'json',     
  })
  .done(function(data) {
    //alert(data[0][1]);
  //$('#cuerpo').empty();
      $('#cuerpo').append('Usted esta por eliminar el producto "'+data[0][1]+'" del sub-modelo "'+data[0][2]+'". Realmente desea continuar?<br><br>');
      $('#cuerpo').append(
      '<button class="btn btn-sm btn-success" onclick="eliminarPro('+idsm+','+idm+','+idp+')"><span class="glyphicon glyphicon-ok"></span> Si</button>'+
      '<button class="btn btn-sm btn-danger" onclick="cancelar()"><span class="glyphicon glyphicon-remove"></span> No</button>'
      );
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

function eliminarPro(idsm, idm, idp){


//alert(id);alert(submodelo);alert(grupi);alert(numeroP);alert(estado);
$('#alerta').modal('hide');
  $.ajax({
    url: BASE_URL+'/producto/delete/'+idsm+'/'+idm+'/'+idp,
    type: 'post',
    dataType: 'json',
    
  })
  .done(function(data) {
      if (data == true) {
        window.location=BASE_URL+'producto/inicio/'+idsm+'/'+idm+'/false';
      }else{
        window.location=BASE_URL+'producto/inicio/'+idsm+'/'+idm+'/false';
      }
  })
  .fail(function() {
    window.location=BASE_URL+'producto/inicio/'+idsm+'/'+idm+'/false';
  })
  .always(function() {
    console.log("complete");
  }); 
  
}

function addProCom(idsm, idm){
    //alert(idm);
    var pro = 0;
    var com = 1;
    //$('#alerta').modal('show');
    $('#cuerpo').empty();
    $('#titulo').empty();
    $('#titulo').append('<h4>Seleccione la opcion que deseas crear</h4>');
    $('#cuerpo').append(
    '<button class="btn btn-sm btn-primary" style="margin-right:18px" onclick="selectOption('+idsm+','+idm+','+pro+')"><span class="fa fa-cube"></span> Producto</button>'+
    '<button class="btn btn-sm btn-primary" onclick="selectOption('+idsm+','+idm+','+com+')"><span class="fa fa-cubes"></span> Combo</button>'
    );

}

function selectOption(idsm, idm, option){
    $('#enunciado').empty();
    $('#alerta').modal('hide');
    activarCod(idsm,idm);
    if (option == 0) {
      $('#produ').modal('show');
      //$('#g').show('slow');
      $('#enunciado').append('<h4 class="modal-title">Crear producto</h4>');
      document.getElementById("type").value=option;
    }else{
      //$('#s').show('toggle');
      //$('#combo').attr("href","#tab2");
      $('#enunciado').append('<h4 class="modal-title">Crear combo</h4>');
      document.getElementById("type").value=option;
      $('#produ').modal('show');
    }

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
                                '<span  class="glyphicon glyphicon-remove"></span>'+
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
