<?php 

class indexController extends Controller{
	
	public function __construct(){

		
		parent::__construct();
		
	}
	
	function  index(){
		$valores = Session::modelo('idUsuario');
		#print_r($valores);
		$this->_view->model=$valores;
		$this->_view->render('index');
	}
	
	
	
	
}


?>