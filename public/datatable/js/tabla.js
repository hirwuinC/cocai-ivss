 $(document).ready(function() {
    	//alert('tabla')
    $('#tablaSM').DataTable();
    $('#tablaPro').DataTable();
 	$('#tablaGru').DataTable({
                responsive: true
        });
 	$('#tablakardex').DataTable({
                responsive: true,
                "bSort": true
        });
    $('#tablarecetario').DataTable({
                responsive: true
        });
    $('#tablaproduct').DataTable({
                responsive: true
        });
    $('#tablafiltraje').DataTable({
                responsive: true
        });
    
});
 