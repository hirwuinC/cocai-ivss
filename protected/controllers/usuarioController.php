<?php 
	class usuarioController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_admin;
		
		public function __construct(){
	
			parent::__construct();
			$this->_user = $this->loadModel('usuario');
			$this->_main = $this->loadModel('main');
			//Objeto donde almacenamos todas las funciones de PersonsModel.php

			$this->_sidebar_menu =array(
					array(
				'id' => 'insert_new',
				'title' => 'Nueva Persona',
				'link' => BASE_URL . 'persons' . DS . 'insert'
						)
										);
		}
		
		function index($id=false,$tipo=false){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $this->_view->setJs(array('js/usuario'));
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
      		$this->_view->n = $tipo;
			$this->_view->render('inicio', 'usuario', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function listuser($idemp){
			$query = "SELECT id, codigo, nombre FROM unidad_negocio where empresa_id = $idemp";
    		$tiendas = $this->_main->select($query);
    		$usuarios = $this->_user->listusers($tiendas);
    		echo json_encode($usuarios);
		}
	}
?>