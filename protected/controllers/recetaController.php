<?php 
	class recetaController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_receta;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			
		//Objeto donde almacenamos todas las funciones de PersonsModel.php

			$this->_sidebar_menu =array(
					array(
				'id' => 'insert_new',
				'title' => 'Nueva receta',
				'link' => BASE_URL . 'persons' . DS . 'insert'
						)
			);

			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index(){
			$this->_view->render('recetario', 'receta', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function indexr($id){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/recetario'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
			$query = "SELECT unidad_negocio.id as idU, unidad_negocio.nombre as udn, modelo.nombre as modelo From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $id";
    		$mo = $this->_main->select($query);
    		$this->_view->model = $mo;
    		$this->_view->render('recetario', 'inventario', '',''); 
		}

		public function autocompletarp($modelo){
			$query = "SELECT producto.id, producto.nombre as value from producto
			inner join producto_has_unidad_negocio on producto.id = producto_has_unidad_negocio.producto_id
			inner join unidad_negocio on unidad_negocio.id = producto_has_unidad_negocio.unidad_negocio_id
			inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
			where modelo_has_submodelo.modelo_id = $modelo group by producto.nombre";
    		$data = $this->_main->select($query);
    		echo json_encode($data);
		}

		public function idpro($producto){
			$name = str_replace("@"," ",$producto);
			$query = "SELECT id, nombre from producto where producto.nombre like '%".$name."%'";
    		$data = $this->_main->select($query);
    		echo json_encode($data);
		}

		public function nombrepro($producto){
			$query = "SELECT producto.id as idpr, producto.nombre as producto, receta.id as idre from producto
inner join receta on receta_id = receta.id 
where producto.id = $producto";
    		$data = $this->_main->select($query);
    		echo json_encode($data);
		}

		public function consultarpro($modelo){
			$query = "SELECT producto.id as idpro, producto.codigo as codip, producto.nombre as producto, costo, precioVta_A as pvpa, precioVta_B as pvpb, receta_id as idre FROM `producto`
inner join producto_has_unidad_negocio on producto_has_unidad_negocio.producto_id = producto.id
inner join unidad_negocio on unidad_negocio.id = producto_has_unidad_negocio.unidad_negocio_id
inner join modelo_has_submodelo on unidad_negocio.modelo_has_submodelo_id = modelo_has_submodelo.id
WHERE modelo_has_submodelo.modelo_id = $modelo";
    		$data = $this->_main->select($query);
    		for ($i=0; $i < count($data); $i++) { 
    			if ($data[$i]['idre'] != null) {
    				$idreceta[$i] = 'Si';
    				$icono[$i] = 'fa-edit';
    				$ver[$i] = 'Editar';
    				$titulo[$i] = 'Editar Receta';
    			}else{
    				$idreceta[$i] = 'No';
    				$icono[$i] = 'fa-plus-square-o';
    				$ver[$i] = 'Asignar';
    				$titulo[$i] = 'Agregar receta';
    			}
    			$data[$i]['idrec'] = $idreceta[$i];
    			$data[$i]['icon'] = $icono[$i];
    			$data[$i]['ver'] = $ver[$i];
    			$data[$i]['titulo'] = $titulo[$i];
    		}
    		
    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function consultasp($idp){
			$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, ixr.cantidad, abreviatura, CONCAT(mercancia.nombre, ' ', mercancia.marca) As ingrediente, producto.id as idprod, producto.nombre as producto, mercancia.precio_unitario as precioU, receta.id as idreceta  FROM `ingrediente_has_receta` as ixr
			inner join receta on receta.id = ixr.receta_id
			inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
			inner join mercancia on mercancia.id = ixr.ingrediente_id
			inner join producto on receta.id = producto.receta_id
			WHERE producto.id = $idp";
    		$data = $this->_main->select($query);
    		/*for ($i=0; $i < count($data); $i++) { 
    			$total[] = $data[$i]['cantidad'] * $data[$i]['precioU'];
    		}
    		$data[0]['total'] = $total;*/
    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function insertIngrediente($idpro,$idrec,$idmer,$cantxing,$unidad){
				$query = "SELECT * from ingrediente_has_receta where ingrediente_id = $idmer and receta_id = $idrec";
				$info = $this->_main->select($query);
				if (!empty($info)) {
					$data = 'duplicado';
				}else{
				$query = "INSERT INTO `ingrediente_has_receta`(`ingrediente_id`, `receta_id`, `cantidad`, `unidad_medida_id`) 
					VALUES ($idmer, $idrec, $cantxing, $unidad)";
					$idD = $this->_main->insertar($query);
					$data = $idpro;
				}
				echo json_encode($data);	

		}

		public function eliminarIngrediente($producto,$idmer,$idreceta){

				//Controller::varDump($_POST);exit();
				$query = "DELETE FROM `ingrediente_has_receta` where ingrediente_id = $idmer and receta_id = $idreceta";
				$idD = $this->_main->eliminar($query);
				$data = $producto;
			echo json_encode($data);

		}

		public function cargaringredientes(){

				//Controller::varDump($_POST);exit();
				$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, unidad_medida_compra_id as umcid, unidad_medida_consumo_id as umpid, unidad_medida_sistema_id as umsid, umc.abreviatura as abumc, ump.abreviatura as abump, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) As ingrediente, mercancia.precio_unitario as precioU  FROM `mercancia`
			inner join unidad_medida as umc on umc.id = mercancia.unidad_medida_compra_id
            inner join unidad_medida as ump on ump.id = mercancia.unidad_medida_consumo_id
            inner join unidad_medida as ums on ums.id = mercancia.unidad_medida_sistema_id
			";
			$data = $this->_main->select($query);

    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}

		public function mercancia($idingrediente){
    		$query = "SELECT mercancia.id, mercancia.nombre, mercancia.marca, contenido_neto, unidad_medida.abreviatura as US, unidad_medida.unidad as unidadS, um.abreviatura as UP, um.unidad as unidadP, um2.abreviatura as UC, um2.unidad as unidadC, unidad_medida_sistema_id as idUS, unidad_medida_consumo_id as idUP, unidad_medida_compra_id as idUC from mercancia
    		inner join unidad_medida on unidad_medida_sistema_id = unidad_medida.id
    		inner join unidad_medida as um on um.id = unidad_medida_consumo_id
    		inner join unidad_medida as um2 on um2.id = unidad_medida_compra_id
    		where mercancia.id = $idingrediente group by US,UP,UC";
    		$conte = $this->_main->select($query);
    		echo json_encode($conte);

    	}



}
?>