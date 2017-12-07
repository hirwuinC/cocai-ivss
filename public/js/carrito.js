$(document).ready(function() {
    $(window).on('ready , scroll', function() {
        if ($(window).scrollTop() > 30) {
            $('.main-menu').addClass('minified');
        } else {
            $('.main-menu').removeClass('minified');
        }
    });


    
	//alert('si');
	$('#pedido').empty(); $('#t').empty(); $('#ti').empty(); $('#st').empty();
	//$('#totalPagar').empty();

	$.ajax({
        url: BASE_URL+'/index/cargaPedidoIndex',
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
        var moneda = $('#monedas').val();
    	//alert(data[1][0]+' Bs'); alert(data[1][1]+' Bs'); alert(data[1][2]+' Bs'); 
    	if (data == true) {
			$('#cancelar').prop('disabled',true);
			$('#botonfin').prop('disabled',true);
		};  
		$('#st').append('<td style="border: none; padding: 3px">SubTotal:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][2]+' '+moneda+'</b></td>');
        $('#ti').append('<td style="border: none; padding: 3px">ITBMS:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][1]+' '+moneda+'</b></td>');
        $('#t').append('<td style="border: none; padding: 3px">TOTAL:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][2]+' '+moneda+'</b></td>');
    	for (var i =0; i <=data[0].length; i++) {
    		
            $('#pedido').append(
            '<tr>'+                             
            '<td class="columnas" style=" text-align: left;">'+data[0][i]['nombre']+'</td>'+
            '<td class="columnas col-xs-12 col-sm-12 col-lg-12" style=" text-align: center;"><button style="margin-right:2px; background:none; border:none" id="menos'+i+'" onclick="restarCantidad('+data[0][i]['id']+')"><span class=" fa fa-minus-circle" ></span></button>'+data[0][i]['cantidad']+'<button style="margin-left:2px; background:none; border:none" onclick="sumarCantidad('+data[0][i]['id']+')"><span class=" fa fa-plus-circle" ></span></button></td>'+
            '<td class="columnas" style=" text-align: right;">'+data[0][i]['precio']+' '+moneda+'</td>'+
            '<td class="columnas" style=" text-align: center;"><button style="background:none; border:none" onclick="eliminarProducto('+data[0][i]['id']+')"><span class=" fa fa-times" style="text-align:center;"></span></button></td>'+
        	'</tr>'); 
        	if (data[0][i]['cantidad'] == 1) {
				$('#menos'+i).prop('disabled',true);
			};       
         }

         
    })

    $('#cantidadR').keyup(function(event) {
        c1 = $('#cantidadR').val();
        c2 = $('#cantidadx1').val();
    }); 

    $('#unidades').change(function(event) {
            textouc = $('#unidades option:selected').text();
            um = $('#unidades').val();
        if (um == 8 || um == 9 || um == 10 || um == 11 || um == 16 || um == 19 || um == 23 ) {
          //alert(um);
            $('#cantx').prop('hidden', false);
            $('#cantx').slideDown();
            $('#cantC').empty();
            $('#cantC').append('Unidades. por '+textouc);
        }else{
          $('#cantidadx1').val('1');
          $('#cantx').slideUp();
          $('#cantC').empty();
          //alert("else");
        }
        
    });  
    idprov = 'false';
    $('#prove').change(function(event) {
            idprov = $('#prove').val();
    });    
    $('#cantidadx1').keyup(function(event) {
        delete c2;
        c2 = $('#cantidadx1').val();
    });
    $('#btnguardar').click(function(event) {
        delete idm; delete idt; delete um;
        idm = $('#mercid').val();
        idt = $('#tiendae').val();
        um = $('#unidades').val();
        //alert(idm+idt+c1+c2+um+idprov);
        agregar(idm,idt,c1,c2,idprov,textouc,um);
    });
            
        
    

     
 
	
	
	
});

function sugerenciaCompra(idc){
    //alert('si');
  $.ajax({
        url: BASE_URL+'/index/sugerenciaCompra',
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
      //alert(data[0]['nombre']);
      $('#suger').empty();
        $('#suger').append("<h5 style='color: #DC4A4A'>Le gustaria regresar al menu para agregar alguno de estos productos?</h5><br>");
        for (var i =0; i < data.length; i++) {
          $('#suger').append("<h5 style='color: #DC4A4A'>*"+data[i]['nombre']+".</h5><br>");
        };
            $('#foot').empty();
            $('#foot').append('<button type="button" class="btn btn-default" onclick="noAgregarMas('+idc+')" value="pmedpfam">No</button>'+
                                  '<button href="" id="si" class="btn btn-warning" >Si</button>');
            $('#modalsugerencias').modal('show');
      //tablaPedido(data);
        $('#si').click(function(event) {
            $('#modalsugerencias').modal('hide');
            for (var j =0; j < data.length; j++) {
                //alert(data[j]['nombre']);
                n = data[j]['nombre'].split(' ');
                resultN= n.join('-');
                $('#'+resultN).css({color:'#cc0000'});
            };
        });
    })

}

function insertsolicitud(){
    alert('si');
    window.location.replace(BASE_URL+'inventario/insertsolicitudr/');
        
}

function agregar (id,idt,cant,cantx,idprov,textouc,um) {
    /*if (screen.width < 800){
        $('#cartshop').addClass('plus');
        $('#cartshop').css('color', 'green');
        setTimeout(function() {$('#cartshop').removeClass('plus');$('#cartshop').css('color', 'black');}, 1000);   
    }*/
    //alert(cant); alert(idt);
	//alert(textouc);

	$.ajax({
        url: BASE_URL+'/inventario/carroCompra/'+id+'/'+1+'/'+idt+'/'+cant+'/'+cantx+'/'+idprov+'/'+textouc+'/'+um,
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
        $('#modalcant').modal('hide');
    	//alert(data[0][1]['nombre']);
    	tablaPedido(data);
    })
}

function sumarCantidad(id){
	//alert(id);
	$.ajax({
        url: BASE_URL+'/inventario/carroCompra/'+id+'/'+1,
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
    	//alert(data[0][1]['cantidad']);
    	tablaPedido(data);
    })
}

function restarCantidad(id){
	//alert(id)
	$.ajax({
        url: BASE_URL+'/inventario/carroCompra/'+id+'/'+2,
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
    	//alert(data[0][1]['cantidad']);
    	tablaPedido(data);
    })
}

function eliminarProducto(id){
	//alert(id)
	$.ajax({
        url: BASE_URL+'/inventario/borrarElementoCarrito/'+id,
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
    	//alert(data[0][1]);
        if (!data[0][1]) { 
            $('#carrito-i').slideUp('slow');
            tablaPedido('false');
        }else{
            tablaPedido(data);
        }
    	
    })
}

function confirmarCancelarPedido(){
	//alert('O.o');
	$('#botonescancelar').empty();
    $('#botonescancelar').append('<div class="col-sm-12">'+
                                    '<div class="col-xs-5 col-sm-6">'+
                                        '<button class="btn btn-warning" id="cerrarModal">Cancelar</button>'+
                                    '</div>'+
                                    '<div class="col-xs-5 col-sm-6">'+
                                        '<button class="btn btn-danger" onclick="cancelarPedido()">confirmar</button>'+
                                    '</div>'+
                                '</div>');
    $('#cerrarModal').click(function(event) {
        $('#closem2').trigger('click');
    });
}


function cancelarPedido(){
	//alert('si llegue');
	
	$.ajax({
        url: BASE_URL+'/inventario/cancelarPedido',
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
    	//alert('cancelado');
    	tablaPedido(data);
    })
}

function tablaPedido(data){
    if (data == 'false') {
        $('#carrito-i').slideUP('slow');
    }else{
        $('html,body').animate({
            scrollTop: $("#carrito-i").offset().top
        }, 1000);
    $('#carrito-i').prop('hidden', false);
    $('#carrito-i').slideDown('slow');
    var moneda = $('#monedas').val();
    
    //$('#closem2').trigger('click');
    //alert(data[1]);
    if (data == true) {
            $('#cancelar').prop('disabled',true);
            $('#botonfin').prop('disabled',true);
        };
    $('#pedido').empty(); $('#t').empty(); $('#ti').empty(); $('#st').empty();
    $('#st').append('<td style="border: none; padding: 3px">SubTotal:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][2]+' '+moneda+'</b></td>');
    $('#ti').append('<td style="border: none; padding: 3px">ITBMS:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][1]+' '+moneda+'</b></td>');
    $('#t').append('<td style="border: none; padding: 3px">TOTAL:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+numberFormat(data[1])+' '+moneda+'</b></td>');
        for (var i =1; i <=data[0].length; i++) {
            $('#pedido').append(
            '<tr>'+
            '<td class="columnas" style=" text-align: left;">'+data[0][i]['codigo']+'</td>'+                          
            '<td class="columnas" style=" text-align: left;">'+data[0][i]['nombre']+' '+data[0][i]['marca']+'</td>'+ 
            '<td class="columnas" style=" text-align: center;">'+data[0][i]['cantidad']+' '+data[0][i]['unidadc']+'</td>'+
            '<td class="columnas" style=" text-align: left;">'+data[0][i]['proveedor']+'</td>'+
            '<td class="columnas" style=" text-align: right;">'+numberFormat(data[0][i]['precio'])+moneda+'</td>'+
            '<td class="columnas" style=" text-align: center;"><button style="background:none; border:none" onclick="eliminarProducto('+data[0][i]['id']+')"><span class=" fa fa-times" ></span></button></td>'+
            '</tr>');   
            if (data[0][i]['cantidad'] == 1) {
                $('#menos'+i).prop('disabled',true);
            };
               
         }
    }
    
}

function imgXseleccion(id,idc){
    
        location.href = BASE_URL+'index/index/false/'+id+'/'+idc;
    
      
}

/**
     * Funcion que devuelve un numero separando los separadores de miles
     * Puede recibir valores negativos y con decimales
     */
    function numberFormat(numero){
      var num = numero.replace(/\D/g, "");
      if(!isNaN(num)){
        num = num.split('').join('').replace(/([0-9])([0-9]{2})$/, '$1,$2');
        num = num.toString().split('').join('').replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
        //num = num.toString().split('').join('').replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
        resultado = num;
      }else{ alert('Solo se permiten numeros');
        resultado = numero.replace(/[^\d\.]*/g,'');
      }
      return resultado;
    }

/*function carritoHeader(){
    //alert('sisa');
    $('#pedidos').empty(); $('#ts').empty(); $('#tis').empty(); $('#sts').empty();
    //$('#totalPagar').empty();

    $.ajax({
        url: BASE_URL+'/index/cargaPedidoIndex',
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
        //alert(data[1][0]+' Bs'); alert(data[1][1]+' Bs'); alert(data[1][2]+' Bs'); 
        if (data == true) {
            $('#cancelar').prop('disabled',true);
            $('#botonfin').prop('disabled',true);
        };  
        $('#sts').append('<td style="border: none; padding: 3px">SubTotal:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][0]+' Bs</b></td>');
        $('#tis').append('<td style="border: none; padding: 3px">TTL IVA:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][1]+' Bs</b></td>');
        $('#ts').append('<td style="border: none; padding: 3px">TOTAL:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][2]+' Bs</b></td>');
        for (var i =0; i <=data[0].length; i++) {
            
            $('#pedidos').append(
            '<tr>'+                             
            '<td class="columnas" style=" text-align: left;">'+data[0][i]['nombre']+'</td>'+
            '<td class="col-xs-4 col-sm-4 col-lg-4" style=" text-align: center;"><button style="margin-right:10px; background:none; border:none" id="menos'+i+'" onclick="restarCantidad('+data[0][i]['id']+')"><span class=" fa fa-minus-circle" style="font-size:20px"></span></button>'+data[0][i]['cantidad']+'<button style="margin-left:10px; background:none; border:none" onclick="sumarCantidad('+data[0][i]['id']+')"><span class=" fa fa-plus-circle" style="font-size:20px"></span></button></td>'+
            '<td class="columnas" style=" text-align: right;">'+data[0][i]['precio']+' Bs</td>'+
            '<td class="columnas" style=" text-align: center;"><button style="background:none; border:none" onclick="eliminarProducto('+data[0][i]['id']+')"><span class=" fa fa-times" style="text-align:center;"></span></button></td>'+
            '</tr>'); 
            if (data[0][i]['cantidad'] == 1) {
                $('#menos'+i).prop('disabled',true);
            };       
         }
});
}*/