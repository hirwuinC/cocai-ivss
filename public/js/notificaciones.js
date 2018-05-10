function verificarN(valor){
  //alert(valor);
  $.ajax({
      url: BASE_URL+'/inventario/notificaciones/'+valor,
      type: 'POST',
      dataType: 'json',
    })
  .done(function(data) {
    //alert("sisi");
    var notif = data.length;
    var existentes = $('#requisiciones').val();
    //alert(notif);
      $('#circulo').css({'visibility': 'visible'});
      $('#notifications').empty();
      if (notif !=0) {
        $('#not').attr('data-toggle','dropdown');
        $('.fa-bell-slash').toggleClass('fa-bell-slash fa-bell');
        if (notif >=9) {
          $('#notifications').append('9+');
        }else{
          $('#notifications').append(notif);
        }
        
      }else{
        $('.fa-bell').toggleClass('fa-bell-slash fa-bell');
        $('#circulo').css({'visibility': 'hidden'});
      }
      
      if (existentes<notif) {
        webnotif(notif,data);
        
      }
      notifications(notif,data);
  })
  
}

function notifications(notif,data){
  
  
  $('#news').empty();
  var c=1;
  for (var i=0; i <= notif; i++) {
    switch (data[i]['status_id']) {
          case '126':
            st = 'Solicitud de remision';
            func = 1;
            campo = data[i]['remision_id'];
            idu = data[i]['idunt'];
            break;
          
          case '127':
            st = 'remision Enviada';
            func = 2;
          break;

          case '128':
            st = 'Recepcion de remision';
            func = 3;
          break;

          case '129':
            st = 'Requisicion';
            func = 1;
            campo = data[i]['reposicion_id'];
            idu = data[i]['idunt'];
          break;

          case '201':
            st = 'Requisicion recibida';
            func = 2;
            campo = data[i]['reposicion_id'];
            idu = data[i]['idurepo'];
          break;
        }
    v=c+ +i;
    if (data.length > 0) {
      if (data[i]['fecharemi']!=null) {
          $('#news').append('<li>'+
                          '<a class="notif" href="'+BASE_URL+'transferencia/index/'+idu+'/'+func+'">'+
                              ''+st+' #'+data[i]['remision_id']+'  <o style="font-size: 9px; color: #B1B0B0;">'+data[i]['fecharemi']+'</o>'+' <o style="font-size: 9px; color: #B1B0B0;">'+data[i]['horaremi']+'</o>'+
                          '</a>'+
                        '</li>'
          );
      }else{
        $('#news').append('<li>'+
                          '<a class="notif" href="'+BASE_URL+'transferencia/index/'+idu+'/'+func+'">'+
                              ''+st+' #'+data[i]['reposicion_id']+'  <o style="font-size: 9px; color: #B1B0B0;">'+data[i]['fecharepo']+'</o>'+' <o style="font-size: 9px; color: #B1B0B0;">'+data[i]['horarepo']+'</o>'+
                          '</a>'+
                        '</li>'
          );
      }
      
  }else{
    $('#news').empty();
  }


  }
  
}

function webnotif(cont,data) {
  $('#requisiciones').val('');
  $('#requisiciones').val(cont);
  if (Notification) {
    if (Notification.permission !== "granted") {
    Notification.requestPermission()
    }
    var title = "COCAI EPOC-WEB"
    var tipo = data[0]['status_id'];
    if (tipo == '129') {
      var x = 'Enviada por';
      var ti = data[0]['tiendaR'];
    }else if (tipo == '201') {
      var x = 'por';
      var ti = data[0]['tiendarepo'];
    }
    
    var extra = {
    icon: BASE_URL+"public/img/Logo-EPOC-WEB-vertical.png",
    body: "Nueva "+data[0]['status']+' '+x+' '+ti+' a las '+data[0]['horarepo']
    }
      

    var noti = new Notification( title, extra)
    noti.onclick = function(){

      alert("Nuevo pedido recibido a las "+data[0]['hora']);
      noti.close();
    }
    noti.onclose = {
    // Al cerrar
    }
    setTimeout( function() { noti.close() }, 15000)
  }


  incrementarreq(cont);
}

function incrementarreq(cont){
  $.ajax({
      url: BASE_URL+'/inventario/incrementarreq/'+cont,
      type: 'POST',
      dataType: 'json',
    })
  .done(function(data) {
    alert("aqui");
  });
}

/*function infoConversion(idP,idT){
  alert(idP); alert(idT);
  $.ajax({
    url: BASE_URL+'/inventario/modalUpdate/'+idP+'/'+idT,
    type: 'POST',
    dataType: 'json' 
  })
  .done(function(data) {
    //alert(data.length);
    //$('#modalconversion').modal('show');
    $('#existenciam').empty();
    $('#existenciam').val(data[0]['existencia']);
    $('#stockmin').empty();
    $('#stockmin').val(data[0]['stock_min']);
    $('#stockmax').empty();
    $('#stockmax').val(data[0]['stock_max']);
    $('#cuerpo').empty();
    $('#t').empty();
    $('#t').append('¡Conversion!<br><br>');
    $('#cuerpo').append(
      '<div class="alert alert-info alert-dismissable" style="text-align:left">'+
       '<p>El producto tiene una existencia de: <br>'+data[0]['conversion']+'</p>'+
       '</div>'
    );
  });
}*/




