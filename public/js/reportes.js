$(document).ready(function() {
	$('#tiporeporte').change(function(event) {
		var tiporeporte = $('#tiporeporte').val();
		if (tiporeporte == 1) {
			$('#seccionKardex').fadeIn('slow');
			$('#seccionKardex').prop('hidden', false);
		}
	});

});