$(document).ready(function() {
  $('.pestanias').click(function(event) {
    $('#home').hide();
  });
  load('referencia', 'grupo', false, false);
  $('#grupo').change(function(event) {
    var gr = $('#grupo').val();
    var idemp = $('#tienda').val();
    load('referencia','familia',idemp,gr);
  });
  $('#alm37').change(function() {
    var idpadre = $(this).val();
    var texto = $('#alm37 option:selected').text();
    $('.titlet').empty();
    $('.titlet').append('Productos del '+ texto);
    $("input:checked").removeAttr("checked");
    $('#imgAlmacen').html('');
    $('#planoAlmacenImg').hide();
    resetseccionAbajo()
    resetAlmacen()
    if (idpadre>0) {
      consultarAlmacenes(idpadre,'subAl',1);
         }
    else
    {
      $('#subAl').empty();
      $('#subAl').append('<option value="0">Seleccione...</option>');
    
     }
     tablita(idpadre);
   });

  $('#mmEs1').change(function() {
    var padre = $(this).val();
    $('#mmEs12').empty();
    // $('#zn').empty();
    // $('#psll').empty();
    consultarAlmacenes(padre,'mmEs2',5);
  });
  $('#mmPl1').change(function() {
    var padre = $(this).val();
    $('#mmPl2').empty();
    // $('#zn').empty();
    // $('#psll').empty();
    consultarAlmacenes(padre,'mmPl2',4);
  });



  function resetseccionAbajo()
  {
   
    $('#mmPl1').empty();
    $('#mmPl2').empty();
    $('#mmEs1').empty();
    $('#mmEs2').empty();
    // $('#zn').empty();
    // $('#psll').empty();
    $('.mmPl').hide();
    $('.mmEs').hide();
    $('.ubicacionSa').hide();
  }
  function resetAlmacen()
  {
    $('#subAl').empty();
    
  }


  $('.rd').change(function(event){
    resetseccionAbajo();
    var keys = {'mmEs':'mmPl','mmPl':'mmEs'};
    var elemento = {'mmPl':2,'mmEs':3};
    var id = $(this).attr('data-clss');
    var valor = $(this).val();
    var subAl = $('#subAl').val();

    if (subAl>0) {
      consultarAlmacenes(subAl,id+1,elemento[id]);
      $('#'+id+2).empty();
      $('#'+id+2).append('<option value="0">Seleccione..</option>')
      $('.ubicacionSa').hide();
      $('.'+id).show();
      $('.ubicacionSa').show();
      $('.'+keys[id]).hide();

    }

    

  });

  $('#subAl').change(function(){
    var img= $('#subAl').val();
    $('#planoAlmacenImg').hide();
    $('#imgAlmacen').html('');
    resetseccionAbajo();

    if (img>0) {
       $("input:checked").removeAttr("checked");
       $('#imgAlmacen').html('<center><img src="http://localhost/cocai-ivss/public/img/'+img+'.png" alt="img" style="margin-top: 20px;margin-bottom:20px;" class="center-block" > </center>');
       $('#planoAlmacenImg').show();
    }
    $('#divtablita').fadeIn();
    $('#divtablita').prop('hidden', false);
  });
  

  $('#familia').change(function(event) {
    var fami = $('#familia').val();
    var idemp = $('#tienda').val();
    load('referencia','sub_familia',idemp,fami);
  });
	$('.alm').change(function(event) {
		$('.continue').prop('disabled', false);
	});
	$('.continue').click(function(event) {
		var alm = $('.alm').val();
		var cla = $('.cla').val();
		var sub = $('.sub').val();
		if (cla.length<=0) {
			var clasif = 'false';
		}else{
			var clasif = cla;
		}
		if (sub.length<=0) {
			var subcla = 'false';
		}else{
			var subcla = sub;
		}
		$.ajax({
            url: BASE_URL+'/inventario/filtrarprods/'+alm+'/'+clasif+'/'+subcla,
            type: 'POST',
            dataType: 'json'
        })
        .done(function(data) {
        	tablaprods(alm,clasif,subcla);
        })
        .fail(function(data) {
        	alert("su seleccion no arrojo ningun resultado");
        })

		
	});

	$('#guardarc').click(function(event) {
		$('#enviaform').trigger('click');
	});

	$('#form-config').submit(function(event) {
        event.preventDefault();
        var enlace = $(this).attr('action');
        var formdata = $("#form-config").serialize();
        $.ajax({
            url: enlace,
            type: 'POST',
            data: formdata,
            dataType: 'json'
        })
        .done(function(data) {
            $('#modaldetalles').modal('hide');
            $('#procesada').slideDown('slow');
            $('#procesada').prop('hidden', false);
            $('#nombeproducto1').empty();
            $('#nombeproducto1').append('Los datos del producto '+data+' fueron configurados de forma exitosa');
            setTimeout(function(){
                $('#procesada').slideUp('slow');
            },5000);
        });
        
    });
});

