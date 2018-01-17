function verificarN(valor){
  //alert("hola");
  $.ajax({
      url: BASE_URL+'/inventario/notificaciones/'+valor,
      type: 'POST',
      dataType: 'json',
    })
  .done(function(data) {
    //alert("sisi");
    var notif = data.length;
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

      notifications(notif,data);
  })
  
}

function notifications(notif,data){
  //alert(data[0][3]);
  
  $('#news').empty();
  var c=1;
  for (var i=0; i <= notif; i++) {
    switch (data[i][3]) {
          case '126':
            st = 'Solicitud de remision';
            func = 'rmm';
            break;
          
          case '127':
            st = 'remision Enviada';
            func = 'rme';
          break;

          case '128':
            st = 'Recepcion de remision';
            func = 'rrm';
          break;

          case '129':
            st = 'Reposicion de mercancia';
            func = 'rpm';
          break;
        }
    v=c+ +i;
    if (data.length > 0) {
      if (data[i]['fecharemi']!=null) {
          $('#news').append('<li>'+
                          '<a class="notif" href="'+BASE_URL+'inventario/'+func+'/'+data[i][3]+'/'+data[i][1]+'/'+data[i][8]+'/'+notif+'"">'+
                              ''+st+' #'+data[i][1]+'  <o style="font-size: 9px; color: #B1B0B0;">'+data[i]['fecharemi']+'</o>'+' <o style="font-size: 9px; color: #B1B0B0;">'+data[i]['horaremi']+'</o>'+
                          '</a>'+
                        '</li>'
          );
      }else{
        $('#news').append('<li>'+
                          '<a class="notif" href="'+BASE_URL+'inventario/'+func+'/'+data[i][3]+'/'+data[i][1]+'/'+data[i][8]+'/'+notif+'"">'+
                              ''+st+' #'+data[i][0]+'  <o style="font-size: 9px; color: #B1B0B0;">'+data[i]['fecharepo']+'</o>'+' <o style="font-size: 9px; color: #B1B0B0;">'+data[i]['horarepo']+'</o>'+
                          '</a>'+
                        '</li>'
          );
      }
      
  }else{
    $('#news').empty();
  }


  }
}

function infoConversion(idP,idT){
  //alert(idP); alert(idT);
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
}
