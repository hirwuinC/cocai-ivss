<?php 
	class reportesController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_compra;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			//$this->_reportes = $this->loadModel('reportes');
			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index($id=false){
			Session::destroy('productosC');
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $this->_view->setJs(array('js/facturas'));
		    $this->_view->setJs(array('js/kardex'));
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
			if (Session::get('usuario') == 'inventario') {
				$this->_view->render('reportsinv', 'compra', '','');
			}else if (Session::get('usuario') == 'cargaexistencia') {
				$this->_view->render('reportsch', 'compra', '','');
			}else if (Session::get('usuario') == 'proveedores') {
				$this->_view->render('reportsprov', 'compra', '','');
			}else{
				$this->_view->render('kardex', 'compra', '','');
				// clase  metodo 	  vista    carpeta dentro de views 
			}
			
		}

function consultarkardex($fechaini,$fechafin,$tipom= false,$motivo= false,$idU,$prod= false){
    		//echo $idU."<br><br>";
    		$query = "SELECT empresa_id From unidad_negocio where unidad_negocio.id = $idU";
    		$empresa = $this->_main->select($query);
    		//print_r($empresa);
    		if (!is_null($empresa[0][0])) {
    			 $cadena = "and kardex.unidad_negocio_id = ".$idU;
    		}else{
    			 $cadena = "and (unidad_negocio.empresa_id = ".$idU." or unidad_negocio.id = ".$idU.")";
    		}

    		if ($prod != 'false' and $tipom == 'false' and $motivo == 'false') {
    			$condicion = "and kardex.mercancia_id = $prod";
    		}else if ($prod != 'false' and $motivo == 'false' and $tipom != 'false') {
    			$condicion = "and kardex.mercancia_id = $prod and tipo_movimiento_id = $tipom";
    		}else if ($prod != 'false' and $tipom != 'false' and $motivo != 'false') {
    			$condicion = "and kardex.mercancia_id = $prod and tipo_movimiento_id = $tipom and motivo_id = $motivo";
    		}else if ($prod == 'false' and $motivo == 'false' and $tipom != 'false') {
    			$condicion = "and tipo_movimiento_id = $tipom";
    		}else if ($prod == 'false' and $tipom != 'false' and $motivo != 'false') {
    			$condicion = "and tipo_movimiento_id = $tipom and motivo_id = $motivo";
    		}else{
    			$condicion = "";
    		}

    		$query="SELECT SUM(CASE tipo_movimiento_id WHEN 131 THEN kardex.cantidad END) as entradas, SUM(CASE tipo_movimiento_id WHEN 132 THEN kardex.cantidad END) as salidas 
					FROM `kardex` 
					inner join referencia on referencia.id = tipo_movimiento_id 
					inner join mercancia on mercancia.id = kardex.mercancia_id 
					inner join usuario on usuario.id = kardex.usuario_id 
					inner join unidad_medida on unidad_medida.id = kardex.unidad_medida_id 
					inner join referencia as ref on ref.id = kardex.motivo_id 
					inner join referencia as ref1 on ref1.id = mercancia.familia_id 
					inner join unidad_negocio on kardex.unidad_negocio_id = unidad_negocio.id
    			WHERE fecha BETWEEN '".$fechaini."' and '".$fechafin."' $cadena $condicion";
    		$sumatorias = $this->_main->select($query);

    		$query="SELECT DISTINCT fecha, DATE_FORMAT(hora, '%r') as hora, cantidad as cant, format(kardex.cantidad,4,'de_DE') as cantidad, kardex.descripcion, tipo_movimiento_id as idtm, kardex.mercancia_id as idmer, usuario_id as idUs, unidad_medida_id as idum, motivo_id as idmot, referencia.referencia as tipomov, mercancia.codigo, CONCAT(mercancia.nombre, ' ', mercancia.marca) As mercancia, CONCAT(usuario.nombre, ' ', usuario.apellido) As Nombre, unidad_medida.unidad, ref.referencia as motivo, ref1.referencia as familia, unidad_negocio.id as idt, lower(unidad_negocio.nombre) as tienda, kardex.existencia, format(kardex.existencia,4,'de_DE') as stock, unidad_medida.abreviatura
					FROM `kardex` 
					inner join referencia on referencia.id = tipo_movimiento_id 
					inner join mercancia on mercancia.id = kardex.mercancia_id 
					inner join usuario on usuario.id = kardex.usuario_id 
					inner join unidad_medida on unidad_medida.id = kardex.unidad_medida_id 
					inner join referencia as ref on ref.id = kardex.motivo_id 
					inner join referencia as ref1 on ref1.id = mercancia.familia_id 
					inner join unidad_negocio on kardex.unidad_negocio_id = unidad_negocio.id
    			WHERE fecha BETWEEN '".$fechaini."' and '".$fechafin."' $cadena $condicion";
    		$data = $this->_main->select($query);
    		if (count($data)!=0) {
    		 	$data[0]['entradas'] = $sumatorias[0]['entradas'];
    			$data[0]['salidas'] = $sumatorias[0]['salidas'];
    		 } 
    				
    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
    	}




	}
?>