<?php 
	class ubicacionController extends Controller{
		
		
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
		
		function index(){
			$this->_view->render('ubicacionP', 'ubicacion', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function ubicacionProducto($id){
			$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
			$this->_view->setJs(array('js/ubicacion'));
			$this->_view->setJs(array('js/prototipo'));
			//$this->_view->setJs(array('js/inventario'));
			$query = "SELECT unidad_negocio.id as 'idU', unidad_negocio.nombre, modelo.id as 'idM', modelo.nombre as 'modelo', empresa_id 
    		FROM `unidad_negocio` 
    		INNER JOIN modelo_has_submodelo on modelo_has_submodelo.id = modelo_has_submodelo_id 
    		INNER JOIN modelo on modelo.id = modelo_has_submodelo.modelo_id 
    		WHERE unidad_negocio.empresa_id = $id and unidad_negocio.nombre not in ('Suministros', 'farmacia')"; 
			$data = $this->_main->select($query);
			
			$modelo = $this->_main->simplificarDatos($data,'modelo'); #print_r($modelo);
			$idM = $this->_main->simplificarDatos($data,'idM'); #print_r($idM);
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
			$this->_view->modelo=$modelo;
			$this->_view->datos=$data;
			$this->_view->idm=$idM;
			$this->_view->idT=$id;
			$this->_view->render('ubicacionP','ubicacion','','');
		}

		public function consultarAlmacen($padreId,$tipo)
		{
			$query = "SELECT unidad_negocio.id as 'idU', unidad_negocio.nombre, unidad_negocio.img
    		FROM `unidad_negocio` 
    		WHERE unidad_negocio.empresa_id = $padreId and unidad_negocio.ubcn = $tipo";

			
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

	public function productosU($idt){
        $data = $this->_main->datostienda($idt);        
        $response = array("data"=>$data);
        //print_r($response);
        echo json_encode($response);
    }

      public function dataPrueba()
      {
       $data = $this->_main->datosMercancia();
       $response = array("data"=>$data);
        //print_r($response);
        echo json_encode($response);
      }

      public function ubicarproducto($idp,$idsub){
      	$query = "INSERT INTO `mercancia_has_unidad_negocio`(`mercancia_id`, `unidad_negocio_id`) VALUES ('".$idp."','".$idsub."')";
      	$idmu = $this->_main->insertar($query);
      	echo json_encode($idmu);
      }



		

}?>