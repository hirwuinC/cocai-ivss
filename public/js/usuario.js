$(document).ready(function() {
	var idemp = $('#idtienda').val();
	var t2 =$('#tablalistuser').DataTable({//falta cambiar los campos
            "ajax": BASE_URL+'/usuario/listuser/'+idemp,
            "columns": [
            	{ "data": null, className: "tdcenter"},
                { "data": "codip" , className: "tdleft"},
                { "data": "producto" , className: "tdleft"},
                { "data": "costom" , className: "tdright",
                	render : function(data, type, row) {
			          	return ''+data+' '+moneda
		       		}
            	},
            	{ "data": "porcentajec" , className: "tdright"},
                { "data": "pvpam" , className: "tdright",
                	render : function(data, type, row) { 
			          	return ''+data+' '+moneda
		       		}
            	},
                { "data": "idrec" , className: "tdcenter",   
	          	render : function(data, type, row) { 
		          	if (data == 'Si') {
		              	return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="vering('+row['idpro']+',999999,'+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+' '+row['producto']+'" id="spanvering"></span>'
		         	}else{ 
		         		if (empresa.length ==0) {
		         			return ''+data+' <span data-toggle="tooltip" data-placement="top" onclick="creareceta('+row['idpro']+',999999,'+row['idr']+')" class="fa '+row['icon']+' test" style="cursor: pointer; cursor:hand; color: #337ab7"  title="'+row['titulo']+' '+row['producto']+'" id="spanvering"></span>'  
		         		}else{
		         			return ''+data+' <span data-toggle="tooltip" data-placement="top"  class="test" style="cursor: default; color: #337ab7"  title="'+row['titulo']+'" id="spanvering"></span>'  
		         		}
		         		
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
            responsive: true,

        });
    $('#tablalistuser').css("width","100%");
    t2.on( 'order.dt search.dt', function () {
        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
});