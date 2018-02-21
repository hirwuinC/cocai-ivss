$(document).ready(function() {
	//alert('hola');
	$('#dh').click(function(event) {
        $('#datos2').slideToggle(200);
        $('#datos2').prop("hidden", false);
        $(this).find('.buscador').toggleClass('fa-chevron-down fa-chevron-up');
    });
    $(".monto").number(true, 4, ',', '.');
    $(".precios").number(true, 4, ',', '.');
});

function opciones (idsM,idm){
	//alert(idm);
	//$("#new").modal();
	$('#grupos').empty();
	$('#productos').empty();
	$('#grupos').append('<a class="btn btn-sm btn-primary" href="'+BASE_URL+'grupo/inicio/'+idm+'/'+idsM+'">Grupos'+
		'</a>');
	$('#productos').append('<a class="btn btn-sm btn-primary" href="'+BASE_URL+'producto/inicio/'+idm+'/'+idsM+'">Productos'+
		'</a>');

}

function load(tabla,item,valor,model){
		//alert(item);
	var select = $('#'+item);
	//alert(select);
	$.ajax({
		url: BASE_URL+'main/gets/'+tabla+'/'+item+'/'+valor+'/'+model,
		dataType: 'json',
		
		
	})
	.done(function(data) {
		//alert(data[0][0]);
		select.empty();
		select.append('<option selected disabled>Seleccione..</option>');
	for (var i = 0; i < data.length; i++) {

		select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');

	};
		
	})
	.fail(function() {
		alert("Error en el select "+item);
	})
	.always(function() {
			
	});

}



function load2(tabla,item,valor,otro){
		//alert(item);
	var select = $('#'+item);
	//alert(select);
	$.ajax({
		url: BASE_URL+'main/gets/'+tabla+'/'+item+'/'+valor+'/'+otro,
		dataType: 'json',
		
		
	})
	.done(function(data) {
		//alert(data[0][0]);
		select.empty();
		select.append('<option selected disabled>Seleccione..</option>');
	for (var i = 0; i < data.length; i++) {

		select.append('<option value="'+data[i]['id']+'">'+data[i][1]+'</option>');

	};
		
	})
	.fail(function() {
		alert("Error en el select "+item);
	})
	.always(function() {
			
	});

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

function formato_num(input) {
	var num = input.value.replace("", "");
    num2 = num.toLocaleString('es-ES', { maximumFractionDigits: 4 });
    if(!isNaN(num2)){
    	alert(num2);
    input.value = num2;
	}else{
		input.value = input.value.replace(/[^\d\.]*/g,'');
	}
}

function number_format(amount, decimals) {

    amount += ''; // por si pasan un numero en vez de un string
    amount = parseFloat(amount.replace(/[^0-9\.]/g, '')); // elimino cualquier cosa que no sea numero o punto

    decimals = decimals || 0; // por si la variable no fue fue pasada

    // si no es un numero o es igual a cero retorno el mismo cero
    if (isNaN(amount) || amount === 0) 
        return parseFloat(0).toFixed(decimals);

    // si es mayor o menor que cero retorno el valor formateado como numero
    amount = '' + amount.toFixed(decimals);

    var amount_parts = amount.split('.'),
        regexp = /(\d+)(\d{3})/;

    while (regexp.test(amount_parts[0]))
        amount_parts[0] = amount_parts[0].replace(regexp, '$1' + ',' + '$2');

    return amount_parts.join('.');
}

var formatNumber = {
 separador: ".", // separador para los miles
 sepDecimal: ',', // separador para los decimales
 formatear:function (num){
 num +='';
 var splitStr = num.split('.');
 var splitLeft = splitStr[0];
 var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
 var regx = /(\d+)(\d{3})/;
 while (regx.test(splitLeft)) {
 splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
 }
 return this.simbol + splitLeft +splitRight;
 },
 new:function(num, simbol){
 this.simbol = simbol ||'';
 return this.formatear(num);
 }
}

  function formato(texto){
    return texto.replace(/^(\d{4})-(\d{2})-(\d{2})$/g,'$3/$2/$1');
  }