<?php 
	class explosionController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_explosion;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			$this->_explosion = $this->loadModel('explosion');

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
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/explosiones'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    
    		$query = "SELECT unidad_negocio.id as idU, unidad_negocio.codigo, unidad_negocio.nombre as udn, modelo.nombre as modelo From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $id";
    		$mo = $this->_main->select($query);
    		$this->_view->model = $mo;
			$this->_view->render('index', 'explosion', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function cargarankings(){
			$result = false;
			$carpeta = 'public/archivos/';
		    if(is_dir($carpeta)){
		        if($dir = opendir($carpeta)){
		        	$i=0;
		            while(($archivo = readdir($dir)) !== false){		              
		                if($archivo != '.' && $archivo != '..' && $archivo != '.htaccess'){
		                  	$arreglo[] = $archivo;
		                    //echo '<li><a target="_blank" href="'.$carpeta.'/'.$archivo.'">'.$archivo.'</a></li>';
		                }
		                $i++;
		            }//print_r($result);
		            closedir($dir);
		        }
		    }
			
			echo json_encode($arreglo);
		}

		public function validarcierre($hoy,$idt){
			$query ="SELECT DISTINCT(fecha_ranking) from explosion where fecha_ranking = '".$hoy."' and unidad_negocio_id = $idt";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		public function borrador($archivo){
			$ruta = 'public/archivos/'.$archivo;
			unlink($ruta);
			if (!is_file($ruta)) {
				$data2 = true;
			}else{
				$data2 = false;
			}
			echo json_encode($data2);
		}

		function leerarchivos($fecha,$codigot){
			$directorio = BASE_URL.'public/archivos/';
			$ruta = $directorio.$fecha."-".$codigot.".txt";
         	$lineas = count(file($ruta));
         	$fp= fopen($ruta,"r");
         $arrayfichero=file($ruta); // print_r($arrayfichero); exit();
	        for ($j=0; $j < $lineas; $j++) { 
	            list($grupo,$cod,$descripcion,$cantidad,$monto,$porcentajeVentas,$costo,$costoTotal,$porcentajeCosto) = explode(',',$arrayfichero[$j]);
	            $gru[$j]= $grupo;
	            $pro[$j]=$cod;
	            $info[$j]=array('grupo'=>$grupo,
	                            'codigo' =>$cod,
	                            'descripcion'=>$descripcion,
	                            'cantidad'=>$cantidad,
	                            'monto'=>$monto,
	                            'porcentajeVentas'=>$porcentajeVentas,
	                            'costo'=>$costo,
	                            'costoTotal'=>$costoTotal,
	                            'porcentajeCosto'=>$porcentajeCosto);
	         }
	            return $info;

		}

		function insertarexplosion($fecha,$codigot,$idt){
			$directorio = BASE_URL.'public/archivos/';
			$ruta = $directorio.$fecha."-".$codigot.".txt";
         	
         	//echo $ruta."L+<br>";
         	if (file($ruta)) {
         		$_SESSION['lineas'] = count(file($ruta));
         		$lineas = $_SESSION['lineas'];
         		$_SESSION['datosexp'] = $this->leerarchivos($fecha,$codigot);
         		$info = $_SESSION['datosexp'];
         	}else{
         		$info = $_SESSION['datosexp'];
         		$lineas = $_SESSION['lineas'];
         	}			
         	$fechaexp = date('Y-m-d');
         	$dia = substr($fecha, -2);
         	$mes = substr($fecha, -4, 2);
         	$year = substr($fecha, 0, 4);
         	$fecharanking = $year."-".$mes."-".$dia;

         //echo $ruta."<br>".$valor['t']."<br>".$lineas."<br>"; 
         for ($j=0; $j < $lineas; $j++) {
            $receid[] = $this->validarrecetas($info[$j]['codigo']);
            
            $query = "INSERT INTO `explosion`(`fecha`, `fecha_ranking`, `grupo`, `codigo_prod`, `producto`, `cantidad`, `monto`, `porcentaje_vta`, `costo`, `costo_total`, `porcentaje_costo`, `unidad_negocio_id`) 
    		VALUES ('".$fechaexp."','".$fecharanking."','".$info[$j]['grupo']."','".$info[$j]['codigo']."','".$info[$j]['descripcion']."','".$info[$j]['cantidad']."','".$info[$j]['monto']."','".$info[$j]['porcentajeVentas']."','".$info[$j]['costo']."','".$info[$j]['costoTotal']."','".$info[$j]['porcentajeCosto']."',$idt)";
    		$explo[] = $this->_main->insertar($query);
            if (!isset($receid[$j][0]['receta_id'])) {
            	$this->resultadoexplosion($info[$j],$explo[$j],$fecha,$codigot,$idt);
            }else{
            	$rec = $this->ingredientesexplosion($info[$j]['codigo'],$idt,$info[$j]['cantidad']);
            	//echo $info[$j]['codigo']."<br>";
        		//print_r($rec)."<br>";
	            for ($m=0; $m <count($rec) ; $m++) { //echo "*".$m."<br><br>";
	            	//echo "a".$rec[$m]['recetaing']."<br>";
	            		if (isset($rec[$m]['recetaing'])) {
							$idrece = $rec[$m]['recetaing'];
							$sub = $this->subrecetas($idrece,$explo[$j],$info[$j]['cantidad'],$fecha,$codigot,$idt);
							//echo "rec"; print_r($rec);  echo "<br>";
							//echo "if cantidad: ".$rec[$m]['cantidad']."<br>";
						}else{
							//echo "en el otro else<br>";
							//echo "rec"; print_r($rec);  echo "<br>";
							//echo "else cantidad: ".$rec[$m]['cantidad']."<br>";
							$this->resultadoexplosion($rec[$m],$explo[$j],$fecha,$codigot,$idt);
						}
	            }
            }
        	
            
        }
        $archivo = 'public/archivos/'.$fecha.'-'.$codigot.'.txt';
			if (is_file($archivo)) {
				unlink($archivo);
			}//print_r($receid); echo "sip <br><br>";
        //print_r($rec);
    		//echo count($receid); print_r($receid);
    	}
        
        //$separado = $this->separaringredientes($ingredientes);
                //print_r($rec);
		

		function ingredientesexplosion($info,$idt,$cantidad){
			//echo($info)."<br>";
			//echo($idt)."<br>";
			//echo($cantidad)."<br>";
				for ($i=0; $i <count($info) ; $i++) { 
					$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, mercancia.contenido_neto, mhudn.existencia, ixr.cantidad, ixr.unidad_medida_id, unidad_medida.abreviatura, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, producto.id as idprod, producto.nombre as producto, format(mercancia.precio_unitario,2,'de_DE') as costo, mercancia.precio_unitario as precioU, receta.id as idreceta, mercancia.receta_id as recetaing, receta.nombre as receta, unidad_sistema.id as 'idUMS',unidad_sistema.unidad as 'unidadS', unidad_sistema.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', formula_c, formula_p, formula_s, cantidad_presentacion
	        	FROM `ingrediente_has_receta` as ixr
				inner join receta on receta.id = ixr.receta_id
				inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
				inner join mercancia on mercancia.id = ixr.ingrediente_id
				left join receta as sub on sub.id = mercancia.receta_id 
				inner join mercancia_has_unidad_negocio as mhudn on mhudn.mercancia_id = mercancia.id
	            inner join unidad_negocio on mhudn.unidad_negocio_id = unidad_negocio.id
				inner join producto on receta.id = producto.receta_id
				inner join unidad_medida as unidad_sistema on unidad_sistema.id = mercancia.unidad_medida_sistema_id
				inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
				inner join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id
				WHERE producto.codigo = '".$info."' and unidad_negocio.id = $idt ";
	    		$ingredientes = $this->_main->select($query);
	    		//echo "ingredientes:"; print_r($ingredientes); echo "<br>";
		    		for ($j=0; $j <=count($ingredientes) ; $j++) {
						if (isset($ingredientes[$j]['idi'])) {
							$cant = $cantidad*$ingredientes[$j]['cantidad'];
							//echo $ingredientes[$j]['idi'];
							$nuevo[] = array('iding'=>$ingredientes[$j]['idi'],
		                               	 'codigoing' =>$ingredientes[$j]['codigi'],
		                                 'cantidad'=>$cant,
		                                 'abreviatura'=>$ingredientes[$j]['abreviatura'],
		                                 'ingredientes'=>$ingredientes[$j]['ingrediente'],
		                                 'unidad_medida_id'=>$ingredientes[$j]['unidad_medida_id'],
		                                 'costo'=>$ingredientes[$j]['costo'],
		                                 'idreceta'=>$ingredientes[$j]['idreceta'],
		                                 'recetaing'=>$ingredientes[$j]['recetaing'],
		                                 'contenido_neto'=>$ingredientes[$j]['contenido_neto'],
		                                 'formula_c'=>$ingredientes[$j]['formula_c'],
		                             	 'idpadre'=>$ingredientes[$j]['idprod'],
		                                 'padre'=>$ingredientes[$j]['producto']);
						}					 					
					}
				}
				//print_r($nuevo);

			return $nuevo;
		}

		function subrecetas($idreceta,$explo,$cantidad,$fecha,$codigot,$idt){
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
							//echo $subrece[$k]['recetaing']."<br>";
							$idrc = $subreceta[$k]['recetaing'];
							$subs = $this->subrecetas($idrc,$explo,$cantidad,$fecha,$codigot,$idt);
							//echo "en el if<br>";
							/*for ($i=0; $i <count($subs) ; $i++) { 
								if (!isset($subs[$i]['recetaing'])) {
									$this->resultadoexplosion($subs[$i],$explo,$fecha,$codigot,$idt);
								}else{
									$idr=$subs[$i]['recetaing'];
									$this->subrecetas($idr,$explo,$cantidad,$fecha,$codigot,$idt);
								}
								
							}*/
							
						}else{
							$this->resultadoexplosion($subreceta[$k],$explo,$fecha,$codigot,$idt);
						}
					 					
					}
					
					return $subreceta;
		}

		function resultadoexplosion($receta,$explo,$fecha,$codigot,$idt){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
			$info = $this->leerarchivos($fecha,$codigot);
			if (isset($receta['iding'])) {
				$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, mc.descripcion, mc.existencia, mercancia.contenido_neto, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia', submodelo.nombre as 'subM', model.nombre as modelo 
					FROM `unidad_negocio` 
					inner join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id 
					inner join mercancia on mercancia.id = mc.mercancia_id 
					inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
					inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
					inner join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
					inner join referencia as ref on ref.id = mercancia.familia_id 
					inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id 
					inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
					inner join modelo as model on model.id = modelo_has_submodelo.modelo_id
					inner join modelo as submodelo on submodelo.id = modelo_has_submodelo.sub_modelo_id
					WHERE unidad_negocio.id = $idt ORDER BY mc.status = 1";
					$udn = $this->_main->select($query);	

					//print_r($info); exit();
					$query="SELECT unidad_medida_sistema_id From mercancia where mercancia.id = '".$receta['iding']."'";
					$umsid = $this->_main->select($query);
					//print_r($umsid[0]);
					$query = "INSERT INTO `ingredientes_has_explosion`(`explosion_id`, `ingrediente_id`, `cantidad`, `unidad_medida_id`) 
					VALUES ($explo, '".$receta['iding']."', '".$receta['cantidad']."', '".$umsid[0][0]."')";
					$this->_main->insertar($query);
			}else{
				$query = "SELECT producto.id, unidad_negocio.nombre as tienda,submodelo.nombre as 'subM', modelo.nombre as modelo FROM producto
				inner join producto_has_unidad_negocio as phudn on phudn.producto_id = producto.id
				inner join unidad_negocio on unidad_negocio.id = phudn.unidad_negocio_id
				inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id 
				inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
				inner join modelo as submodelo on submodelo.id = modelo_has_submodelo.sub_modelo_id
				where unidad_negocio_id = $idt and producto.codigo = '".$receta['codigo']."'";
				$udn = $this->_main->select($query);
				//print_r($udn);
				$unidad_med = 13;
				$query = "INSERT INTO `ingredientes_has_explosion`(`explosion_id`, `producto_id`, `cantidad`, `unidad_medida_id`) 
					VALUES ($explo, '".$udn[0]['id']."', '".$receta['cantidad']."', '".$unidad_med."')";
					$this->_main->insertar($query);
			}
			
			//echo "insert ingredientes: ";print_r($receta); echo "<br><br>";
			//exit();
			$info[0]['idt'] = $idt;	
			$info[0]['tienda'] = $udn[0]['tienda'];	
			$info[0]['modelo'] = $udn[0]['modelo'];	
			$this->_view->ranking = $info;
			
        	
			$this->_view->render('ranking', 'explosion', '','');
		}

		function validarrecetas($codigop){
			$query = "SELECT id, receta_id FROM producto where codigo ='".$codigop."'";
			$datosprod = $this->_main->select($query);
			//print_r($datosprod);
			return $datosprod;
		}

		public function consultarexplosion($fechaini,$fechafin,$idt){
			
			$query = "SELECT explosion_id, ixe.cantidad as cantidad, format(ixe.cantidad,4,'de_DE') as quantity, unidad_medida_sistema_id as unidad_medida_id, mercancia.codigo as coding, CONCAT(mercancia.nombre,' ',mercancia.marca) as ingrediente,
			  format(mercancia.precio_unitario,4,'de_DE') as costo, format((mercancia.precio_unitario*ixe.cantidad),4,'de_DE') as costot, fecha_ranking, unidad_medida.abreviatura, unidad_medida.unidad, producto.nombre 
			 FROM explosion  
             inner join ingredientes_has_explosion as ixe on explosion.id = ixe.explosion_id 
			 inner join mercancia on mercancia.id = ixe.ingrediente_id 
			 inner join unidad_medida on mercancia.unidad_medida_sistema_id = unidad_medida.id 
             inner join producto on producto.codigo = explosion.codigo_prod
			 where fecha_ranking BETWEEN '".$fechaini."' and '".$fechafin."' and explosion.unidad_negocio_id = $idt";
			 $data = $this->_main->select($query);
			/*$query = "SELECT explosion_id, SUM(ixe.cantidad) as quantity, unidad_medida_sistema_id, mercancia.codigo as coding, CONCAT(mercancia.nombre,' ',mercancia.marca) as ingrediente,
			 mercancia.precio_unitario as costo, contenido_neto, fecha_ranking, unidad_medida.abreviatura, unidad_medida.unidad 
			 FROM ingredientes_has_explosion as ixe 
			 inner join mercancia on mercancia.id = ixe.ingrediente_id 
			 inner join unidad_medida on mercancia.unidad_medida_sistema_id = unidad_medida.id 
			 inner join explosion on explosion.id = explosion_id 
			where fecha_ranking BETWEEN '".$fechaini."' and '".$fechafin."' and explosion.unidad_negocio_id = $idt GROUP BY mercancia.codigo";*/
			$query = "SELECT explosion_id, ixe.cantidad as cantidad, format(ixe.cantidad,4,'de_DE') as quantity, unidad_medida_id, producto.codigo as coding, producto.nombre as ingrediente, format(producto.costo,4,'de_DE') as costo, format((producto.costo*ixe.cantidad),4,'de_DE') as costot, fecha_ranking, unidad_medida.abreviatura, unidad_medida.unidad, producto.nombre 
			FROM explosion 
			inner join ingredientes_has_explosion as ixe on explosion.id = ixe.explosion_id 
			inner join producto on producto.id = ixe.producto_id
			inner join unidad_medida on ixe.unidad_medida_id = unidad_medida.id
			where fecha_ranking BETWEEN '".$fechaini."' and '".$fechafin."' and explosion.unidad_negocio_id = $idt";
			 $datos = $this->_main->select($query);
			 $arreglo = array_merge($data,$datos);
			 //print_r($arreglo);
			/*$query ="SELECT codigo from mercancia";
			$codigos = $this->_main->select($query);
			for ($i=0; $i <count($codigos) ; $i++) { 
				for ($j=0; $j <count($explosion) ; $j++) { 
					if ($codigos[$i][0] == $explosion[$j]['coding']) {
						$suma = $cantidades[$i]+$explosion[$j]['cantidad'];
						$cantidades[] = $suma;
					}else{
						//$data[] = $explosion[$i]['coding'];
					}
					
				}
			}*///print_r($explosion);
			$response = array("data"=>$arreglo);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function consultaconsolidada($fechaini,$fechafin,$idt){
			
			$query = "SELECT explosion_id, ixe.cantidad as cantidad, format(SUM(ixe.cantidad),4,'de_DE') as quantity, unidad_medida_sistema_id, mercancia.codigo as coding, CONCAT(mercancia.nombre,' ',mercancia.marca) as ingrediente,
			 format(mercancia.precio_unitario,4,'de_DE') as costo, format(SUM(mercancia.precio_unitario*ixe.cantidad),4,'de_DE') as costot, contenido_neto, fecha_ranking, unidad_medida.abreviatura, unidad_medida.unidad,format(existencia,4,'de_DE') as existencia 
			 FROM ingredientes_has_explosion as ixe 
			 inner join mercancia on mercancia.id = ixe.ingrediente_id
			 inner join mercancia_has_unidad_negocio as mhun on mercancia.id = mhun.mercancia_id
			 inner join unidad_medida on mercancia.unidad_medida_sistema_id = unidad_medida.id 
			 inner join explosion on explosion.id = explosion_id 
			where fecha_ranking BETWEEN '".$fechaini."' and '".$fechafin."' and explosion.unidad_negocio_id = $idt GROUP BY mercancia.codigo";
			$data = $this->_main->select($query);
			$query = "SELECT explosion_id, ixe.cantidad as cantidad, format(ixe.cantidad,4,'de_DE') as quantity, unidad_medida_id, producto.codigo as coding, producto.nombre as ingrediente, format(producto.costo,4,'de_DE') as costo, format(SUM(producto.costo*ixe.cantidad),4,'de_DE') as costot, fecha_ranking, unidad_medida.abreviatura, unidad_medida.unidad, producto.nombre, format(stock_venta,4,'de_DE') as existencia  
			FROM explosion 
			inner join ingredientes_has_explosion as ixe on explosion.id = ixe.explosion_id 
			inner join producto on producto.id = ixe.producto_id
			inner join producto_has_unidad_negocio as phun on producto.id = phun.producto_id
			inner join unidad_medida on ixe.unidad_medida_id = unidad_medida.id
			where fecha_ranking BETWEEN '".$fechaini."' and '".$fechafin."' and explosion.unidad_negocio_id = $idt";
			$datos = $this->_main->select($query);
			$arreglo = array_merge($data,$datos);
			$response = array("data"=>$arreglo);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function consultaranking($fechaini,$fechafin,$idt){
			$query = "SELECT id, fecha, fecha_ranking, grupo, codigo_prod, producto, cantidad, format(monto,4,'de_DE') as monto, format(porcentaje_vta,2,'de_DE') as porcentaje_vta, format(costo,4,'de_DE') as costo, format(costo_total,4,'de_DE') as costo_total, format(porcentaje_costo,2,'de_DE') as porcentaje_costo, unidad_negocio_id
			FROM explosion where fecha_ranking BETWEEN '".$fechaini."' and '".$fechafin."' and explosion.unidad_negocio_id = $idt";
			$data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

			
			
		



		
	}
?>