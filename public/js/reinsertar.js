$(document).ready(function() {
	var idt = $('#tienda').val();
	var idp = $('#idP').val();
	$.ajax({
        url: BASE_URL+'/inventario/consultdatosprod/'+idt+'/'+idp,
        type: 'POST',
        dataType: 'json'
    })
    .done(function(data) {
        $('#cantidadConsumo').val('');
              $('#cantidadConsumo').val(data[0]['cajas_x_bulto']);
              $('#cantidadConsumo2').val('');
              $('#cantidadConsumo2').val(data[0]['paquetes_x_caja']);
              $('#cantidadConsumo3').val('');
              $('#cantidadConsumo3').val(data[0]['unidades_x_paquete']);
              $('#cantidadConsumo4').val('');
              $('#cantidadConsumo4').val(data[0]['unidades_x_caja']);
    	setTimeout(function(){
    		$("#unidad_medida_c option[value="+ data[0]['idUMC'] +"]").attr("selected",true);
    		$("#unidad_medida_pr option[value="+ data[0]['idUMP'] +"]").attr("selected",true);
    		$("#unidad_medida_pr2 option[value="+ data[0]['idUMP2'] +"]").attr("selected",true);
    		$("#unidad_medida_pr3 option[value="+ data[0]['idUMP3'] +"]").attr("selected",true);
    		$("#unidad_medida_s option[value="+ data[0]['idUMS'] +"]").attr("selected",true);
    	},500);
    	setTimeout(function(){
    		var n = data[0]['unidadC'].search("(es)");
	        if (n != -1) {
	          var unidadcomp = data[0]['unidadC'].replace('(es)', "");
	        }else{
	          var unidadcomp = data[0]['unidadC'].replace('(s)', "");
	        }
	        $('#uc').empty();
	        $('#uc').text(unidadcomp);

	        var n1 = data[0]['unidadP'].search("(es)");
            if (n1 != -1) {
              var unidadc1 = data[0]['unidadP'].replace('(es)', "");
            }else{
              var unidadc1 = data[0]['unidadP'].replace('(s)', "");
            }

            var n2 = data[0]['unidadP2'].search("(es)");
            if (n2 != -1) {
              var unidadc2 = data[0]['unidadP2'].replace('(es)', "");
            }else{
              var unidadc2 = data[0]['unidadP2'].replace('(s)', "");
            }
            var n3 = data[0]['unidadP3'].search("(es)");
            if (n3 != -1) {
              var unidadc3 = data[0]['unidadP3'].replace('(es)', "");
            }else{
              var unidadc3 = data[0]['unidadP3'].replace('(s)', "");
            }
	        $('#umcons3').empty();
	        $('#umcons3').append(data[0]['unidadP3']);
	        $('#umco3').empty();
	        $('#umco3').append(unidadc3);
       		$('#umco2').empty();
        	$('#umco2').append(unidadc2);
            $('#umco1').empty();
            $('#umco1').append(unidadc1);
			$('#umcons1').empty();
            $('#umcons1').append(data[0]['unidadP']);
            $('#umcons2').empty();
            $('#umcons2').append(data[0]['unidadP2']);
            $('#umsis1').empty();
            $('#umsis1').append(data[0]['unidadS']);
    	},500)
	});
	
});