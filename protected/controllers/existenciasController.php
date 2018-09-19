<?php 
	class existenciasController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_inventario;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index(){
			$this->_view->render('indexEX', 'existencias', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function productos($tienda){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/existencias'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            Session::time();
			$valores = $this->datostienda($tienda); #print_r($valores);
			$cantidad= count($valores);
			//print_r($valores);exit();
			if ($cantidad > 0) {
				$this->_view->g = $valores;	
				$this->_view->render('indexEX', 'existencias', '','');
			}else{
				$query = "SELECT unidad_negocio.id, unidad_negocio.nombre as 'tienda', empresa_id, modelo.id as 'idM', modelo.nombre as 'modelo', submodelo.id as 'idSM', submodelo.nombre as 'subM' FROM `unidad_negocio` inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id inner join modelo on modelo.id = modelo_has_submodelo.modelo_id inner join modelo as submodelo on submodelo.id = modelo_has_submodelo.sub_modelo_id WHERE unidad_negocio.id = $tienda"; 
				$valores = $this->_main->select($query); #print_r($valores);
				//$valores[0]['producto'] = 'vacio'; 
				//print_r($valores);
				$this->_view->g = $valores;	
				$this->_view->render('indexEX', 'existencias', '','');
			}
	
		}

		public function existente($idm,$idt){
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, mc.descripcion, format(mc.existencia,2,'de_DE') as stock, mc.existencia, mercancia.contenido_neto, format(mc.stock_min,2,'de_DE') as stockm, mc.stock_min, format(mc.stock_max,2,'de_DE') as stockm2, mc.stock_max, mc.status, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', umdespacho.id as 'idUMP',umdespacho.unidad as 'unidadP', umdespacho.abreviatura as 'abreviaturaP',umrecepcion.id as 'idUMC',umrecepcion.unidad as 'unidadC', umrecepcion.abreviatura as 'abreviaturaC', ref.referencia as 'familia', submodelo.nombre as 'subM', model.nombre as modelo, model.id as idm, mc.tipo_inventario_id, empresa_id, ref1.referencia as subfamilia
				FROM `unidad_negocio` 
				LEFT join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id 
				LEFT join mercancia on mercancia.id = mc.mercancia_id 
				LEFT join unidad_medida on unidad_medida.id = um_sistema_id
				LEFT join unidad_medida as umdespacho on umdespacho.id = um_despacho_id 
				left join unidad_medida as umrecepcion on umrecepcion.id = um_recepcion_id 
				LEFT join referencia as ref on ref.id = mercancia.familia_id 
				left join referencia as ref1 on ref1.id = mercancia.sub_familia_id
				left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id 
				left join modelo as model on model.id = modelo_has_submodelo.modelo_id
				left join modelo as submodelo on submodelo.id = modelo_has_submodelo.sub_modelo_id
				WHERE unidad_negocio.id = $idt and mc.mercancia_id = $idm";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		public function updateexistencia($idt){
			$mystring = $_POST['actual'];
			$mystring2 = $_POST['existencia'];
	        $findme   = ',';
	        $pos = strpos($mystring, $findme);
	        if ($pos != false) {
	          $p1 = str_replace(".","",$_POST['actual']);
	          $actual = str_replace(",",".",$p1);
	        }else{
	          $actual = $_POST['actual'];
	        }
	        $pos = strpos($mystring2, $findme);
	        if ($pos != false) {
	          $p1 = str_replace(".","",$_POST['existencia']);
	          $existencia = str_replace(",",".",$p1);
	        }else{
	          $existencia = $_POST['existencia'];
	        }
			$query = "UPDATE mercancia_has_unidad_negocio set existencia = '".$existencia."', existencia_cargada = 1 where unidad_negocio_id = $idt and mercancia_id = '".$_POST['idpro']."'";
			$upd = $this->_main->modificar($query);
			$this->kardexdirecto($existencia,$actual,$_POST['idpro'],$idt);
		}

		public function kardexdirecto($existencia,$actual,$idpro,$idt){
			//327 entrada 328 salida
			$query = "SELECT nombre,marca,existencia, um_sistema_id, unidad_negocio_id as idt FROM mercancia_has_unidad_negocio
			inner join mercancia on mercancia_id = mercancia.id 
			where unidad_negocio_id = $idt and mercancia_id = $idpro";
			$producto = $this->_main->select($query);
			if ($existencia >= $actual) {
				$tipo_mov = 131;
				$motivo = 327;
			}else{
				$tipo_mov = 132;
				$motivo = 328;
			}
			$fecha = date ('Y-m-d');
 			$hora = date ('h:i:s');
 			$user =Session::modelo('idUsuario');
			$descripcion = " ";
			$query = "INSERT INTO `kardex`(`fecha`, `hora`, `cantidad`, `existencia`, `descripcion`, `tipo_movimiento_id`, `mercancia_id`, `unidad_negocio_id`, `usuario_id`, `unidad_medida_id`, `motivo_id`, `reversado`) VALUES ('".$fecha."','".$hora."',".$existencia.",".$existencia.",'".$descripcion."','".$tipo_mov."',".$idpro.",".$idt.",".$user[0]['id'].",'".$producto[0]['um_sistema_id']."','".$motivo."', 0)";
        	$ka = $this->_main->insertar($query);
        	echo json_encode($producto);
		}

		public function validarmodulo($idt){
			$data = $this->datostienda($idt);
			if (empty($data)) {
				Session::destroy('menuact');
			}
			echo json_encode($data);
		}

		public function datostienda($idt){
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, mc.descripcion, format(mc.existencia,2,'de_DE') as stock, mc.existencia, mercancia.contenido_neto, format(mc.stock_min,2,'de_DE') as stockm, mc.stock_min, format(mc.stock_max,2,'de_DE') as stockm2, mc.stock_max, mc.status, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia', submodelo.nombre as 'subM', model.nombre as modelo, model.id as idm, tipo_inventario_id, empresa_id, ref1.referencia as subfamilia, tipo_mercancia_id as tipo_ingrediente,ref4.referencia as grupo, cantidad_presentacion, punto_reorden, format(mc.punto_reorden,2,'de_DE') as reorden
			FROM `unidad_negocio` 
			LEFT join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id 
			LEFT join mercancia on mercancia.id = mc.mercancia_id 
			LEFT join unidad_medida on unidad_medida.id = um_sistema_id
			LEFT join unidad_medida as unidad_presentacion on unidad_presentacion.id = um_despacho_id 
			left join unidad_medida as unidad_compra on unidad_compra.id = um_recepcion_id 
			LEFT join referencia as ref on ref.id = mercancia.familia_id 
			left join referencia as ref1 on ref1.id = mercancia.sub_familia_id
			left join referencia as ref4 on ref4.id = ref.padre_id
			left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id 
			left join modelo as model on model.id = modelo_has_submodelo.modelo_id
			left join modelo as submodelo on submodelo.id = modelo_has_submodelo.sub_modelo_id
			WHERE unidad_negocio.id = $idt and mc.existencia = 0 and existencia_cargada = 0"; 

			$valores = $this->_main->select($query); #print_r($valores);
			return $valores;
		}
	}
?>