function consultarAlmacenes(idpadre,elemento,tipo)
{
  $.ajax({
        url: BASE_URL+'/ubicacion/consultarAlmacen/'+idpadre+'/'+tipo,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {

      if(data.length>0)
      {
        $('#'+elemento).empty();
        $('#'+elemento).append('<option value="0">Seleccione..</option>');
        for (var i = 0; i < data.length; i++) {
          
          $('#'+elemento).append('<option value="'+data[i].idU+'" data-img="'+data[i].img+'">'+data[i].nombre+'</option>');
                                                                    
        }
      }
      console.log(data);}
    )
    .fail(function(data) {
      alert("Disculpe, hay un error con los datos de este producto");
    });
}

function tablaprods(alm,clasif,subcla){

	var t =$('#tablaprod').DataTable({
        "ajax": BASE_URL+'/inventario/filtrarprods/'+alm+'/'+clasif+'/'+subcla,
        "columns": [
        	{ "data": null, className: "tdcenter"},
            { "data": "codigo" , className: "tdleft"},
            { "data": "producto" , className: "tdleft"},
            { "data": "marca" , className: "tdleft"},
            { "data": "familia" , className: "tdleft"},
            { "data": "subfamilia" , className: "tdleft"},
            { "data": "id" , className: "tdcenter",
          	render : function(data, type, row) { 		         		
	         	return '<span class="fa fa-cogs" style="cursor: hand; cursor: pointer; color: #337ab7" onclick="configurar('+data+','+alm+')" title="Conbfigurar '+row['producto']+'" id="spanid"></span>' 
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
    $('#tablaprod').css("width","100%");
    t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
    $('.tablas').fadeIn();
    $('.tablas').prop('hidden', false);
}

function configurar(idpro, almacen){
	
	carga('referencia','tipo_inventario',false,false,idpro,almacen);
	carga('referencia','tipo_almacenaje',false,false,idpro,almacen);
	$.ajax({
        url: BASE_URL+'/inventario/consultardatosp/'+idpro+'/'+almacen,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
    	$('#nombrepro').empty();
        $('#nombrepro').append(data[0]['producto']);
        $('#idpro').val('');
		$('#idpro').val(idpro);
		$('#idudn').val('');
		$('#idudn').val(almacen);
		$('#producto').val('');
		$('#producto').val(data[0]['producto']);
    	$('#modaldetalles').modal('show');
    })
    .fail(function(data) {
    	alert("Disculpe, hay un error con los datos de este producto");
    });
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
      url: BASE_URL+'inventario/consultardatosp/'+idP+'/'+idT,
      dataType: 'json',
      })
      .done(function(data2) {
      	$("#umvol option[value='"+data2[0]['umvolumen_id']+"']").attr("selected",true);
      	$('#zona').val('');
      	$('#pasillo').val('');
      	$('#cuadrante').val('');
      	$('#paleta').val('');
      	$('#rack').val('');
      	$('#columna').val('');
      	$('#estante').val('');
      	$('#entrepanio').val('');
      	$('#ancho').val('');
      	$('#alto').val('');
      	$('#largo').val('');
      	$('#stmin').val('');
      	$('#stmax').val('');
      	$('#reorden').val('');
      	$('#zona').val(data2[0]['zona']);
      	$('#pasillo').val(data2[0]['pasillo']);
      	$('#cuadrante').val(data2[0]['cuadrante']);
      	$('#paleta').val(data2[0]['paleta']);
      	$('#rack').val(data2[0]['rack']);
      	$('#columna').val(data2[0]['columna']);
      	$('#estante').val(data2[0]['estante']);
      	$('#entrepanio').val(data2[0]['entre_panio']);
      	$('#ancho').val(data2[0]['ancho']);
      	$('#alto').val(data2[0]['alto']);
      	$('#largo').val(data2[0]['largo']);
      	$('#stmin').val(data2[0]['stmin']);
      	$('#stmax').val(data2[0]['stmax']);
      	$('#reorden').val(data2[0]['reorden']);
      //alert(data2[0]['idUMC']);
        select.empty();
        select.append('<option disabled>Seleccione..</option>');
        for (var i = 0; i < data.length; i++) {
	        if(item == 'tipo_inventario'){
	            if (data[i]['id'] == data2[0]['tipo_inventario_id']) {
	              select.append('<option selected value="'+data[i]['id']+'">'+data[i][1]+'</option>');
	            }else{
	              select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');
	            }
	        }
	        if(item == 'tipo_almacenaje'){
	            if (data[i]['id'] == data2[0]['tipo_almacenaje_id']) {
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

function tablita(idt){
  var groupColumn = 1;
  var table = $('#tablita').DataTable({
            "ajax": BASE_URL+'/ubicacion/productosU/'+idt,
            "columns": [

               
                { "data": "grupo", className: "tdleft font11"},        
                { "data": "familia", className: "tdleft "},               
                { "data": "subfamilia", className: "tdleft "},
                { "data": "producto", className: "tdleft font11",
                  render : function(data,type, row){
                    return ''+data+' '+row['marca']
                  }
              },               
                
                { "data": "idP", className: "tdcenter ",
                    render : function(data,type, row){
                        return '<a href="#" onclick="nombredelafuncion('+data+','+row['idT']+')">Guardar</a>'
                    }
                }               
            ],
            "columnDefs": [
                { "visible": false, "targets": groupColumn }
            ],
            "order": [[ groupColumn, 'asc' ]],
                "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="7">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
            },
                //"order": [[ 1, 'asc' ]],
                destroy: true,
                responsive: true
                }); 
    $('#_10').on( 'click', function () {
        table.page.len( 10 ).draw();
    } );
    $('#tablita tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === groupColumn && currentOrder[1] === 'asc' ) {
            table.order( [ groupColumn, 'desc' ] ).draw();
        }
        else {
            table.order( [ groupColumn, 'asc' ] ).draw();
        }
    } );
    $('#tablita').css("width","100%");
        $('#tablita_wrapper').removeClass('container-fluid');
}