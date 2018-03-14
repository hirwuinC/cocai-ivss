<?php 
	class produccionController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_produccion;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			$this->_produccion = $this->loadModel('produccion');

			/*$this->_sidebar_menu =array(
					array(
				'id' => 'insert_new',
				'title' => 'Nueva Persona',
				'link' => BASE_URL . 'persons' . DS . 'insert'
						)
			);*/

			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index($id=false){	    
    		$query = "SELECT unidad_negocio.id as idU, unidad_negocio.codigo, unidad_negocio.nombre as udn, modelo.nombre as modelo, empresa_id From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $id";
    		$mo = $this->_main->select($query);
    		$this->_view->model = $mo;
			$this->_view->render('index', 'produccion', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function tandas($id=false){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/produccion'));
    		$this->_view->setJs(array('js/recetario'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    
    		$query = "SELECT unidad_negocio.id as idU, unidad_negocio.codigo, unidad_negocio.nombre as udn, modelo.nombre as modelo, empresa_id From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $id";
    		$mo = $this->_main->select($query);
    		$this->_view->model = $mo;
			$this->_view->render('index', 'produccion', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function nombreing($ingrediente){
			$query = "SELECT DISTINCT mercancia.id as idm, mercancia.nombre as producto, marca, receta.id as idre, costo, format(rendimiento,4,'de_DE') as reideal, rendimiento, receta.unidad_medida_id, unidad, abreviatura from mercancia
			inner join receta on mercancia.receta_id = receta.id 
            left join ingrediente_has_receta on ingrediente_has_receta.receta_id = receta.id
			inner join unidad_medida on unidad_medida.id = receta.unidad_medida_id
			where mercancia.id = $ingrediente";
    		$data = $this->_main->select($query);
    		echo json_encode($data);
		}

		function crearproduccion(){
			//var_dump($_POST); exit();
			$rideal = $_POST['rideal'];
			$rreal = $_POST['rreal'];
			$idreceta = $_POST['idreceta'];
			$idtienda = $_POST['idtienda'];
			$idmercancia = $_POST['semiterminados'];
			$tandas = $_POST['tandas'];
			$fecha = date('Y-m-d');
			$findme   = ',';
			$pos = strpos($rideal, $findme);
			if ($pos != false) {
				$r1 = str_replace(".","",$_POST['rideal']);
           		$ideal = str_replace(",",".",$r1);
			}else{
				$ideal = $_POST['rideal'];
			}
			$pos2 = strpos($rideal, $findme);
			if ($pos2 != false) {
				$r2 = str_replace(".","",$_POST['rreal']);
           		$real = str_replace(",",".",$r2);
			}else{
				$real = $_POST['rreal'];
			}

			$query = "SELECT mercancia.nombre, mercancia.marca, mhun.existencia, unidad_medida_sistema_id as umsid 
			FROM mercancia_has_unidad_negocio as mhun
			inner join mercancia on mercancia.id = mhun.mercancia_id
			where unidad_negocio_id = $idtienda and mercancia_id = $idmercancia";
			$existente = $this->_main->select($query);
			$updateexist = $existente[0]['existencia'] + $real;
			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $updateexist where unidad_negocio_id = $idtienda and mercancia_id = $idmercancia";
			$actualizado = $this->_main->modificar($query);
			$accion = 'Modificado';
			$motivok = 'Produccion de '.$tandas.' de '.$existente[0]['nombre'].' '.$existente[0]['marca'];
			if (isset($actualizado)) {
				$this->_main->log($idmercancia,$idtienda,$accion);
				$this->_main->kardex($updateexist,178,131,$idmercancia,$idtienda,$existente[0]['umsid'],$motivok);

				$query = "SELECT * FROM ingrediente_has_receta where receta_id = $idreceta";
				$ingredientes = $this->_main->select($query);
				
			}

			if (isset($ingredientes)) {
				for ($i=0; $i <count($ingredientes) ; $i++) { 
					# consultar la existencia por cada ingrediente, calcular cuanto se va a descontar multiplicando cantidad segun receta por las tandas y restandolo a la existencia
					# actualizar ese valor en mhun y hacer registro en log y kardex
					$query = "SELECT mercancia.nombre, mercancia.marca, mhun.existencia, unidad_medida_sistema_id as umsid 
					FROM mercancia_has_unidad_negocio as mhun
					inner join mercancia on mercancia.id = mhun.mercancia_id
					where unidad_negocio_id = $idtienda and mercancia_id = '".$ingredientes[$i]['ingrediente_id']."'";
					$existente2 = $this->_main->select($query);
					$cantxreceta = $ingredientes[$i]['cantidad']*$tandas;
					$update2 = $existente2[0]['existencia']-$cantxreceta;
					$query = "UPDATE mercancia_has_unidad_negocio set existencia = $update2 where unidad_negocio_id = $idtienda and mercancia_id = '".$ingredientes[$i]['ingrediente_id']."'";
					$actualizado2 = $this->_main->modificar($query);
					if (isset($actualizado2)) {
						$this->_main->log($ingredientes[$i]['ingrediente_id'],$idtienda,$accion);
						$this->_main->kardex($update2,179,132,$ingredientes[$i]['ingrediente_id'],$idtienda,$existente2[0]['umsid'],$motivok);
					}

				}
			}

			if (isset($actualizado) and isset($ingredientes)) {
				$query = "INSERT INTO `produccion`(`fecha`, `producto_id`, `cantidad`, `rendimiento_ideal`, `resultante`, `unidad_medida_id`, `unidad_negocio_id`) VALUES ('".$fecha."',$idmercancia,$tandas,$ideal,$real,'".$existente[0]['umsid']."',$idtienda)";
				$idproduccion = $this->_main->insertar($query);
				echo json_encode($idproduccion);
			}
			

			
		}

	}
?>