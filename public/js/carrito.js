$(document).ready(function() {
    $('#crearorden').trigger('click');
    $('#consultarordenes').click(function(event) {
        tablaconsultOC();
    });
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
        var moneda = $('#monedatienda').val();
    	//alert(data[1][0]+' Bs'); alert(data[1][1]+' Bs'); alert(data[1][2]+' Bs'); 
    	if (data == true) {
			$('#cancelar').prop('disabled',true);
			$('#solicitar').prop('disabled',true);
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
    $('#idprov').change(function(event) {
            idprov = $('#idprov').val();
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

function insertsolicitud(valor){
    //alert('si');
    window.location.replace(BASE_URL+'transferencia/insertsolicitudr/'+valor);
        
}

function agregar (id,idt,cant,cantx,idprov,textouc,um) {
    var precioOC = $('#precioOC').val();
    if (precioOC) {
        var poc = precioOC;
        $('#solicitar').attr('onclick', 'insertsolicitud(1)');
    }else{
        var poc = 'false';
        $('#solicitar').attr('onclick', 'insertsolicitud(2)');
    }
    var tiendar = $('#tiendar').val();
    if (tiendar!=null) {
        var enlace = BASE_URL+'/inventario/carroCompra/'+id+'/'+1+'/'+idt+'/'+cant+'/'+cantx+'/'+idprov+'/'+textouc+'/'+um+'/'+tiendar+'/'+poc;
    }else{
        var enlace = BASE_URL+'/inventario/carroCompra/'+id+'/'+1+'/'+idt+'/'+cant+'/'+cantx+'/'+idprov+'/'+textouc+'/'+um+'/false'+'/'+poc;
    }
    /*if (screen.width < 800){
        $('#cartshop').addClass('plus');
        $('#cartshop').css('color', 'green');
        setTimeout(function() {$('#cartshop').removeClass('plus');$('#cartshop').css('color', 'black');}, 1000);   
    }*/
    //alert(cant); alert(idt);
	//alert(textouc);

	$.ajax({
        url: enlace,
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
    $('#botonescancelar').append('<div class="col-xs-12 col-sm-2">'+
                                        '<button class="btn btn-sm btn-outline-secondary" id="cerrarModal">No</button>'+
                                    '</div>'+
                                    '<div class="col-xs-12 col-sm-2">'+
                                        '<button class="btn btn-sm btn-outline-primary" onclick="cancelarPedido()">Si</button>'+
                                    '</div>');
    $('#cerrarModal').click(function(event) {
        $('#closem2').trigger('click');
    });
}


function cancelarPedido(){
	//alert('si llegue');
	$('#modalanular2').modal('hide');
	$.ajax({
        url: BASE_URL+'/inventario/cancelarPedido',
        type: 'POST',
        dataType: 'json',
    })
    .done(function(data) {
    	//alert('cancelado');
        $('#carrito-i').slideUp('slow');
    	tablaPedido('false');
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
    var moneda = $('#monedatienda').val();
    
    //$('#closem2').trigger('click');
    //alert(data[1]);
    if (data) {
        $('#cancelar').prop('disabled',false);
        $('#solicitar').prop('disabled',false);
    }
    if (data == true) {
        $('#cancelar').prop('disabled',true);
        $('#solicitar').prop('disabled',true);
    }
    var tt = data[1].toLocaleString('es-ES', { minimumFractionDigits: 4 });
    $('#pedido').empty(); $('#t').empty(); $('#ti').empty(); $('#st').empty();
    $('#st').append('<td style="border: none; padding: 3px">SubTotal:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][2]+' '+moneda+'</b></td>');
    $('#ti').append('<td style="border: none; padding: 3px">ITBMS:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+data[1][1]+' '+moneda+'</b></td>');
    $('#t').append('<td style="border: none; padding: 3px">TOTAL:</td>'+
                        '<td style="text-align: right;border: none; padding: 3px"><b>'+tt+' '+moneda+'</b></td>');
        for (var i =1; i <=data[0].length; i++) {
            var c = parseFloat(data[0][i]['precio']);
            var cant = c.toLocaleString('es-ES', { minimumFractionDigits: 4 });
            $('#pedido').append(
            '<tr>'+
            '<td class="columnas" style=" text-align: left;">'+data[0][i]['codigo']+'</td>'+                          
            '<td class="columnas" style=" text-align: left;">'+data[0][i]['nombre']+' '+data[0][i]['marca']+'</td>'+ 
            '<td class="columnas" style=" text-align: center;">'+data[0][i]['cantidad']+' '+data[0][i]['unidadc']+'</td>'+
            '<td class="columnas" style=" text-align: left;">'+data[0][i]['proveedor']+'</td>'+
            '<td class="columnas" style=" text-align: right;">'+cant+' '+moneda+'</td>'+
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

    function tablaconsultOC(){
        var idt = $('#tiendae').val();
        var tc = $('#tablaconsultOC').DataTable({
            "ajax": BASE_URL+'/compra/consultasOC/'+idt,
            "columns": [
                { "data": null, className: "tdcenter font11"},
                { "data": "num_reposicion", className: "tdleft font11"},
                { "data": "fecha", className: "tdcenter font11",
                    render : function(data,type, row){
                        return ''+data+'<br>'+row['hora']                      
                    }
                },
                { "data": "nombreproveedor", className: "tdleft font11",
                    render : function(data,type, row){
                        return ''+data                        
                    }
                },
                { "data": "email", className: "tdleft font11",
                    render : function(data,type, row){
                        return ''+data
                    }
                },
                { "data": "nombre", className: "tdleft font11",
                    render : function(data,type, row){
                        return ''+data+' '+row['apellido']  
                    }
                },        
                { "data": "idrepo", className: "tdcenter ",
                    render : function(data, type, row) {
                            return '<span class="fa fa-list-alt" title="Ver detalles de la reposicion '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="detallesOC('+data+')"></span>'+
                                    '<span class="fa fa-file-pdf-o ml-2" title="imprimir la solicitud '+row['num_reposicion']+'" style="cursor:hand; cursor:pointer; color: #337ab7" onclick="printOC('+data+','+idt+')"></span>'
                       
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
    $('#tablaconsultOC').css("width","100%");
    tc.on( 'order.dt search.dt', function () {
    tc.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
    } ).draw();
        $('#tablaconsultOC_wrapper').removeClass('container-fluid');
        $('#tablaconsultOC_filter').css('float', 'right');
        
        
    }

    function printOC(idr,idt){
        var url = BASE_URL+'printer?r='+idr+'&idti='+idt;  
        abrir_emergente(url);
    }

