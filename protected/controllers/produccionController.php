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
			$motivok = 'Produccion de '.$tandas.' '.$existente[0]['nombre'].' '.$existente[0]['marca'];
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
					$this->_main->log($ingredientes[$i]['ingrediente_id'],$idtienda,$accion);
					$this->_main->kardex($update2,179,132,$ingredientes[$i]['ingrediente_id'],$idtienda,$existente2[0]['umsid'],$motivok);
					$query = "UPDATE mercancia_has_unidad_negocio set existencia = $update2 where unidad_negocio_id = $idtienda and mercancia_id = '".$ingredientes[$i]['ingrediente_id']."'";
					$actualizado2 = $this->_main->modificar($query);
					

				}
			}

			if (isset($actualizado) and isset($ingredientes)) {
				$query = "INSERT INTO `produccion`(`fecha`, `producto_id`, `cantidad`, `rendimiento_ideal`, `resultante`, `unidad_medida_id`, `unidad_negocio_id`, `reversado`) VALUES ('".$fecha."',$idmercancia,$tandas,$ideal,$real,'".$existente[0]['umsid']."',$idtienda,0)";
				$idproduccion = $this->_main->insertar($query);
				echo json_encode($idproduccion);
			}
			

			
		}

		public function printReceta(){
			$idreceta = $_POST['idrece'];
			$tandas = $_POST['tanda'];
			$tienda = $_POST['tienda'];
			$query = "SELECT nombre as receta FROM receta where id = $idreceta";
			$rece = $this->_main->select($query);
			$reporte=$this->datosReceta($idreceta,$tandas);
			header("Content-Type: application/vnd.ms-excel");
			header("Expires: 0");
			header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
			header("content-disposition: attachment;filename=Receta_".$tandas."_".$rece[0][0]."_".date('d-m-Y').".xls");
			date_default_timezone_set('America/asuncion');
	    	echo '<table style="background: #337ab7; color: white; border: solid 2px #337ab7;">
					<tbody>
						<tr>
							<td colspan="4" rowspan="2" style=" vertical-algin: center"><center><h2><b><u>Receta para '.$tandas.' '.$rece[0][0].'</u></b></h2></center></td>
						</tr>
					</tbody>
				</table>';
	    	$dia = date ( 'd/m/Y');
	    	$hour = date ( 'ga');
	    	echo '<table style="background: #337ab7; color: white; border: solid 2px #337ab7; border-top: solid 1px black;">
					<tbody>
						<tr>
							<td rowspan="4"><b>Generado: '.$dia.' - '.$hour.'</b></td>
							<td colspan="3" rowspan="4"><center><img src="'.PUBLIC_URL.'img/'.$tienda.'.png"></center></td>
						</tr>
					</tbody>
				</table>';
			echo'<table style="border: solid 2px #337ab7">
	            <tr>
			        <th style="font-size:12px; text-align: center; border: solid 1px #337ab7">Codigo</th>
			        <th colspan="2" style="font-size:12px; text-align: center; border: solid 1px #337ab7">Producto</th>
			        <th style="font-size:12px; text-align: center; border: solid 1px #337ab7">Cantidad</th>
			    </tr>
	            <tbody>';

	        for ($j=0; $j < count($reporte); $j++){
		    	           echo'<tr>
		                        <td style="text-align:left; border: solid thin #337ab7">';
		                        echo $reporte[$j]['codigo'].'</td>';
		                        echo'<td colspan="2" style="text-align:left; border: solid thin #337ab7">';
		                        echo $reporte[$j]['producto'].'</td>'; 
		                        echo'<td style="text-align:center; border: solid thin #337ab7">';
		                        echo $reporte[$j]['cantidad'].' '.$reporte[$j]['unidad_medida'].'</td>';
		             
		    } 

	        echo'</tbody>
	        </table><br>';
	        
		}

		public function datosReceta($idreceta,$tandas){
			$query = "SELECT mercancia.id as idm, mercancia.codigo, mercancia.nombre, mercancia.marca, ihr.receta_id, ihr.cantidad, ihr.unidad_medida_id, abreviatura FROM ingrediente_has_receta as ihr
			inner join mercancia on ihr.ingrediente_id = mercancia.id
			inner join unidad_medida on ihr.unidad_medida_id = unidad_medida.id
			where ihr.receta_id = $idreceta";
			$ingredientes = $this->_main->select($query);
			for ($i=0; $i <count($ingredientes) ; $i++) {
				$datos[] = array('codigo' => $ingredientes[$i]['codigo'],
								'producto' => $ingredientes[$i]['nombre'].' '.$ingredientes[$i]['marca'],
								'cantidad' => $ingredientes[$i]['cantidad']*$tandas,
								'unidad_medida' => $ingredientes[$i]['abreviatura']);
			}
			return $datos;
			
		}

		public function consultas($idt,$idmercancia,$reverso=false){
			if ($idmercancia != 999999) {
				$where =  'unidad_negocio_id = '.$idt.' and producto_id = '.$idmercancia.'';
			}else{
				$where =  'unidad_negocio_id = '.$idt.'';
			}
			if ($reverso == 1) {
				$where2 = 'and reversado = 1';
			}else{
				$where2 = 'and reversado = 0';
			}
			$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, mercancia.precio_unitario as precioU, format(precio_unitario,4,'de_DE') as costo, receta_id as idreceta, produccion.id as idproduccion, fecha, cantidad, rendimiento_ideal, resultante, reversado  FROM `produccion`
			inner join mercancia on mercancia.id = produccion.producto_id
            inner join unidad_medida as ums on ums.id = produccion.unidad_medida_id
            where $where $where2 order by produccion.id desc";
            $data = $this->_main->select($query);

    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function reversarproduccion($idt,$idproduccion,$idm,$idr,$motivo){
			#modificar esta funcion
			$accion = 'Actualizado';
			$motive = str_replace("@"," ",$motivo);
			$query = "SELECT mercancia.nombre, mercancia.marca, mhun.existencia, unidad_medida_sistema_id as umsid 
			FROM mercancia_has_unidad_negocio as mhun
			inner join mercancia on mercancia.id = mhun.mercancia_id
			where unidad_negocio_id = $idt and mercancia_id = $idm";
			$existente = $this->_main->select($query);
			$query = "SELECT * FROM produccion where id = $idproduccion";
			$produccion = $this->_main->select($query);
			$updateexist = $existente[0]['existencia'] - $produccion[0]['resultante'];
			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $updateexist where unidad_negocio_id = $idt and mercancia_id = $idm";
			$actualizado = $this->_main->modificar($query);
			$accion = 'Modificado';
			$motivok = $motive.' - (Reverso de '.$produccion[0]['cantidad'].' '.$existente[0]['nombre'].' '.$existente[0]['marca'].')';
			if (isset($actualizado)) {
				$this->_main->log($idm,$idt,$accion);
				$this->_main->kardex($updateexist,193,132,$idm,$idt,$existente[0]['umsid'],$motivok);

				$query = "SELECT * FROM ingrediente_has_receta where receta_id = $idr";
				$ingredientes = $this->_main->select($query);
				
			}

			if (isset($ingredientes)) {
				for ($i=0; $i <count($ingredientes) ; $i++) { 
					# consultar la existencia por cada ingrediente, calcular cuanto se va a descontar multiplicando cantidad segun receta por las tandas y restandolo a la existencia
					# actualizar ese valor en mhun y hacer registro en log y kardex
					$query = "SELECT mercancia.nombre, mercancia.marca, mhun.existencia, unidad_medida_sistema_id as umsid 
					FROM mercancia_has_unidad_negocio as mhun
					inner join mercancia on mercancia.id = mhun.mercancia_id
					where unidad_negocio_id = $idt and mercancia_id = '".$ingredientes[$i]['ingrediente_id']."'";
					$existente2 = $this->_main->select($query);
					$cantxreceta = $ingredientes[$i]['cantidad']*$produccion[0]['cantidad'];
					$update2 = $existente2[0]['existencia']+$cantxreceta;
					$this->_main->log($ingredientes[$i]['ingrediente_id'],$idt,$accion);
					$this->_main->kardex($update2,192,131,$ingredientes[$i]['ingrediente_id'],$idt,$existente2[0]['umsid'],$motivok);
					$query = "UPDATE mercancia_has_unidad_negocio set existencia = $update2 where unidad_negocio_id = $idt and mercancia_id = '".$ingredientes[$i]['ingrediente_id']."'";
					$actualizado2 = $this->_main->modificar($query);

				}
			}
			$query = "UPDATE produccion set reversado=1 where produccion.id = $idproduccion";
			$actualizadopr = $this->_main->modificar($query);

			echo json_encode($actualizadopr);

		}

		public function validarproduccion($idt,$tandas,$idpro,$idr){
			$query = "SELECT * FROM ingrediente_has_receta where receta_id = $idr";
			$ingredientes = $this->_main->select($query);

			if (isset($ingredientes)) {
				for ($i=0; $i <count($ingredientes) ; $i++) { 
					# consultar la existencia por cada ingrediente, calcular cuanto se va a descontar multiplicando cantidad segun receta por las tandas y restandolo a la existencia
					# actualizar ese valor en mhun y hacer registro en log y kardex
					$query = "SELECT mercancia.nombre, mercancia.marca, mhun.existencia, unidad_medida_sistema_id as umsid 
					FROM mercancia_has_unidad_negocio as mhun
					inner join mercancia on mercancia.id = mhun.mercancia_id
					where unidad_negocio_id = $idt and mercancia_id = '".$ingredientes[$i]['ingrediente_id']."'";
					$existente2 = $this->_main->select($query);
					$cantxreceta = $ingredientes[$i]['cantidad']*$tandas;
					$update2 = $existente2[0]['existencia']-$cantxreceta;
					if ($update2 < 0) {
						echo json_encode($existente2);exit();
					}
					

				}
				echo json_encode(1);
			}
		}

	}
?>