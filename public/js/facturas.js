$(document).ready(function() {
	load('direccion','estado',false);
	load('proveedor','selectp',false);
    $('#ingresar').trigger('click');
    var idt= $('#idtienda').val();
	$('#selectp').change(function(event) {
		var prov = $('#selectp').val();
		/*$('#form-prov').slideDown('fast');
		$('#form-prov').prop('hidden', false);*/
        $.ajax({
            url: BASE_URL+'/compra/datosproveedor/'+prov,
            type: 'POST',
            dataType: 'json'
        })
        .done(function(data) {
            $('#nombreprov').empty();
            $('#nombreprov').append(data[0]['nombreprov']);
            $('#rifprov').empty();
            $('#rifprov').append(data[0]['rif']);
            $('#razonprov').empty();
            $('#razonprov').append(data[0]['razon_social']);
            $('#correoprov').empty();
            $('#correoprov').append(data[0]['correo']);
            $('#estado').empty();
            $('#estado').append(data[0]['estado']);
            $('#municipio').empty();
            $('#municipio').append(data[0]['municipio']);
            $('#parroquia').empty();
            $('#parroquia').append(data[0]['parroquia']);
            $('#urbanizacion').empty();
            $('#urbanizacion').append(data[0]['urbanizacion']);
            $('#calle').empty();
            $('#calle').append(data[0]['calle']);
            $('#edificio').empty();
            $('#edificio').append(data[0]['edificio']);
            $('#tlf').empty();
            $('#tlf').append(data[0]['cod_tlf']+'-'+data[0]['numero']);
            $('#infoproveedor').fadeIn();
            $('#infoproveedor').prop('hidden', false);
        });
        
	});

    $('#infoproveedor').click(function(event) {
        $('#modalinfoprov').modal('show');
    });


	$('.house').click(function(event) {
        $('#dir-prov').show();
        $('#casa').show();
        $('#edif').hide();
        $('#edificio').prop('disabled', true);
        $('#intercomunicador').prop('disabled', true);
        $('#casa').prop('disabled', false);
        $('#dir-prov').prop('hidden', false);
        $('#house').prop('hidden', false);
        $('#edif').prop('hidden', false);
        $('#numint').prop('hidden', true);
        $('#ptoref').addClass('col-sm-offset-1');
        $('#ptoref').removeClass('col-sm-offset-0');
    });
    $('#building').click(function(event) {
        $('#dir-prov').show();
        $('#edif').show();
        $('#casa').hide();
        $('#casa').prop('disabled', true);
        $('#edificio').prop('disabled', false);
        $('#intercomunicador').prop('disabled', false);
        $('#dir-prov').prop('hidden', false);
        $('#house').prop('hidden', true);
        $('#edif').prop('hidden', false);
        $('#numint').prop('hidden', false);
        $('#ptoref').addClass('col-sm-offset-0');
        $('#ptoref').removeClass('col-sm-offset-1');
    });

    $('#estado').change(function(event) {
        $("#municipio option[value='Seleccione']").remove();
        var valor = $('#estado').val();
        $('#parroquia').empty();
        
        load('direccion','municipio',valor);
        $('#parroquia').append('<option selected disabled>Seleccione..</option>');
    });


    $('#municipio').change(function(event) {
        $("#parroquia option[value='Seleccione']").remove();
        var valor = $('#municipio').val();
        load('direccion','parroquia',valor);
        
    });
    tablaing(idt);
    
});

function tablaing(idt){
    alert(idt);
     var t2 = $('#tablaingredientes').DataTable({
            "ajax": BASE_URL+'/compra/materiaprima/'+idt,
            "lengthChange": false,
            "columns": [
                { "data": null, className: "tdcenter"},
                { "data": "codigi" , className: "tdleft"},
                { "data": "mercancia" , className: "tdleft"},
                { "data": "marca" , className: "tdleft"},
                { "data": "stock" , className: "tdright",
                    render : function(data, type, row) { 
                        if (row['stock']>row['stmax']) {
                            return '<o style="color: red; cursor:help" title="La existencia es superior al stock maximo">'+data+' '+row['abums']+'</o>'
                        }else if (row['stock']<row['stmin']) {
                            return '<o style="color: red; cursor:help" title="La existencia es inferior al stock minimo">'+data+' '+row['abums']+'</o>'
                        }else{
                            return ''+data+' '+row['abums']
                        }
                        
                    }
                },
                { "data": "stmin" , className: "tdright",
                    render : function(data, type, row) { 
                        return ''+data+' '+row['abums']
                    }
                },
                { "data": "stmax" , className: "tdright",
                    render : function(data, type, row) { 
                        return ''+data+' '+row['abums']
                    }
                },
                { "data": "idi",   
                    render : function(data, type, row) {
                        if (row['marca']==0) {
                            var mark = '';
                        }else{
                            var mark = row['marca'];
                        }
                        return '<input type="radio" name="radiob" class="form-control form-control-sm" id="" onclick="comprar('+row['idi']+')" title="Seleccionar '+row['mercancia']+' '+mark+'" style="cursor: pointer; cursor:hand;">'
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
    $('#tablaingredientes').css("width","100%");
    t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
    $('#tablaingredientes_wrapper').removeClass('container-fluid');
}
    
    function comprar(iding){
        //alert(iding);
        $('#idpro').val('');
        $('#idpro').val(iding);
        $.ajax({
          url: BASE_URL+'/receta/mercancia/'+iding,
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
        $('#modalcant').modal('show');
        });
    }