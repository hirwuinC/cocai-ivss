$(document).ready(function() {
  var idtienda = $('#idT').val();
  $.ajax({
    url: BASE_URL+'/inventario/validarInventarioInicial/'+idtienda,
        type: 'POST',
        dataType: 'json'
      })
      .done(function(data) {
        if (data.length==0) {
          $('#labelini').prop('hidden', false);
          $('.otros').prop('hidden', true);
        }else{
          $('#labelini').prop('hidden', true);
          $('.otros').prop('hidden', false);
        }
      });
  
  $('.radiostipo').click(function(event) {
    if ($('#otro').is(':checked')) {
      $('#tt').show();
      $('#tt').prop('hidden', false);
      $('#divcompleto').prop('hidden', false);
      $('#botn').prop('hidden', false);
    }else{
      $('#continuar').prop('disabled', false);
      $('#divcompleto').prop('hidden', false);
      $('#botn').prop('hidden', false);
      $('#tt').hide();
    }
  });
  
  $('.tipo_inv').change(function(event) {
    var hoy = $('#hoy').val();
    var tipo = $('#tipo_inventario').val();
    var tipoi = $('#tipo_inventario option:selected').text();
    if ($('#inicial').is(':checked')) {
      var tipo = 171;
      var tipoi = 'Inicial';
      $.ajax({
        url: BASE_URL+'/inventario/validarfechas/'+tipo+'/'+hoy,
        type: 'POST',
        dataType: 'json'
      })
      .done(function(data) {
        //$('#fecha_ini').attr('min', data['fechai']);
        $('#fecha_ini').attr('max', data['fechai']);
        $('#fecha_ini').val(data['fechai']);
        $('#fecha_fin').attr('min', data['fechaf']);
        $('#fecha_fin').attr('max', data['fechaf']);
        $('#fecha_fin').val(data['fechaf']);
      });
    }
    if ($('#final').is(':checked')) {
      var tipo = 172;
      var tipoi = 'Final';
      $.ajax({
        url: BASE_URL+'/inventario/validarfechas/'+tipo+'/'+hoy,
        type: 'POST',
        dataType: 'json'
      })
      .done(function(data) {
        //$('#fecha_ini').attr('min', data['fechai']);
        $('#fecha_ini').attr('max', data['fechai']);
        $('#fecha_ini').val(data['fechai']);
        $('#fecha_fin').attr('min', data['fechaf']);
        $('#fecha_fin').attr('max', data['fechaf']);
        $('#fecha_fin').val(data['fechaf']);
      });
    }
      if (tipoi == 'Inicial' || tipoi == 'Final') {
        $('#ffin').fadeIn('slow');
        $('#ffin').prop('hidden', false);
        $('#fini').empty();
        $('#fini').append('inicial');
        $('#fecha_fin').focus();
      }else if (tipoi != 'Diario' && tipoi != 'Inicial' && tipoi != 'Final') {
        $('#ffin').fadeIn('slow');
        $('#ffin').prop('hidden', false);
        $('#fini').empty();
        $('#fini').append('inicial');
        $('#fecha_fin').focus();
      $.ajax({
        url: BASE_URL+'/inventario/validarfechas/'+tipo+'/'+hoy,
        type: 'POST',
        dataType: 'json'
      })
    .done(function(data) {
      if (tipoi == 'Mensual') {
        var mayor = validar_fechaMayor(hoy,data['fechaf']);
        if (mayor == 1) {
          $('#continuar').prop('disabled', false);
          $('#error').hide();
        }else{
          $('#continuar').prop('disabled', true);
          $('#error').prop('hidden', false);
          $('#error').show();
        }
      }else{
        $('#error').hide();
      }

      $('#fecha_ini').attr('max', hoy);
      $('#fecha_ini').val(hoy);
      $('#fecha_fin').attr('min', data['fechaf']);
      $('#fecha_fin').attr('max', data['fechaf']);
      $('#fecha_fin').val(data['fechaf']);
    });
      }else{
        $('#fecha_ini').focus();
        $('#fini').empty();
        $('#ffin').fadeOut('slow');
        $('#fecha_fin').val(hoy);
        $('#continuar').prop('disabled', false);
        $('#error').hide();
        $('#fecha_ini').focus();
        $('#fecha_ini').val(hoy);
        $('#fecha_ini').attr('max',hoy);
      }
      
      
      
    });

  $('#fecha_ini').change(function(event) {
    var fecha1 = $('#fecha_ini').val();
    var tipo = $('#tipo_inventario').val();
    var hoy = $('#hoy').val();
    //alert(fecha1);

    $('#fecha_fin').focus();
    if ($('#inicial').is(':checked')) {
      var tipo = 171;
    }
    if ($('#final').is(':checked')) {
      var tipo = 172;
    }
    $.ajax({
        url: BASE_URL+'/inventario/validarfechas/'+tipo+'/'+fecha1,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
      if (tipo == 171 || tipo == 172) {
        //$('#fecha_ini').attr('min', data['fechai']);
        $('#fecha_ini').attr('max', data['fechai']);
        $('#fecha_ini').val(data['fechai']);
      }else{
        $('#fecha_ini').attr('max',hoy);
      }
      
      // $('#fecha_ini').val(data['fechai']);
      $('#fecha_fin').attr('min', data['fechaf']);
      $('#fecha_fin').attr('max', data['fechaf']);
      $('#fecha_fin').val(data['fechaf']);
    });
  });



  $('#continuar').click(function(event) {
    var fechain = $('#fecha_ini') .val();
    var fechafi = $('#fecha_fin').val();
    var tipo = $('#tipo_inventario').val();
    var text = $('#tipo_inventario option:selected').text();
    var idt = $('#idT').val();
    var f1 = formato(fechain);
    var f2 = formato(fechafi);
    $('#tipe').val('');
    $('#tipe').val(tipo);
    $('#unidad_n').val('');
    $('#unidad_n').val(idt);
    $('.export').prop('hidden', false);
    if ($('#inicial').is(':checked')) {
      var tipo = 171;
      var text = 'Inicial';
      $('#tipe').val('');
      $('#tipe').val(tipo);
    }
    if ($('#final').is(':checked')) {
      var tipo = 172;
      var text = 'Final';
      $('#tipe').val('');
      $('#tipe').val(tipo);
    }
    $.ajax({
        url: BASE_URL+'/inventario/validarCarga/'+tipo+'/'+fechain+'/'+fechafi+'/'+idt,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
      var validar = data.length;
      if (validar > 0) {
        var procesado = data[0]['procesado'];
        if (procesado == 1) {
          $('#cuerpo2').empty();
          if (fechain == fechafi) {
            $('#cuerpo2').append('<h4 style="color:red">Disculpe, el inventario "'+text+'" de fecha '+f1+' ya fue procesado seleccione un tipo de inventario o una fecha diferente e intente nuevamente</h4>');
          }else{
            $('#cuerpo2').append('<h4 style="color:red">Disculpe, el inventario "'+text+'" de fecha '+f1+' al '+f2+' ya fue procesado seleccione un tipo de inventario o un rango de fechas diferente e intente nuevamente</h4>');
          }
          $('#alerta2').modal('show');
          
        }else{
          mostrarDatos(tipo,fechain,fechafi,idt);
        }
      }else{
        insertIventario(tipo,fechain,fechafi,idt);
      }
    });   
  });


  $('#guardarm').click(function(event) {
    var fechain = $('#fecha_ini') .val();
    var fechafi = $('#fecha_fin').val();
    var tipo = $('#tipo_inventario').val();
    var idt = $('#idT').val();
    var cant1 = $('#cantidad1') .val();
    var cant2 = $('#cantidad2').val();
    var cant3 = $('#cantidad3').val();
    var iduc = $('#iduc').val();
    var idup = $('#idup').val();
    var idus = $('#idus').val();
    var comentario = $('#comentario').val();
    var idm = $('#idpro').val();
    var idinv = $('#idinve').val();
    
    if (cant1.length== 0 || cant1 == 0) {
      var cant1 = false;
    }
    if (cant2.length== 0 || cant2 == 0) {
      var cant2 = false;
    }
    if (cant3.length== 0 || cant3 == 0) {
      var cant3 = false;
    }
    if (comentario.length == 0) {
      var comentario = '******';
    }
    if (iduc.length == 0) {
      var iduc = false;
    }
    if ($('#inicial').is(':checked')) {
      var tipo = 171;
    }
    if ($('#final').is(':checked')) {
      var tipo = 172;
    }
    //alert(cant1);
    //alert(cant1);alert(cant2);alert(cant3);alert(iduc);alert(idup);alert(idus);alert(idm);alert(comentario);
    $.ajax({
        url: BASE_URL+'/inventario/conversor/'+cant1+'/'+cant2+'/'+cant3+'/'+iduc+'/'+idup+'/'+idus+'/'+idm,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
      //alert(cant1);alert(cant2);alert(cant3);alert(iduc);alert(idup);alert(idus);alert(idm);
      //alert(data);
      actualizacion(data,fechain,fechafi,tipo,idt,idus,comentario,idm,idinv);
    });

  });

});

        function validar_fechaMayor(fechaInicial,fechaFinal)
        {
            valuesStart=fechaInicial.split("-");
            valuesEnd=fechaFinal.split("-");
 
            // Verificamos que la fecha no sea posterior a la actual
            var dateStart=new Date(valuesStart[2],(valuesStart[1]-1),valuesStart[0]);
            var dateEnd=new Date(valuesEnd[2],(valuesEnd[1]-1),valuesEnd[0]);
            if(dateStart>=dateEnd)
            {
              return 1;
            }else{
              return 0;
            }
            
        }

        function mostrarDatos(tipo,fechain,fechafi,idt){
          //alert(idt);
          var t = $('#tablamercancia').DataTable({
            "ajax": BASE_URL+'/inventario/mostrarDatos/'+tipo+'/'+fechain+'/'+fechafi+'/'+idt,
            "lengthMenu": [[10, 25, 50, 100,-1], [10, 25, 50, 100, "Todos"]],
            "iDisplayLength": 50,
            "bStateSave": true,
            "columns": [
                { "data": null, className: "tdcenter"},
                { "data": "codigo" , className: "tdleft"},
                { "data": "mercancia" , className: "tdleft"},
                {"data": "familia" , className: "tdleft"},
                {"data": "stockt" , className: "tdright",
                  render : function(data, type, row) {
                    return ''+data+' '+row['abreviaturaS']
                  }
                },
                { "data": "stockr" , className: "tdright",  
                  render : function(data, type, row) { 
                    if (data) {
                      return '<a href="#" id="id'+row['idm']+'" onclick="cargar('+row['idinv']+','+row['idm']+')">'+data+' '+row['abreviaturaS']
                                '</a>'
                    }else{
                      var real = 'Cargar..';
                      return '<a href="#" id="id'+row['idm']+'" onclick="cargar('+row['idinv']+','+row['idm']+')">'+real
                                '</a>'
                    }
                        
                  } 
                },
                {"data": "dif" , className: "tdright",
                  render : function(data, type, row) {
                    if(row['diferencia']<0){
                      signo = "-",
                      nuevoValor    = "",
                      nuevaCadena = data.replace(signo, nuevoValor);
                      return '<o style="color:red" title="faltante de '+nuevaCadena+' '+row['abreviaturaS']+'">'+data+' '+row['abreviaturaS']+'</o>'
                    }else if (row['diferencia']>0) {
                      return '<o style="color:green" title="Sobrante de '+data+' '+row['abreviaturaS']+'">'+data+' '+row['abreviaturaS']+'</o>'
                    }else{
                      return '<o title="No hay diferencias entre sistema y la existencia real">'+data+' '+row['abreviaturaS']+'</o>'
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
        $('#tablamercancia').css("width","100%");
        t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        });
        }).draw();
        $('#tablita').fadeIn('slow');
        $('#tablita').prop('hidden', false);

        }

        function insertIventario(tipo,fechain,fechafi,idt){
          //alert(idt);alert(fechain);alert(fechafi);alert(tipo);
          $.ajax({
              url: BASE_URL+'/inventario/insertIventario/'+tipo+'/'+fechain+'/'+fechafi+'/'+idt,
              type: 'POST',
              dataType: 'json'
          })
          .done(function(data) {
            mostrarDatos(tipo,fechain,fechafi,idt);
          });
          

        }

        function cargar(idinv,idm){
          $('#idpro').val('');
          $('#idpro').val(idm);
          $('#idinve').val('');
          $('#idinve').val(idinv);
          $.ajax({
              url: BASE_URL+'/receta/mercancia/'+idm,
              type: 'POST',
              dataType: 'json'
          })
          .done(function(data) {
            $('#mtitle').empty();
            $('#mtitle').append('Existencia de '+data[0]['nombre']+' '+data[0]['marca']);
            if (data[0]['idUC'] == null) {
              $('#compra').hide();
            }else{
              $('#compra').show();
              $('#compra').prop('hidden', false);
            }

            if (data[0]['idUP'] == data[0]['idUS']) {
              $('#consumo').hide();
            }else{
              $('#consumo').show();
              $('#consumo').prop('hidden', false);
            }
            $('.monto').val('');
            $('#comentario').val('');
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
            $('#modalreal').modal('show');
          });
        }

        function actualizacion(existencia,fechain,fechafi,tipo,idt,idus,comentario,idm,idinv){
          var comment = comentario.replace(/ /gi, "@");
          if (existencia == 0) {
            var existencia = '*';
            //alert(existencia);
          } 
          $.ajax({
              url: BASE_URL+'/inventario/actualizacion/'+existencia+'/'+fechain+'/'+fechafi+'/'+tipo+'/'+idt+'/'+idus+'/'+comment+'/'+idm+'/'+idinv,
              type: 'POST',
              dataType: 'json'
          })
          .done(function(data) {
              $('#modalreal').modal('hide');
              $('#tablita').fadeOut('slow');
              $('#check').fadeIn(100);
              $('#check').prop('hidden', false);
              $('#check').fadeOut(1200);
              setTimeout(function() {mostrarDatos(tipo,fechain,fechafi,idt);}, 1200);
          });
        }

$(document).ready(function() {

  $('#finalizar').click(function(event) {
    var fechain = $('#fecha_ini') .val();
    var fechafi = $('#fecha_fin').val();
    var tipo = $('#tipo_inventario').val();
    var idt = $('#idT').val();
    var f1 = formato(fechain);
    var f2 = formato(fechafi);
    if (fechain!=fechafi) {
      $('#t').empty();
      $('#t').append('<h5>Carga de inventario del '+f1+' al '+f2+'</h5>');
      $('#cuerpo').empty();
      $('#cuerpo').append('<h5 style="text-justify: justify">Antes de proceder, por favor asegurese de haber cargado la existencia real de cada producto correspondiente al inventario del '+f1+' al '+f2+', <o style="color: red">ya que la existencia de sistema sera actualizada con el valor de la existencia real ingresada y una vez procesado no se pueden hacer modificaciones</o>. si esta seguro de finalizar la carga de este inventario presione continuar.</h5>');
    }else{
      $('#t').empty();
      $('#t').append('<h5>Carga de inventario del '+f1+'</h5>');
      $('#cuerpo').empty();
      $('#cuerpo').append('<h5 style="text-justify: justify">Antes de proceder, por favor asegurese de haber cargado la existencia real de cada producto correspondiente al inventario del dia '+f1+', <o style="color: red">ya que la existencia de sistema sera actualizada con el valor de la existencia real ingresada y una vez procesado no se pueden hacer modificaciones</o>. si esta seguro de finalizar la carga de este inventario presione continuar.</h5>');
    }
    
    $('#alerta').modal('show');


  });
  $('#guardaralerta').click(function(event) {
    var fechain = $('#fecha_ini') .val();
    var fechafi = $('#fecha_fin').val();
    var tipo = $('#tipo_inventario').val();
    var idt = $('#idT').val();
    if ($('#inicial').is(':checked')) {
      var tipo = 171;
    }
    if ($('#final').is(':checked')) {
      var tipo = 172;
    }
    $.ajax({
      url: BASE_URL+'/inventario/validartodoscargados/'+fechain+'/'+fechafi+'/'+tipo+'/'+idt,
      type: 'POST',
      dataType: 'json'
    })
    .done(function(data) {
      var existenciareal = 0;
      for (var i = 0; i < data.length; i++) {
        //alert(data[i]['existencia_real']);
        if (data[i]['existencia_real']==null) {
          var existenciareal = existenciareal +1;
        }
      }
      $('#alerta').modal('hide');
      if (existenciareal!=0) {
        $('#faltaxcargar').fadeIn('slow');
        $('#faltaxcargar').prop('hidden', false);
        $('html,body').animate({
            scrollTop: $("#tablarecetario").offset().top
        }, 1555);
      }else{
        $('#faltaxcargar').prop('hidden', true);
        finalizado(); 
      }
      
    
    });
  });

  $('#cerraralert').click(function(event) {
    $('#faltaxcargar').fadeOut('slow');
  });


  $('#exportarExcel').click(function(event) {
    /*var fechain = $('#fecha_ini') .val();
    var fechafi = $('#fecha_fin').val();
    var tipo = $('#tipo_inventario').val();
    var idt = $('#idT').val();
    if ($('#inicial').is(':checked')) {
      var tipo = 171;
    }
    if ($('#final').is(':checked')) {
      var tipo = 172;
    }
    var link =  BASE_URL+'inventario/tomaInventario/'+tipo+'/'+fechain+'/'+fechafi+'/'+idt;
    $.ajax({
      url: BASE_URL+'inventario/tomaInventario/'+tipo+'/'+fechain+'/'+fechafi+'/'+idt,
      type: 'POST',
      dataType: 'json'
    })
    .done(function(data) {
      alert("descargado");
    })
    .fail(function(data) {
      //alert(link);
    });*/
  });
    



  

});



  function finalizado(){
    var fechain = $('#fecha_ini') .val();
    var fechafi = $('#fecha_fin').val();
    var tipo = $('#tipo_inventario').val();
    var idt = $('#idT').val();
    if ($('#inicial').is(':checked')) {
      var tipo = 171;
    }
    if ($('#final').is(':checked')) {
      var tipo = 172;
    }
    $.ajax({
      url: BASE_URL+'/inventario/finCargaInv/'+fechain+'/'+fechafi+'/'+tipo+'/'+idt,
      type: 'POST',
      dataType: 'json'
    })
    .done(function(data) {
      if (tipo != 164) {
        $('#np').empty();
        $('#np').append(''+fechain+' - '+ fechafi+'');
    }else{
      $('#np').empty();
      $('#np').append(fechain);
    }
      

    $('#actualizado').prop('hidden', false);
      setTimeout(function() {window.location=BASE_URL+'inventario/evaluar/'+idt;}, 5000);
    });
  }