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

    $('#tablafiltraje').DataTable({
                responsive: true
        });
    $('#tablarepo2').DataTable({
                responsive: true
        });
    $('#tablara').DataTable({
                responsive: true
        });
    $('#tablaprov').DataTable({
                responsive: true
        });

    $('#tablaprods').DataTable({
                responsive: true,
                stateSave: true
        });
    $('#tablaprods_wrapper').removeClass('container-fluid');
    
});
 