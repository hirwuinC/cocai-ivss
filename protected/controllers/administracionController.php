<?php 
	class administracionController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_admin;
		
		public function __construct(){
	
			parent::__construct();
			$this->_admin = $this->loadModel('administracion');
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
		    $this->_view->setJs(array('js/tablas'));
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
      		$this->_view->n = $tipo;
			$this->_view->render('inicio', 'usuario', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function tablas($id=false,$tipo=false){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $this->_view->setJs(array('js/tablas'));
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
      		$this->_view->n = $tipo;
			$this->_view->render('inicio', 'usuario', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function consultartabla($tabla, $empresa){
			switch ($tabla) {
				case 'clasificacion':
					$query = "SELECT DISTINCT(ref.id), ref.referencia from referencia 
		            inner join referencia as ref on ref.padre_id = referencia.id
		            inner join clasificacion_empresa on ref.id = clasificacion_id
		            where referencia.referencia = 'familia' and empresa_id = '".$empresa."'";
				break;
				
				case 'subclasificacion':
					$query = "SELECT DISTINCT(ref.id), ref.referencia from referencia 
		            inner join referencia as ref on ref.padre_id = referencia.id
		            inner join subclasificacion_empresa on ref.id = subclasificacion_id
		            where referencia.referencia = 'sub_familia' and empresa_id = '".$empresa."'";
				break;
			}
			$data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function agregar($tabla,$empresa,$campo){
			$registro = str_replace("@"," ",$campo);
			switch ($tabla) {
				case 'clasificacion':
					$padre_id = 13;
					$tablap = 'clasificacion_empresa';
					$campop = 'clasificacion_id';
				break;

				case 'subclasificacion':
					$padre_id = 147;
					$tablap = 'subclasificacion_empresa';
					$campop = 'subclasificacion_id';
				break;			
			}
			$query = "INSERT INTO referencia (referencia, padre_id) values ('".$registro."', $padre_id)";
			$idr = $this->_main->insertar($query);
			if (!empty($idr) and ($tabla == 'clasificacion' or $tabla == 'subclasificacion')) {
				$query = "INSERT INTO $tablap ($campop, `empresa_id`) VALUES ($idr, $empresa)";
				$puente = $this->_main->insertar($query);
			}
			echo json_encode($registro);
		}

		public function borrar($id){
			$query = "DELETE FROM referencia where id = $id";
			$borrado = $this->_main->eliminar($query);
			echo json_encode($borrado);
		}



		

}?>