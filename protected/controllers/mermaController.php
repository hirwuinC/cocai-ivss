<?php 
	class mermaController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_merma;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			$this->_merma = $this->loadModel('merma');

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

		function inicio($id=false){
			Session::destroy('carrito');
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/merma'));
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
			$this->_view->render('indexM', 'merma', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function productos($idtienda,$clasif=false){
			if ($clasif == false or $clasif == 999999) {
				$filtropi = '';
				$filtropv = '';
			}else{
				$filtropi = "and familia_id = $clasif";
				$filtropv = "and grupo.familia_id = $clasif";
			}
			$query = "SELECT DISTINCT mercancia.id as idp, mercancia.codigo, mercancia.nombre as producto, marca, receta_id as idre, unidad_medida.abreviatura, tipo_producto, referencia.referencia as clasificacion, unidad_medida.id as idum FROM mercancia_has_unidad_negocio as mhun
			inner join mercancia on mercancia.id = mhun.mercancia_id
			inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
			inner join referencia on referencia.id = mercancia.familia_id
			where unidad_negocio_id = $idtienda $filtropi";
    		$datapi = $this->_main->select($query);

    		$query = "SELECT DISTINCT producto.id as idp, producto.codigo, producto.nombre as producto, producto.producto_Inactivo as marca, receta_id as idre, producto.status as abreviatura, tipo_producto, referencia.referencia as clasificacion, producto.status as idum 
    		FROM producto_has_unidad_negocio
    		inner join producto on producto.id = producto_has_unidad_negocio.producto_id
            inner join grupo on grupo.id = producto.grupo_id
            inner join referencia on referencia.id = grupo.familia_id
    		where unidad_negocio_id = $idtienda and producto_Inactivo = 0 $filtropv ";
    		$datapv = $this->_main->select($query);
    		$datos = array_merge($datapi,$datapv);

    		$response = array("data"=>$datos);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function agregarmotivo($motivo){
			$motive = str_replace("@"," ",$motivo);

			$query = "INSERT INTO referencia (referencia, padre_id) values ('".$motive."',121)";
			$data = $this->_main->insertar($query);
			echo json_encode($data);
		}

		public function datosmerma($id,$tipopro,$idt,$motivo,$tipo,$cantidad){
			$motive = str_replace("@"," ",$motivo);
			//Session::destroy('carrito');
			if ($tipopro == 1) {
				$query = "SELECT DISTINCT mercancia.id as idp, mercancia.codigo, mercancia.nombre as producto, marca, receta_id as idre, unidad_medida.abreviatura, tipo_producto, referencia.referencia as clasificacion, unidad_medida.id as idum 
				FROM mercancia_has_unidad_negocio as mhun
				inner join mercancia on mercancia.id = mhun.mercancia_id
				inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
				inner join referencia on referencia.id = mercancia.familia_id
				where unidad_negocio_id = $idt and mercancia.id = $id";
				$datos = $this->_main->select($query);
			}else{
				$query = "SELECT DISTINCT producto.id as idp, producto.codigo, producto.nombre as producto, producto.producto_Inactivo as marca, receta_id as idre, producto.status as abreviatura, tipo_producto, referencia.referencia as clasificacion, producto.status as idum 
	    		FROM producto_has_unidad_negocio
	    		inner join producto on producto.id = producto_has_unidad_negocio.producto_id
	            inner join grupo on grupo.id = producto.grupo_id
	            inner join referencia on referencia.id = grupo.familia_id
	    		where unidad_negocio_id = $idt and producto.id = $id ";
	    		$datos = $this->_main->select($query);
			}
			
				

			if (isset($_SESSION['carrito'])) {
				$arreglo = $_SESSION['carrito'];
				//print_r($arreglo); echo "<br>";
				$encontro=false;
        		$numero=0;
        		for($i=0;$i<count($arreglo);$i++){
		          if($arreglo[$i]['id']==$id and $arreglo[$i]['tipopro'] == $tipopro){
		            $encontro=true;
		            $numero=$i;
		          }
		        }
		        	if($encontro==true){
			          switch ($tipo) {
			            case '1':
			                $arreglo[$numero]['id']= $id;
			                $arreglo[$numero]['abreviatura'] = $datos[0]['abreviatura'];
			                $arreglo[$numero]['idum'] = $datos[0]['idum'];
			                $arreglo[$numero]['cantidad'] = $cantidad;
			                $arreglo[$numero]['nombre'] = $datos[0]['producto'];
			                $arreglo[$numero]['marca'] = $datos[0]['marca'];
			                $arreglo[$numero]['codigo'] = $datos[0]['codigo'];
			                $arreglo[$numero]['motivo'] = $motive;
			                $arreglo[$numero]['tipopro'] = $tipopro;
			                $_SESSION['carrito']=$arreglo;
			              
			              
			            break;
			            
			            default:
			            	unset($_SESSION['carrito'][$numero]);
			                $arreglo = array_values($_SESSION['carrito']);
			                $_SESSION['carrito']=$arreglo;
			            break;
			          }
			          
			        }else{
			        	if ($tipo == 1) {
				        	$arreglo = $_SESSION['carrito'];
				        	$datosNuevos=array('id'=>$id,
			                    'abreviatura'=>$datos[0]['abreviatura'],
			                    'idum'=>$datos[0]['idum'],
			                    'cantidad'=> $cantidad,
			                    'nombre'=>$datos[0]['producto'],
			                    'marca'=>$datos[0]['marca'],
			                    'codigo'=>$datos[0]['codigo'],
			                    'motivo'=>$motive,
			                    'tipopro'=>$tipopro
			                );
			                  array_push($arreglo, $datosNuevos);
				          	$_SESSION['carrito']=$arreglo;
			        	}
			        	
			        }
			}else{
				$arreglo[]=array('id'=>$id,
                    'abreviatura'=>$datos[0]['abreviatura'],
			        'idum'=>$datos[0]['idum'],
			        'cantidad'=>$cantidad,
                    'nombre'=>$datos[0]['producto'],
                    'marca'=>$datos[0]['marca'],
                    'codigo'=>$datos[0]['codigo'],
                    'motivo'=>$motive,
                    'tipopro'=>$tipopro
                );
				$_SESSION['carrito'] = $arreglo;
			}
			
			echo json_encode($_SESSION['carrito']);
				
		}

		public function mostrardatosmerma(){
			$data = $_SESSION['carrito'];
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function vaciarsesion(){
			Session::destroy('carrito');
			$data = true;
			echo json_encode($data);
		}

		public function procesarmermas($idT){
			$datos = $_SESSION['carrito'];
			$accion = 'Actualizado';
			$motivo = 182;
			$tipoM = 132;
			for ($i=0; $i < count($datos); $i++) { 
				if ($datos[$i]['tipopro'] == 2) {
					$descripcion = $_SESSION['carrito'][$i]['motivo'];
					$producto = $_SESSION['carrito'][$i]['nombre'];
					$query = "SELECT codigo, receta_id FROM producto where producto.id = '".$datos[$i]['id']."'";
					$pro = $this->_main->select($query);
					if (!is_null($pro[0]['receta_id'])) {
						$ing = $this->_main->ingredientesexplosion($pro[0]['codigo'],$idT,$datos[$i]['cantidad']);
						for ($j=0; $j <count($ing) ; $j++) { 
							if (isset($ing[$j]['recetaing'])) {
								$idrece = $ing[$j]['recetaing'];
								$sub = $this->subrecetas($idrece,$datos[$j]['cantidad'],$idT,$descripcion,$producto);
							}else{
								$this->mermaspv($ing[$j],$idT,$descripcion,$producto);
							}
							
						}
					}

					
				}else{
					$query = "SELECT existencia FROM mercancia_has_unidad_negocio where unidad_negocio_id = $idT and mercancia_id = '".$datos[$i]['id']."'";
					$stock = $this->_main->select($query);
					$cant = $stock[0]['existencia']-$datos[$i]['cantidad'];
					$this->_main->log($datos[$i]['id'],$idT,$accion);
					$this->_main->kardex($datos[$i]['cantidad'],$motivo,$tipoM,$datos[$i]['id'],$idT,$datos[$i]['idum'],$datos[$i]['motivo']);
					$query = "UPDATE mercancia_has_unidad_negocio set existencia=$cant where unidad_negocio_id = $idT and mercancia_id = '".$datos[$i]['id']."'";
					$actualizado = $this->_main->modificar($query);
					
				}
				
			}
			echo json_encode($datos);
			Session::destroy('carrito');
			
		}

		function subrecetas($idreceta,$cantidad,$idt,$descripcion,$producto){
			//echo "id=";print_r($idreceta); echo "<br><br>";
			$query = "SELECT mercancia.id as idi, mercancia.receta_id, mercancia.codigo as codigi, mercancia.receta_id as recetaing, ixr.cantidad, abreviatura, mercancia.nombre as producto, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, format(mercancia.precio_unitario,2,'de_DE') as costo, mercancia.precio_unitario as precioU, mercancia.contenido_neto, mercancia.formula_c, ixr.receta_id as idreceta, receta.nombre as receta, ixr.unidad_medida_id
					FROM `mercancia`
					inner join ingrediente_has_receta as ixr on mercancia.id = ixr.ingrediente_id
					inner join receta on receta.id = ixr.receta_id
                    inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
                    WHERE ixr.receta_id = $idreceta";
					$ingredientes = $this->_main->select($query);
					//print_r($ingredientes);
					for ($k=0; $k <count($ingredientes) ; $k++) {
						if (isset($ingredientes[$k]['idi'])) {
							$cant = $cantidad*$ingredientes[$k]['cantidad'];
							$subreceta[] = array('iding'=>$ingredientes[$k]['idi'],
		                               	 'codigoing' =>$ingredientes[$k]['codigi'],
		                                 'cantidad'=>$cant,
		                                 'abreviatura'=>$ingredientes[$k]['abreviatura'],
		                                 'ingredientes'=>$ingredientes[$k]['ingrediente'],
		                                 'unidad_medida_id'=>$ingredientes[$k]['unidad_medida_id'],
		                                 'costo'=>$ingredientes[$k]['precioU'],
		                                 'idreceta'=>$ingredientes[$k]['idreceta'],
		                                 'recetaing'=>$ingredientes[$k]['recetaing'],
		                             	 'contenido_neto'=>$ingredientes[$k]['contenido_neto'],
		                             	 'formula_c'=>$ingredientes[$k]['formula_c']);
							
						}
						if (isset($subreceta[$k]['recetaing'])) {
							$idrc = $subreceta[$k]['recetaing'];
							$subs = $this->subrecetas($idrc,$cantidad,$idt,$descripcion,$producto);							
						}else{
							$this->mermaspv($subreceta[$k],$idt,$descripcion,$producto);
						}
					 					
					}
					
					return $subreceta;
		}

		function mermaspv($datos,$idt,$descripcion,$producto){
			$detalle = $descripcion.' ('.$producto.')';
			$accion = "Actualizado";
			$motivo = 182;
			$tipoM = 132;
			$query = "SELECT existencia FROM mercancia_has_unidad_negocio where unidad_negocio_id = $idt and mercancia_id = '".$datos['iding']."'";
			$stock = $this->_main->select($query);
			$cant = $stock[0]['existencia']-$datos['cantidad'];
			$this->_main->log($datos['iding'],$idt,$accion);
			$this->_main->kardex($datos['cantidad'],$motivo,$tipoM,$datos['iding'],$idt,$datos['unidad_medida_id'],$detalle);
			$query = "UPDATE mercancia_has_unidad_negocio set existencia=$cant where unidad_negocio_id = $idt and mercancia_id = '".$datos['iding']."'";
			$actualizado = $this->_main->modificar($query);
			

			//echo json_encode($datos);
		}



		/*public function printReceta(){
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
			
		}*/

	}
?>