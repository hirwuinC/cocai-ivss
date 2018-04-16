<?php 
	class compraController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_compra;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			//$this->_compra = $this->loadModel('compra');
			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index($id=false){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $this->_view->setJs(array('js/facturas'));
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
			$this->_view->render('indexF', 'compra', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function datosproveedor($idprov){
			$query = "SELECT proveedor.id as idprov, proveedor.nombre as nombreprov, rif, razon_social, correo, proveedor.status as statusprov, ubicacion_id, edificio, calle, urbanizacion, nro_intercomunicador, punto_referencia, direccion.id as idparroq, direccion.nombre as parroquia, dir.id as idmuni, dir.nombre as municipio, dir2.id as idedo, dir2.nombre as estado, telefono.numero, referencia.referencia as cod_tlf, mercancia.id as idmerc, mercancia.codigo, mercancia.nombre, mercancia.marca, codigo_x_proveedor, precio, phm.status as statusmerc FROM `proveedor`
			inner join ubicacion on ubicacion.id = ubicacion_id
			inner join direccion on parroquia_id = direccion.id
			inner join direccion as dir on direccion.padre_id = dir.id
            inner join direccion as dir2 on dir.padre_id = dir2.id
			left join proveedor_has_telefono as pht on pht.proveedor_id = proveedor.id 
			left join telefono on pht.telefono_id = telefono.id
			left join referencia on referencia.id = telefono.codigo_id
			left join proveedor_has_mercancia as phm on phm.proveedor_id = proveedor.id
			left join mercancia on phm.mercancia_id = mercancia.id
			WHERE proveedor.id = $idprov";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		public function materiaprima($idt){
			$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, unidad_medida_compra_id as umcid, unidad_medida_consumo_id as umpid, unidad_medida_sistema_id as umsid, umc.abreviatura as abumc, ump.abreviatura as abump, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) As ingrediente, mercancia.precio_unitario as precioU, mudn.existencia, format(mudn.existencia,4,'de_DE') as stock, stock_min, stock_max, format(mudn.stock_min,4,'de_DE') as stmin, format(mudn.stock_max,4,'de_DE') as stmax FROM `mercancia`
            left join unidad_medida as umc on umc.id = mercancia.unidad_medida_compra_id
            inner join unidad_medida as ump on ump.id = mercancia.unidad_medida_consumo_id
            inner join unidad_medida as ums on ums.id = mercancia.unidad_medida_sistema_id
            inner join mercancia_has_unidad_negocio as mudn on mudn.mercancia_id = mercancia.id
            inner join unidad_negocio on unidad_negocio.id = mudn.unidad_negocio_id
            where mudn.unidad_negocio_id = $idt and familia_id != 135";
            $data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}



	}
?>