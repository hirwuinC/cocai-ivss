<?php 
	class inventarioController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_inventario;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			

			$this->_sidebar_menu =array(
					array(
				'id' => 'insert_new',
				'title' => 'Nueva Persona',
				'link' => BASE_URL . 'persons' . DS . 'insert'
						)
			);

			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index(){
			$this->_view->render('index', 'inventario', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function evaluar($id){
			Session::destroy('idmercancia');
			Session::destroy('clasificacion');
			$query = "SELECT empresa_id FROM `unidad_negocio` WHERE id = $id";
			$valores = $this->_main->select($query); #print_r($valores);
			if ($valores[0]['empresa_id'] == null) {
            	$this->stockE($id);
            }else{
            	$this->stockT($id);
            }
		}


		function stockT($tienda){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/inventario'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            Session::time();
			$valores = $this->_main->datostienda($tienda); #print_r($valores);
			$cantidad= count($valores);
			//print_r($valores);exit();
			if ($cantidad > 0) {
				$this->_view->g = $valores;	
				$this->_view->render('stockT', 'grupo', '','');
			}else{
				$query = "SELECT unidad_negocio.id, unidad_negocio.nombre as 'tienda', modelo.id as 'idM', modelo.nombre as 'modelo', submodelo.id as 'idSM', submodelo.nombre as 'subM' FROM `unidad_negocio` inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id inner join modelo on modelo.id = modelo_has_submodelo.modelo_id inner join modelo as submodelo on submodelo.id = modelo_has_submodelo.sub_modelo_id WHERE unidad_negocio.id = $tienda"; 
				$valores = $this->_main->select($query); #print_r($valores);
				$valores[0]['producto'] = 'vacio'; 
				//print_r($valores);
				$this->_view->g = $valores;	
				$this->_view->render('stockT', 'inventario', '','');
			}
	
		}


		function stockE($id){
			if (isset($_SESSION['clasificacion'])) {
				$clasif = $_SESSION['clasificacion'];
				$condicion = "and mercancia.familia_id = '".$clasif."' order by mercancia.id DESC";
            }else{
            	$condicion = 'order by ref.referencia ASC';
			}
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/inventario'));
    		$this->_view->setJs(array('js/proasociados'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            #$idUser =Session::modelo('idUsuario'); echo $idUser[0]['id'];
            Session::time();            	
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, format(mc.existencia,4,'de_DE') as stock, mc.existencia, mercancia.contenido_neto, mercancia.cantidad_presentacion, format(mc.stock_min,4,'de_DE') as stockm, mc.stock_min, format(mc.stock_max,4,'de_DE') as stockm2, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia', tipo_mercancia_id, tipo_ing.referencia as tipo_ingrediente,receta_id FROM `unidad_negocio` 
						inner join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id 
						inner join mercancia on mercancia.id = mc.mercancia_id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
						inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
						left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
						inner join referencia as ref on ref.id = mercancia.familia_id
						inner join referencia as tipo_ing on tipo_ing.id = tipo_mercancia_id
						WHERE unidad_negocio.id = $id $condicion"; 
			$valores = $this->_main->select($query); #print_r($valores);
			$producto = Controller::conversion($valores);
			$this->_view->mercancia = $producto;
			$this->_view->render('stockE', 'inventario', '','');	
		}

		public function agregarsubfamilia($subfamilia){
			$subfamily = str_replace("@"," ",$subfamilia);

			$query = "INSERT INTO referencia (referencia, padre_id) values ('".$subfamily."',147)";
			$data = $this->_main->insertar($query);
			echo json_encode($data);
		}

		function insert($idT=false,$radio=false){
			if ($radio == 1) {
				$this->_view->radio = $radio;
			}
			
			/*Esta funcion aun falta pulirla, no esta funcionando al 100%*/
			if ($_SERVER['REQUEST_METHOD']=='POST') {	
				Session::destroy('idmercancia');
				Session::destroy('clasificacion');
				//Session::destroy('asignar');	
               	#print_r($_POST); echo "<br>"; exit();
               	$mystring = $_POST['precio_unitario'];
                $minvalor = $_POST['stockmin'];
                $maxvalor = $_POST['stockmax'];
                $conte = $_POST['contenidoN'];
                $pesoe = $_POST['pesoEs'];
				$findme   = ',';
				$pos = strpos($mystring, $findme);
				if ($pos != false) {
					$p1 = str_replace(".","",$_POST['precio_unitario']);
               		$precioU = str_replace(",",".",$p1);
				}else{
					$precioU = $_POST['precio_unitario'];
				}

				$pos2 = strpos($minvalor, $findme);
				if ($pos2 != false) {
					$p2 = str_replace(".","",$_POST['stockmin']);
               		$stmin = str_replace(",",".",$p2);
				}else{
					$stmin = $_POST['stockmin'];
				}

				$pos3 = strpos($maxvalor, $findme);
				if ($pos3 != false) {
					$p3 = str_replace(".","",$_POST['stockmax']);
               		$stmax = str_replace(",",".",$p3);
				}else{
					$stmax = $_POST['stockmax'];
				}	

				$pos4 = strpos($conte, $findme);
				if ($pos4 != false) {
					$p4 = str_replace(".","",$_POST['contenidoN']);
               		$contenidoN = str_replace(",",".",$p4);
				}else{
					$contenidoN = $_POST['contenidoN'];
				}

				$pos5 = strpos($pesoe, $findme);
				if ($pos5 != false) {
					$p5 = str_replace(".","",$_POST['pesoEs']);
               		$peso_esc = str_replace(",",".",$p5);
				}else{
					$peso_esc = $_POST['pesoEs'];
				}

				if (is_null($_POST['descripcion'])) {
					$detalle = $_POST['descripcion2'];
				}else{
					$detalle = $_POST['descripcion'];
				}
				if (isset($_POST['subfamilia'])) {
					$subf = $_POST['subfamilia'];
				}else{
					$subf = 'NULL';
				}
				if (isset($_POST['peso_escurrido'])) {
					$peso_esc = $_POST['peso_escurrido'];
				}else{
					$peso_esc = 'NULL';
				}
				if (isset($_POST['stock_min']) and isset($_POST['stock_max'])) {
					$stmin = $_POST['stock_min'];
					$stm2 = $_POST['stock_max'];
				}else{
					$stmin = 'NULL';
					$stmax = 'NULL';
				}

				
               	//echo $precioU; exit();
               	Session::destroy('carrito');
               	$campos = $this->verificarFormulasYcamposVacios($_POST); #print_r($campos); exit();
               	  if (empty($precioU)) {
	       		  	$price = 0.000;
	       		  }else{
	       		  	$price = $precioU;
	       		  }

	       		  if (empty($contenidoN)) {
	       		  	$contentN = 0.000;
	       		  }else{
	       		  	$contentN = $contenidoN;
	       		  }

	       		  if (empty($_POST['contenidoC'])) {
	       		  	$contentC = 1;
	       		  }else{
	       		  	$contentC = $_POST['contenidoC'];
	       		  }
               	if ($campos[5] == 1) {
               		if ($_POST['familia'] != 135 and $_POST['tipo_ingrediente']==160) {
               			if (!empty($_POST['contenidoN'])) {
	               		 	$conversion = Controller::formula($_POST['unidad_medida_c'],false,$_POST['contenidoC'],$contenidoN,$_POST['formulac']);
	               		}else{
	               			$conversion = 0.0000;
	               		}   	
               		 	$motivok = 'Producto de compra, registrado en sistema';
               		 }else{
               		 	$conversion = 0.0000;
               		 	$motivok = 'Producto semi terminado, registrado en sistema';
               		 }

               		 if (empty($_POST['marca'])) {
               		  	$mark = ' ';
               		  }else{
               		  	$mark = $_POST['marca'];
               		  }

               		  

               		  if (isset($_POST['unidad_medida_c'])) {
               		  	$umc_id = $_POST['unidad_medida_c'];
               		  	$query = "INSERT INTO `mercancia`(`codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `sub_familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`, `peso_escurrido`, `descripcion`, `exento_impuesto`,tipo_mercancia_id,tipo_inventario_id) 
					    	values ('".$_POST['codigo']."','".$campos[2]."','".$_POST['nombre']."','".$_POST['marca']."',".$price.",".$contentN.",".$contentC.",'".$_POST['formulac']."','".$campos[0]."','".$campos[1]."','".$_POST['familia']."',".$subf.",".$_POST['unidad_medida_c'].",".$_POST['unidad_medida_p'].",".$_POST['unidad_medida_s'].",".$peso_esc.",'".$campos[8]."',".$campos[6].",'".$_POST['tipo_ingrediente']."','".$_POST['tipo_inventario']."')";
							$idP=$this->_main->insertar($query);
               		  }else{
               		  	$query = "INSERT INTO `mercancia`(`codigo`, `codigo_anterior`, `nombre`, `marca`,  `formula_p`, `formula_s`, `familia_id`, `sub_familia_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`, `peso_escurrido`, `descripcion`,tipo_mercancia_id,tipo_inventario_id) 
					    	values ('".$_POST['codigo']."','".$campos[2]."','".$_POST['nombre']."','".$mark."','".$campos[0]."','".$campos[1]."','".$_POST['familia']."',".$subf.",".$_POST['unidad_medida_p'].",".$_POST['unidad_medida_s'].",".$peso_esc.",'".$detalle."','".$_POST['tipo_ingrediente']."','".$_POST['tipo_inventario']."')";
							$idP=$this->_main->insertar($query);
               		  }
                	 
                	$accion = 'Creado'; //var_dump($conversion); exit();
			    	 
			   		$query = "INSERT INTO `mercancia_has_unidad_negocio`(`mercancia_id`, `unidad_negocio_id`, `existencia`, `stock_min`, `stock_max`, `status`, `descripcion`) VALUES (".$idP.",".$_POST['idT'].",".$conversion.",".$stmin.",".$stmax.",".$campos[7].",'".$detalle."')"; 
               		$this->_main->insertar($query);
                	
                }else{
                	if (empty($_POST['marca'])) {
               		  	$mark = ' ';
               		  }else{
               		  	$mark = $_POST['marca'];
               		  }
               		  if ($_POST['familia'] != 135) { 
               		  	$conversion = Controller::formula($_POST['unidad_medida_c'],$campos[5],$_POST['contenidoC'],$_POST['contenidoN'],$_POST['formulac']);
               		  	$motivok = 'Producto de compra, registrado en sistema';
               		  }else{
               		 	$conversion = 0.0000;
               		 	$motivok = 'Producto semi terminado, registrado en sistema';
               		 }
	                $accion = 'Creado'; //var_dump($conversion); exit();
				    $query = "INSERT INTO `mercancia`(`codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`,tipo_mercancia_id,tipo_inventario_id) values ('".$_POST['codigo']."','".$_POST['codigo_anterior']."','".$_POST['nombre']."','".$_POST['marca']."',".$price.",".$contentN.",".$campos[5].",'".$_POST['formulac']."','".$campos[0]."','".$campos[1]."',".$_POST['familia'].",".$_POST['unidad_medida_c'].",".$_POST['unidad_medida_p'].",".$_POST['unidad_medida_s'].",'".$_POST['tipo_ingrediente']."','".$_POST['tipo_inventario']."')";
					$idP=$this->_main->insertar($query); 
				    $query = "INSERT INTO `mercancia_has_unidad_negocio`(`mercancia_id`, `unidad_negocio_id`, `stock_min`, `stock_max`, `existencia`, `descripcion`, `status`) VALUES (".$idP.",".$_POST['idT'].",".$stmin.",".$stmax.",".$conversion.",'".$detalle."',".$campos[7].")";
					$this->_main->insertar($query);
					
				}
				
					$this->insertProveedor($idP);
					$this->_main->log($idP,$_POST['idT'],$accion);
					$this->_main->kardex($conversion,123,131,$idP,$_POST['idT'],$_POST['unidad_medida_s'],$motivok);
					if ($_POST['tipo_ingrediente'] == 161) {
						$_SESSION['idmercancia'] = $idP;
						$_SESSION['clasificacion'] = $_POST['familia'];
						if (isset($_POST['asignacion'])) {
							$_SESSION['asignar'] = $_POST['asignacion'];
						}
						
						$query = "INSERT INTO `receta` (`nombre`, `costo`, `rendimiento`, `unidad_medida_id`) VALUES ('".$_POST['nombre']."', NULL, '0.0000', '0')";
						$idR=$this->_main->insertar($query);
						$query ="UPDATE `mercancia` SET `receta_id`=$idR WHERE mercancia.id = $idP";
						$this->_main->modificar($query);
						/*$datost = $this->_main->datostienda($idT);
						$query = "INSERT INTO `modelo_has_receta`(`modelo_id`, `receta_id`) VALUES ('".$datost[0]['modelo']."','".$idr."')";
    					$idrm = $this->_main->insertar($query);*/
						$fam = $_POST['familia'];
						$this->_view->tienda = $_POST['idT'];
						$this->_view->redirect('inventario/agrupados/'.$_POST['idT'].'/'.$idP.'/'.$fam);

					}else{
						if ($_POST['tipo_ingrediente'] == 162) {
							$costot=0;
							$existente = 0;
							$cont = count($_SESSION['carrito2']);
							for ($h=0; $h < $cont; $h++) { 
								$costot = $costot+$_SESSION['carrito2'][$h]['precio'];
								$costopromedio = $costot/($cont);
								$existente = $existente+$_SESSION['carrito2'][$h]['existencia'];
								$query = "UPDATE `mercancia` SET `asociado_id`='".$idP."' WHERE mercancia.id = '".$_SESSION['carrito2'][$h]['id']."'";
								$this->_main->modificar($query);
							}
							$query = "UPDATE `mercancia` SET `precio_unitario`='".$costopromedio."' WHERE mercancia.id = $idP";
							$this->_main->modificar($query);
							$query="UPDATE `mercancia_has_unidad_negocio` SET `existencia`='".$existente."' WHERE unidad_negocio_id = ".$_POST['idT']." and mercancia_id = $idP";
							$this->_main->modificar($query);
						}
						$_SESSION['idmercancia'] = $idP;
						$_SESSION['clasificacion'] = $_POST['familia'];
						if (isset($_POST['asignacion'])) {
							if ($_POST['asignacion'] == 1) {
								$this->_view->redirect('inventario/asignacionProducto/'.$_POST['idT']);
							}else{
								
								
								$this->_view->redirect('inventario/insert/'.$_POST['idT'].'/1');
							}
							
						}else{
							$this->_view->redirect('inventario/stockE/'.$_POST['idT']);
						}
						
					}
			}else{ 
				Session::destroy('carrito');
				Session::destroy('carrito2');
				Session::destroy('idmercancia');
				Session::destroy('clasificacion');
				Session::destroy('asignar');
				$this->_view->setCss(array('datatable/css/bootstrap4.min'));
			    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
			    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
			    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
			    $this->_view->setJs(array('datatable/js/tabla'));
				$this->_view->setJs(array('js/inventario'));
				$this->_view->setJs(array('js/proasociados'));
				$this->_view->idT = $idT;
				$tienda = $this->_main->datostienda($idT);
				$this->_view->g = $tienda;
				$this->_view->render('insertar','inventario','','');
			}
		}

		function agrupados($idT,$idP,$fam){
			$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
			$this->_view->setJs(array('js/agrupados'));
			$query = "SELECT mercancia.id as idpr, mercancia.nombre as producto, marca, receta.id as idre, receta.nombre as receta, mercancia.receta_id,familia_id,sub_familia_id,receta_id from mercancia
			left join receta on mercancia.receta_id = receta.id 
			where mercancia.id = $idP";
    		$datosing = $this->_main->select($query);
    		$query = "SELECT unidad_negocio.id as idU, unidad_negocio.nombre as udn, modelo.nombre as modelo, modelo.id as idm, empresa_id From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $idT";
			$this->_view->tienda = $this->_main->datostienda($idT);
			$this->_view->mercancia = $datosing;
			$this->_view->familia = $fam;
			$this->_view->render('agrupados','inventario','','');
		}

		public function loadingredientes($fam,$idm=false,$idt=false){
			if ($idm != 'false') {
				$where = 'familia_id = '.$fam.' and mercancia.id not in('.$idm.')';
			}else{
				$where = 'familia_id = '.$fam.' and unidad_negocio.id = '.$idt.'';
			}
			$query = "SELECT DISTINCT(mercancia.id) as idi, mercancia.codigo as codigi, unidad_medida_compra_id as umcid, unidad_medida_consumo_id as umpid, unidad_medida_sistema_id as umsid, umc.abreviatura as abumc, ump.abreviatura as abump, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, mercancia.precio_unitario as precioU, formula_p, formula_s, format(precio_unitario,4,'de_DE') as costo  FROM `mercancia`
			left join unidad_medida as umc on umc.id = mercancia.unidad_medida_compra_id
            inner join unidad_medida as ump on ump.id = mercancia.unidad_medida_consumo_id
            inner join unidad_medida as ums on ums.id = mercancia.unidad_medida_sistema_id
            inner join mercancia_has_unidad_negocio as mudn on mudn.mercancia_id = mercancia.id
            inner join unidad_negocio on unidad_negocio.id = mudn.unidad_negocio_id
            where $where";
            $data = $this->_main->select($query);

    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}
		public function asociados($id,$tipo,$idt){
			//Session::destroy('carrito2');
			$query = "SELECT mercancia.id, nombre, marca,codigo, precio_unitario, um1.id as idums, um1.abreviatura as ums, um2.id as idump, um2.abreviatura as ump, mhudn.existencia, format(existencia,4,'de_DE') as stock, format(precio_unitario,4,'de_DE') as costo FROM mercancia
			inner join unidad_medida as um1 on um1.id = mercancia.unidad_medida_sistema_id
			inner join unidad_medida as um2 on um2.id = mercancia.unidad_medida_consumo_id
			inner join mercancia_has_unidad_negocio as mhudn on mhudn.mercancia_id = mercancia.id
			where mercancia.id = $id and mhudn.unidad_negocio_id = $idt";
				$datos = $this->_main->select($query);

			if (isset($_SESSION['carrito2'])) {
				$arreglo = $_SESSION['carrito2'];
				//print_r($arreglo); echo "<br>";
				$encontro=false;
        		$numero=0;
        		for($i=0;$i<count($arreglo);$i++){
		          if($arreglo[$i]['id']==$id){
		            $encontro=true;
		            $numero=$i;
		          }
		        }
		        	if($encontro==true){
			          switch ($tipo) {
			            case '1':
			                $arreglo[$numero]['id']= $id;
			                $arreglo[$numero]['precio']=$datos[0]['precio_unitario'];
			                $arreglo[$numero]['costo']=$datos[0]['costo'];
			                $arreglo[$numero]['ump'] = $datos[0]['ump'];
			                $arreglo[$numero]['ums'] = $datos[0]['ums'];
			                $arreglo[$numero]['nombre'] = $datos[0]['nombre'];
			                $arreglo[$numero]['marca'] = $datos[0]['marca'];
			                $arreglo[$numero]['codigo'] = $datos[0]['codigo'];
			                $arreglo[$numero]['existencia'] = $datos[0]['existencia'];
			                $arreglo[$numero]['stock'] = $datos[0]['stock'];
			                $_SESSION['carrito2']=$arreglo;
			              
			              
			            break;
			            
			            default:
			            	unset($_SESSION['carrito2'][$numero]);
			                $arreglo = array_values($_SESSION['carrito2']);
			                $_SESSION['carrito2']=$arreglo;
			            break;
			          }
			          
			        }else{
			        	if ($tipo == 1) {
				        	$arreglo = $_SESSION['carrito2'];
				        	$datosNuevos=array('id'=>$id,
			                    'precio'=>$datos[0]['precio_unitario'],
			                    'costo'=>$datos[0]['costo'],
			                    'ump'=>$datos[0]['ump'],
			                    'ums'=>$datos[0]['ums'],
			                    'nombre'=>$datos[0]['nombre'],
			                    'marca'=>$datos[0]['marca'],
			                    'codigo'=>$datos[0]['codigo'],
			                    'existencia'=>$datos[0]['existencia'],
			                    'stock'=>$datos[0]['stock']);
			                  array_push($arreglo, $datosNuevos);
				          	$_SESSION['carrito2']=$arreglo;
			        	}
			        	
			        }
			}else{
				$arreglo[]=array('id'=>$id,
                    'precio'=>$datos[0]['precio_unitario'],
                    'costo'=>$datos[0]['costo'],
                    'ump'=>$datos[0]['ump'],
			        'ums'=>$datos[0]['ums'],
                    'nombre'=>$datos[0]['nombre'],
                    'marca'=>$datos[0]['marca'],
                    'codigo'=>$datos[0]['codigo'],
                    'existencia'=>$datos[0]['existencia'],
                    'stock'=>$datos[0]['stock']);
				$_SESSION['carrito2'] = $arreglo;
			}
			
			echo json_encode($_SESSION['carrito2']);
				
		}

		public function datosasoc(){
			$data = $_SESSION['carrito2'];
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function vaciarsesion(){
			Session::destroy('carrito2');
			$data = true;
			echo json_encode($data);
		}


		

		function insertProveedor($idP){
			if (isset($_SESSION['carrito'])) {
				$arreglo = $_SESSION['carrito']; //print_r($arreglo); 
				for ($i=0; $i < count($arreglo); $i++) {
					$mystring = $arreglo[$i]['precio'];
					$findme   = ',';
					$pos = strpos($mystring, $findme);
					if ($pos != false) {
						$p1 = str_replace(".","",$arreglo[$i]['precio']);
	               		$precioP[$i] = str_replace(",",".",$p1);
					}else{
						$precioP[$i] = $arreglo[$i]['precio'];
					}
					$query = "SELECT id FROM `proveedor` WHERE nombre like '%".$arreglo[$i]['nombre']."%'"; 
					$idProveedor=$this->_main->select($query); #print_r($idProveedor); exit();
					 $query = "INSERT INTO `proveedor_has_mercancia`(`mercancia_id`, `proveedor_id`, `codigo_x_proveedor`, `precio`, `status`) VALUES (".$idP.",".$idProveedor[0]['id'].",'".$arreglo[$i]['codigo']."','".$precioP[$i]."',0)";echo "<br>";
					$this->_main->insertar($query); 
				}
			}
		}

		function modalUpdate($idP,$idT){
			#ESTA FUNCION ME PERMITE CARGAR LA INFO DEL PRODUCTO A EDITAR Y LA CONVERSION DE LA UNIDAD MINIMA A LA DE COMPRA Y PRESENTACION.
			$query = "SELECT mercancia.id as 'idP', mercancia.codigo, mercancia.codigo_anterior, mercancia.nombre as 'producto', mercancia.marca, mercancia.contenido_neto, mercancia.formula_c, mercancia.formula_p, mercancia.formula_s, mercancia.cantidad_presentacion,  mc.existencia, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.id as 'idf', ref.referencia as 'familia', mc.status, asociado_id, tipo_inventario_id, tipo_mercancia_id, ref2.referencia as tipo_ingrediente, mercancia.descripcion FROM `mercancia` 
						inner join mercancia_has_unidad_negocio as mc on mc.mercancia_id = mercancia.id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
						inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
						left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
						inner join referencia as ref on ref.id = mercancia.familia_id
						inner join referencia as ref2 on ref2.id = mercancia.tipo_mercancia_id
						WHERE mercancia.id = $idP and mc.unidad_negocio_id = $idT order by ref.referencia ASC"; 
			$data = $this->_main->select($query);
			
			$producto = Controller::conversion($data);
			
			
			echo json_encode($producto);
		}

		function update(){
            if ($_SERVER['REQUEST_METHOD']=='POST') {
                //print_r($_POST); echo"<br>"; exit();
                $mystring = $_POST['precio_unitario'];
                $minvalor = $_POST['stockmin'];
                $maxvalor = $_POST['stockmax'];
                $exi = $_POST['existencia'];
                $conte = $_POST['contenidoN'];
                $pesoe = $_POST['pesoEs'];
				$findme   = ',';
				$pos = strpos($mystring, $findme);
				if ($pos != false) {
					$p1 = str_replace(".","",$_POST['precio_unitario']);
               		$precioU = str_replace(",",".",$p1);
				}else{
					$precioU = $_POST['precio_unitario'];
				}

				$pos2 = strpos($minvalor, $findme);
				if ($pos2 != false) {
					$p2 = str_replace(".","",$_POST['stockmin']);
               		$stmin = str_replace(",",".",$p2);
				}else{
					$stmin = $_POST['stockmin'];
				}

				$pos3 = strpos($maxvalor, $findme);
				if ($pos3 != false) {
					$p3 = str_replace(".","",$_POST['stockmax']);
               		$stmax = str_replace(",",".",$p3);
				}else{
					$stmax = $_POST['stockmax'];
				}

				$pos4 = strpos($exi, $findme);
				if ($pos4 != false) {
					$p4 = str_replace(".","",$_POST['existencia']);
               		$existencia = str_replace(",",".",$p4);
				}else{
					$existencia = $_POST['existencia'];
				}

				$pos5 = strpos($conte, $findme);
				if ($pos5 != false) {
					$p5 = str_replace(".","",$_POST['contenidoN']);
               		$contenidoN = str_replace(",",".",$p5);
				}else{
					$contenidoN = $_POST['contenidoN'];
				}

				$pos5 = strpos($pesoe, $findme);
				if ($pos5 != false) {
					$p5 = str_replace(".","",$_POST['pesoEs']);
               		$peso_esc = str_replace(",",".",$p5);
				}else{
					$peso_esc = $_POST['pesoEs'];
				}
                
                $this->entradaOsalida($_POST['idP'],$_POST['idT'],$existencia, $_POST['unidad_medida_si']);
                if (!isset($_POST['subfamilia'])) {
                	$subf = 'NULL';
                }else{
                	$subf = $_POST['subfamilia'];
                }
                if ($_POST['tipo_ingrediente'] == 161 or $_POST['tipo_ingrediente'] == 162 or $_POST['familia_id'] == 135) {
                	$query = "UPDATE `mercancia` SET `codigo`='".$_POST['codigo']."',`codigo_anterior`='".$_POST['codigo_tcr']."',`nombre`='".$_POST['nombre']."',`marca`='".$_POST['marca']."',`formula_p`='".$_POST['formulap']."',`formula_s`='".$_POST['formulas']."',`familia_id`=".$_POST['familia_id'].",`sub_familia_id`=".$subf.",`unidad_medida_consumo_id`=".$_POST['unidad_medida_pr'].",`unidad_medida_sistema_id`=".$_POST['unidad_medida_si'].",tipo_inventario_id = '".$_POST['tipo_inventario']."',descripcion = '".$_POST['descripcion2']."' WHERE `id`= ".$_POST['idP']."";
                $this->_main->modificar($query);
                /*quitar campos de compra*/
                }else {
                $query = "UPDATE `mercancia` SET `codigo`='".$_POST['codigo']."',`codigo_anterior`='".$_POST['codigo_tcr']."',`nombre`='".$_POST['nombre']."',`marca`='".$_POST['marca']."',`precio_unitario`='".$precioU."',`contenido_neto`='".$contenidoN."',`cantidad_presentacion`='".$_POST['cantidad']."',`formula_c`='".$_POST['formulac']."',`formula_p`='".$_POST['formulap']."',`formula_s`='".$_POST['formulas']."',`familia_id`=".$_POST['familia_id'].",`sub_familia_id`=".$subf.",`unidad_medida_compra_id`=".$_POST['unidad_medida_co'].",`unidad_medida_consumo_id`=".$_POST['unidad_medida_pr'].",`unidad_medida_sistema_id`=".$_POST['unidad_medida_si'].",peso_escurrido = '".$peso_esc."', tipo_inventario_id = '".$_POST['tipo_inventario']."',descripcion = '".$_POST['descripcion2']."' WHERE `id`= ".$_POST['idP']."";
                $this->_main->modificar($query);
                }

            if ($_POST['tipo_ingrediente'] == 162) {
					$cont = count($_SESSION['carrito2']);
                for ($h=0; $h < $cont; $h++) { 
					$query = "UPDATE `mercancia` SET `asociado_id`=".$_POST['idP']." WHERE mercancia.id = '".$_SESSION['carrito2'][$h]['id']."'";
					$this->_main->modificar($query);
				}
			}
                
                $query = "UPDATE `mercancia_has_unidad_negocio` SET `existencia`='".$existencia."',`stock_min`='".$stmin."',`stock_max`='".$stmax."',`status`=".$_POST['status']." WHERE `mercancia_id`= ".$_POST['idP']." and unidad_negocio_id = ".$_POST['idT']."";
                $this->_main->modificar($query);
                $accion='Modificado'; 
                $this->_main->log($_POST['idP'],$_POST['idT'],$accion);
                $this->_view->redirect('inventario/evaluar/'.$_POST['idT']);

            }else{
                $this->_view->redirect('inventario/evaluar/'.$_POST['idT']);

            }
        }

        function entradaOsalida($idP, $idT, $existencia, $unidad,$motive=false,$description=false){
        	$query="SELECT existencia FROM `mercancia_has_unidad_negocio` where mercancia_id = $idP and unidad_negocio_id = $idT";
        	$dato = $this->_main->select($query);
        	if ($existencia < $dato) {
        		if ($motive != false and $description != false) {
        			$motivo = $motive;
        			$descripcion= $description;
        		}else{
        			$motivo = 133;
        			$descripcion='registo de producto en sistema';
        		}
        		$tipoM = 132;
        		$this->_main->kardex($existencia,$motivo,$tipoM,$idP,$idT,$unidad,$descripcion);
        	}elseif ($existencia > $dato) {
        		if ($motivo != false and $descripcion != false) {
        			$motivo = $motive;
        			$descripcion= $description;
        		}else{
        			$motivo = 123;
        			$descripcion='Compra';
        		}
        		$tipoM = 131;
        		$this->_main->kardex($existencia,$motivo,$tipoM,$idP,$idT,$unidad,$descripcion);
        	}
        }


		function existenciaT($tipo){
			$fecha = date('Y-m-d');
			$hora = date('g:i:s a');
			$idUsuario = Session::get('idUsuario');
			//echo $fecha.' '.$hora;exit(); 
			if ($_SERVER['REQUEST_METHOD']=='POST') {
				// Controller::varDump($_POST);exit();
				$unidadMedida = $_POST['unidad_medida_c'];
				$cantidadComprada = $_POST['contenidoC'];
				$contenidoNeto = $_POST['contenidoN'];
				if (!empty($_POST['cantidad'])) {
					$cantidad = $_POST['cantidad'];
					$cantidad_registrar = Controller::formula($unidadMedida, $cantidad, $cantidadComprada, $contenidoNeto);
				}else{
					$cantidad_registrar = Controller::formula($unidadMedida,'', $cantidadComprada, $contenidoNeto);
				}
				//echo $cantidad_registrar; exit();
				
				switch ($tipo) {
					case 'rcd':
						$tipo_mov = 122;
					$query = "INSERT INTO kardex (`fecha`, `hora`, `cantidad`, `motivo`, `tipo_movimiento_id`, `mercancia_id`, `unidad_negocio_id`, `usuario_id`, `unidad_medida_id`) 
						VALUES ('".$fecha."','".$hora."','".$cantidad_registrar."','".$_POST['detalles']."','".$tipo_mov."','".$_POST['idmer']."','".$_POST['idtienda']."','".$idUsuario."','".$_POST['unidadS']."')";
						$idk = $this->_main->insertar($query);
					$query= "UPDATE mercancia_has_unidad_negocio SET 
					existencia='".$cantidad_registrar."', precio_unitario='".$_POST['precio_unitario']."', unidad_medida_compra_id='".$unidadMedida."'
					WHERE unidad_negocio_id = '".$_POST['idtienda']."' and mercancia_id = '".$_POST['idmer']."'";
					$idmudn = $this->_main->modificar($query);
					$this->_view->g = $this->stockT($_POST['idtienda']);
					//$this->_view->render('stockT', 'inventario', '','');	
					break;
					case 'prov':
						$tipo_mov = 123;
						$query = "";
					break;
					case 'remision':
						$tipo_mov = 124;
						$query = "Remision de mercancia";
					break;
				}
			}

		}

		function delete($idP,$idT){
			//echo $idm.' '.$idsm; exit();
			$accion = 'Eliminado';
			$query = "SELECT * from ingrediente_has_receta where ingrediente_id = $idP";
            $productos = $this->_main->select($query);
            $lista = count($productos);
            //print_r($lista);exit();
            if ($lista > 0){
                $query ="UPDATE ingrediente_has_receta set ingrediente_id = NULL where ingrediente_id = $idP";
                $this->_main->modificar($query);
                $this->_main->log($idP,$idT,$accion);
                $query ="DELETE FROM `mercancia_has_unidad_negocio` WHERE mercancia_id = $idP";
                $resulta=$this->_main->eliminar($query);
                
            	
                
                
                if (!empty($resultado)) {
                	$js = true;
                	echo json_encode($js);
	            }else{
	                $js = false;
	                echo json_encode($js);
	            }
            }else{
            	$this->_main->log($idP,$idT,$accion);
            	$query = "DELETE FROM `mercancia_has_unidad_negocio` WHERE mercancia_id = $idP";
                $resultado=$this->_main->eliminar($query);
                
                if (!empty($resultado)) {
	                $js = true;
	                echo json_encode($js);
	            }else{
	                $js = false;
	                echo json_encode($js);
            	}
            }	
		}

		function verificarFormulasYcamposVacios($post){
			#print_r($post); exit();
			$formulaP=list($unidad, $signo, $contenidoNetoP) = explode(" ", $post['formulap']);
			$formulaS=list($unidad, $signo, $contenidoNetoS) = explode(" ", $post['formulas']);
			if ($contenidoNetoP == null) {
				$formulaP=NULL;
			}else{
				$formulaP=$post['formulap'];
			}
			if ($contenidoNetoS == null) {
				$formulaS = NULL;
			}else{
				$formulaS=$post['formulas'];
			}
			if ($post['codigo_anterior'] == null) {
				$codigoA=NULL;
			}else{
				$codigoA=$post['codigo_anterior'];
			}
			if ($post['pesoEs'] == null) {
				$pesoEs=NULL;
			}else{
				$pesoEs=$post['pesoEs'];
			}
			
			if ($post['cantidadConsumo'] == null) {
                $cantidad = 1;
            }else{
            	$cantidad = $post['cantidadConsumo'];
            }
            if (isset($post['exento']) and $post['exento'] == 'on') {
                $exento = 1;
            }else{
                $exento = 0;
            }
            if (isset($post['estatus']) and $post['estatus'] == 'on') {
                $status = 1;
            }else{
                $status = 0;
            }
            if ($post['descripcion'] == null) {
                $descripcion = NULL;
            }else{
                $descripcion = $post['descripcion'];;
            }     
			$resultado[0] = $formulaP; 
			$resultado[1] = $formulaS; 
			$resultado[2] = $codigoA; 
			$resultado[3] = $pesoEs; 
			$resultado[5] = $cantidad;
			$resultado[6] = $exento;
			$resultado[7] = $status;
			$resultado[8] = $descripcion;
			return $resultado;
		}

		function validarCod($code){
            $query = "SELECT codigo FROM mercancia where codigo = '".$code."'";
            $resultado = $this->_main->select($query);
            if (!empty($resultado)) {
                $codigo = true;
            }else{
                $codigo = false;
            }
            echo json_encode($codigo);

        }

        function validarProducto($name, $marca,$codigo){
            $marca=str_replace ( ':' , ' ' , $marca);
            $nombre=str_replace ( '@' , ' ' , $name);
            $query = "SELECT codigo, nombre, marca FROM mercancia where codigo = '".$codigo."' and nombre = '".$nombre."' and marca = '".$marca."'";
            $resultado = $this->_main->select($query);
            if (!empty($resultado)) {
                $nom= true;
            }else{
                $nom = false;
            }
            echo json_encode($nom);

        }

		function setunidadT($unidad_p){
			$query = "SELECT * from unidad_medida where id = $unidad_p";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		function datosPT($idP,$idT){
			$query = "SELECT mercancia.id as idM, mercancia.codigo, mercancia.nombre as producto, mercancia.marca as marca, precio_unitario, stock_min, stock_max, unidad_medida_sistema_id, referencia.referencia as familia, unidad_medida.unidad, unidad_medida.abreviatura
			FROM mercancia 
            inner join mercancia_has_unidad_negocio on mercancia_has_unidad_negocio.mercancia_id = mercancia.id
			inner join referencia on referencia.id = familia_id
			inner join unidad_medida on unidad_medida_sistema_id = unidad_medida.id
            inner join unidad_negocio on mercancia_has_unidad_negocio.unidad_negocio_id = unidad_negocio.id
            where mercancia.id = $idP and unidad_negocio.id = $idT ";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		 function notificaciones($privilegios){
		 	/*SELECT reposicion_id, remision_id, remision.unidad_negocio_id as udnremi, status_id, remision.fecha as fecharemi, remision.hora as horaremi, descripcion, cantidad, rm.unidad_negocio_id as udnrepo, rm.fecha as fecharepo, rm.hora as horarepo, total, tipo_reposicion
FROM notificacion_has_remision 
					left join remision on remision_id = remision.id
                    left join reposicion_mercancia as rm on rm.id = notificacion_has_remision.reposicion_id
					where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 order by notificacion_has_remision.status_id, remision.fecha, rm.fecha asc*/
			$modelos = Session::modelo('idUsuario');
			switch ($privilegios) {
				case 'e':
					$query = "SELECT remision_id, reposicion_id, nt.unidad_negocio_id as idunt, status_id, unidad_negocio.codigo as codiudR, unidad_negocio.nombre as tiendaR, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, referencia.referencia as status, reposicion_mercancia.unidad_negocio_id as idurepo, remision.unidad_negocio_id as iduremi, udnrepo.nombre as tiendarepo, udnrepo.rif as rifrepo, udnrepo.razon_social as razon_srepo, udnrepo.correo as emailurepo, udnrepo.empresa_id as idempresaurepo, udnremi.nombre as tiendaremi, udnremi.rif as rifremi, udnremi.razon_social as razon_sremi, udnremi.correo as emailuremi, udnremi.empresa_id as idempresauremi, usuario.nombre as nombreremi, usuario.apellido as apellidoremi, user.nombre as nombrerepo, user.apellido as apellidorepo, remision.usuario_id as idusremi, reposicion_mercancia.usuario_id as idusrepo,  modelo.nombre as modelo, modelrepo.nombre as modelorepo, modelremi.nombre as modeloremi, num_remision, num_reposicion, remision.fecha as fecharemi, remision.hora as horaremi, reposicion_mercancia.fecha as fecharepo, DATE_FORMAT(reposicion_mercancia.fecha, '%d/%m/%Y') as daterepo, reposicion_mercancia.hora as horarepo, reposicion_mercancia.total
				FROM `notificacion_has_remision`as nt 
				LEFT JOIN remision on remision_id = remision.id 
				LEFT JOIN reposicion_mercancia on reposicion_mercancia.id = reposicion_id 
				INNER JOIN unidad_negocio on unidad_negocio.id = nt.unidad_negocio_id 
				LEFT JOIN unidad_negocio as udnrepo on udnrepo.id = reposicion_mercancia.unidad_negocio_id 
				LEFT JOIN unidad_negocio as udnremi on udnremi.id = remision.unidad_negocio_id 
				INNER JOIN referencia on referencia.id = status_id
				left JOIN usuario on usuario.id = remision.usuario_id
				left JOIN usuario as user on user.id = reposicion_mercancia.usuario_id
				LEFT JOIN modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      			LEFT JOIN modelo on modelo.id = modelo_has_submodelo.modelo_id
      			LEFT JOIN modelo_has_submodelo as mhsrepo on mhsrepo.id = udnrepo.modelo_has_submodelo_id
      			LEFT JOIN modelo as modelrepo on modelrepo.id = modelo_has_submodelo.modelo_id
      			LEFT JOIN modelo_has_submodelo as mhsremi on mhsremi.id = udnremi.modelo_has_submodelo_id
      			LEFT JOIN modelo as modelremi on modelremi.id = modelo_has_submodelo.modelo_id
					where nt.status_id = 126 or nt.status_id = 127 or nt.status_id = 128 or nt.status_id = 129 or nt.status_id = 201 order by nt.status_id, remision.fecha, reposicion_mercancia.id desc";
					$data = $this->_main->select($query);

					echo json_encode($data);
				break;
				
				case 't':
					
					for ($i=0; $i < count($modelos); $i++) {
						$udn[$i] = $modelos[$i]['idUd'];
					$query = "SELECT remision_id, reposicion_id, remision.unidad_negocio_id as udnremi, status_id, remision.fecha as fecharemi, remision.hora as horaremi, descripcion, cantidad, rm.unidad_negocio_id as udnrepo, notificacion_has_remision.unidad_negocio_id as udnr, rm.fecha as fecharepo, rm.hora as horarepo, total, tipo_reposicion
					FROM notificacion_has_remision 
					left join remision on remision_id = remision.id
                    left join reposicion_mercancia as rm on rm.id = notificacion_has_remision.reposicion_id
					where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 or notificacion_has_remision.status_id = 201 order by notificacion_has_remision.status_id, remision.fecha, rm.id desc";
						$datos = $this->_main->select($query);
						//echo count($datos)."<br>";
						
							for ($j=0; $j <count($datos) ; $j++) { 
								//echo $datos[$j][2]."<br>";
								if ($datos[$j][2] == $udn[$i]) {
									$data[] = $datos[$j];
								}
							}//print_r($data);
							
					}echo json_encode($data);
				break;

		
			}	    
      	}

      	public function incrementarreq($cantidad){
			session::destroy('requisiciones');
			$_SESSION['requisiciones'] = $cantidad;
			$data = $_SESSION['requisiciones'];
			echo json_encode($data);
      	}

      	public function restarreq($cantidad){
			session::destroy('requisiciones');
			$_SESSION['requisiciones'] = $cantidad;
			$data = $_SESSION['requisiciones'];
			echo json_encode($data);
      	}
    	

    	/*function remisionM($id,$success = false){
    		$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/remision'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
    		
    		$query = "SELECT id, nombre, empresa_id FROM unidad_negocio where unidad_negocio.id = $id";
    		$datosT = $this->_main->select($query);
    		

    		$idempresa = $datosT[0]['empresa_id'];
    		$query = "SELECT unidad_negocio.id, unidad_negocio.nombre, modelo.nombre as modelo from unidad_negocio 
    		left join modelo_has_submodelo  on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
    		left join modelo on modelo.id = modelo_has_submodelo.modelo_id
    		where empresa_id = $idempresa";
    		$tiendas = $this->_main->select($query);
    		$query = "SELECT nombre from mercancia";
    		$products = $this->_main->select($query);
    		$this->_view->prod = $products;
    		$tiendas[0]['tiendaen'] = $datosT[0]['nombre'];

    		$this->_view->datos = $tiendas;
    		$this->_view->idu = $id;
    		if ($success == 'success') {
					$this->_view->_error = Controller::getBoxAlert(
	                        'Solicitud enviada con exito', 
	                        '',
	                        'success');
	        		//$this->_view->render('remision', 'inventario', '','');

				}
      		$this->_view->render('remision', 'inventario', '',''); 		
    	}*/

    	

    	

    	function facturasdecompra($tienda){
    		$this->_view->setJs(array('js/facturas'));
			$valores = $this->_main->datostienda($tienda);
			$this->_view->g = $valores;
    		$this->_view->render('factura', 'inventario', '',''); 
    	}

    	function compraDirecta(){
    		if ($_SERVER['REQUEST_METHOD']=='POST') {
    			//Controller::varDump($_POST); 
	    		$conversion = Controller::formula($_POST['umcompra'],$_POST['cantix'],$_POST['cantcomprada'],$_POST['contneto'],$_POST['formulacomp']); 
	    		//print_r($conversion);//exit();
	    		$query = "SELECT existencia FROM `mercancia_has_unidad_negocio` 
	    					where mercancia_id = '".$_POST['idP']."' and unidad_negocio_id = '".$_POST['idT']."'";
	    		$existe = $this->_main->select($query);
	    		$incremento = $existe[0]['existencia']+$conversion;
	    		//print_r($incremento);exit();
	    		$query = "UPDATE `mercancia_has_unidad_negocio` SET `existencia`= $incremento 
	    		WHERE mercancia_id = '".$_POST['idP']."' and unidad_negocio_id = '".$_POST['idT']."'";
	    		$updated = $this->_main->modificar($query);

	    		$this->entradaOsalida($_POST['idP'],$_POST['idT'],$incremento, $_POST['unidad_medida_si'],$_POST['motivo'],$_POST['descripcion']); 
    			$accion='Compra directa'; 
                $this->_main->log($_POST['idP'],$_POST['idT'],$accion);
                $this->_view->redirect('inventario/evaluar/'.$_POST['idT']);

            }else{
                $this->_view->redirect('inventario/evaluar/'.$_POST['idT']);

            }
    	}

    	 function mercancia($nombre,$marca){
    		$name = str_replace("@"," ",$nombre);
    		$mark = str_replace("@"," ",$marca);
    		$query = "SELECT mercancia.id, contenido_neto, unidad_medida.abreviatura as US, um.abreviatura as UP, um2.abreviatura as UC, unidad_medida_sistema_id as idUS, unidad_medida_consumo_id as idUP, unidad_medida_compra_id as idUC from mercancia
    		inner join unidad_medida on unidad_medida_sistema_id = unidad_medida.id
    		inner join unidad_medida as um on um.id = unidad_medida_consumo_id
    		left join unidad_medida as um2 on um2.id = unidad_medida_compra_id
    		where mercancia.nombre = '".$nombre."' and mercancia.marca like '%".$marca."%' group by US,UP,UC";
    		$conte = $this->_main->select($query);
    		echo json_encode($conte);

    	}

    	 function autocompletarp(){
    		//$query = "SELECT distinct id,nombre as label, nombre as value from mercancia group by nombre";
    		$query = "SELECT distinct id, nombre as value from mercancia group by nombre";
    		$data = $this->_main->select($query);
    		echo json_encode($data);
    	}

    	 function autocompletarm($name){
    		$condicion = str_replace("@"," ",$name);
    		//echo $condicion;exit();
    		$query = "SELECT distinct id,marca as label, marca as value from mercancia where mercancia.nombre ='".$condicion."' group by marca";
    		$query = "SELECT distinct id, marca as value from mercancia where mercancia.nombre like '%".$condicion."%' group by marca";
    		$data = $this->_main->select($query);
    		echo json_encode($data);
    	}

    	/*function insertRequisicion(){
    		$query = "SELECT count(id) as cant from remision";
    		$cont = $this->_main->select($query);
    		$num = date('ynj');
    		$num_remi = $num.$cont[0]['cant']+1;
    		$mystring = $_POST['cantidadR'];
				$findme   = ',';
				$pos = strpos($mystring, $findme);
				if ($pos != false) {
					$p1 = str_replace(".","",$_POST['cantidadR']);
               		$cantidadr = str_replace(",",".",$p1);
				}else{
					$cantidadr = $_POST['precio_unitario'];
				}
    		$fecha = date('Y-m-d');
			$hora = date('g:i:s a');
			$idUsuario = Session::get('idUsuario');
			#echo $fecha.' '.$hora;exit(); 
			if ($_SERVER['REQUEST_METHOD']=='POST') {
				//Controller::varDump($_POST);exit();
				$query = "INSERT INTO remision (`num_remision`, `fecha`, `hora`, `descripcion`, `cantidad`, `unidad_medida_id`, `unidad_negocio_id`, `usuario_id`, `mercancia_id`) VALUES ('".$num_remi."','".$fecha."','".$hora."','".$_POST['descripcion']."','".$cantidadr."','".$_POST['unidades']."','".$_POST['tiendae']."',$idUsuario,'".$_POST['mercancia_id']."');";
				$idr = $this->_main->insertar($query);
				$query = "INSERT INTO notificacion_has_remision (`remision_id`, `unidad_negocio_id`, `status_id`) VALUES ($idr,'".$_POST['tiendar']."','".$_POST['status_id']."')";
				$idn =$this->_main->insertar($query);
				$this->_view->redirect('inventario/remisionM/'.$_POST['tiendae'].'/success');

			}


    	}*/


    	/*public function conversionExistencia($idP, $idT){
    		$query = "SELECT mercancia.id as 'idP', mercancia.codigo, mercancia.codigo_anterior, mercancia.nombre as 'producto', mercancia.marca, mercancia.contenido_neto, mercancia.formula_c, mercancia.formula_p, mercancia.formula_s, mercancia.cantidad_presentacion,  mc.existencia, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.id as 'idf', ref.referencia as 'familia', mc.status FROM mercancia 
            inner join mercancia_has_unidad_negocio as mc on mc.mercancia_id = mercancia.id 
            inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
            inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
            left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
            inner join referencia as ref on ref.id = mercancia.familia_id 
            WHERE mercancia.id = $idP and mc.unidad_negocio_id = $idT order by ref.referencia ASC";
            $producto = $this->_main->select($query);
            $data = Controller::conversion($producto);
            echo json_encode($data);
    	}*/

    	function success($tipo){
    		if ($_SERVER['REQUEST_METHOD']=='POST') {
    			Controller::varDump($_POST);exit();
    			$query = "UPDATE notificacion_has_remision SET 
					status_id='".$_POST['newstatus']."'
					WHERE remision_id = '".$_POST['idremision']."' and unidad_negocio_id = '".$_POST['idtiendasol']."' and status_id = '".$_POST['statusid']."'";
				$idnotif = $this->_main->modificar($query);
				$query = "INSERT INTO notificacion_has_remision (`remision_id`, `unidad_negocio_id`, `status_id`) VALUES ('".$_POST['idremision']."','".$_POST['idtiendasol']."','".$_POST['statusenvio']."')";
				$idn =$this->_main->insertar($query);

				//$update_existencia = 



    			switch ($tipo) {
			case 'ended':
			$this->_view->_error = Controller::getBoxAlert(
	                        'Pedido Confirmado, puede verificar los datos del pedido en su correo.', 
	                        'De igual manera en breves instantes recibira nuestra llamada para confirmar el envio, Gracias.',
	                        'success');
	        $this->_view->render('index'); 
				break;
			case 'end':
				$this->_view->_error = Controller::getBoxAlert(
	                        'El pedido ha cambiado de status ya no aparecerá como notificacion.', 
	                        '',
	                        'success');
	        $this->_view->render('index'); 
				break;
			case 'error':
				$this->_view->_error = Controller::getBoxAlert(
	                        'Error con la confirmacion del pedido.', 
	                        'Por favor realice la confirmacion nuevamente y disculpe los inconvenientes, Gracias.',
	                        'danger');
	        $this->_view->render('index'); 
				break;
			case 'error2':
				$this->_view->_error = Controller::getBoxAlert(
	                        'Error al finalizar con el pedido, por favor intente nuevamente.', 
	                        '',
	                        'danger');
	        	$this->_view->render('index'); 
				break;

			case 'aftersent':
				$this->_view->_error = Controller::getBoxAlert(
	                        'Su mensaje fue enviado con exito.', 
	                        ' gracias por preferirnos',
	                        'success');
	        	$this->_view->render('index'); 
				break;
			case 'checkout':
				$this->_view->_check = Controller::checkeo();
	        	$this->_view->render('index'); 
				break;
			default:
				$this->_view->render('index');
				break;
		}

    		}

    		

    	}

    	 function selectProveedor($name=false){
    		$nombre=str_replace ( ':' , ' ' , $name);
    		if ($nombre != false) {
    			$query = "SELECT id from proveedor where nombre like '%".$nombre."%'";
    		}else{
    			$query = "SELECT distinct id,nombre as label, nombre as value from proveedor group by nombre";
    		}
    		$data = $this->_main->select($query);
    		echo json_encode($data);
    	}


    	function carrito($name,$codigo,$precio){
    		$nombre=str_replace ( ':' , ' ' , $name);
    		if (isset($_SESSION['carrito'])) {
    			$arreglo=$_SESSION['carrito'];
    			$encontro=false; 
    			//var_dump($arreglo); exit();
    			for ($i=0; $i < count($arreglo); $i++) { 
    				if ($arreglo[$i]['nombre'] == $nombre) {
    					$encontro = true;
    				}
    			}
    			if($encontro == true){
    					$_SESSION['carrito']=$arreglo;
    					echo json_encode($_SESSION['carrito']);
    				}else{
    					$datoNuevo = array('nombre' => $nombre,
    								 'codigo' => $codigo,
    								 'precio' => $precio
    								 );
    					array_push($arreglo, $datoNuevo);
    					$_SESSION['carrito']=$arreglo;
    					echo json_encode($_SESSION['carrito']);
    				}

    		}else{
    			if (isset($nombre)) {
    				$arreglo[] = array('nombre' => $nombre,
    								 'codigo' => $codigo,
    								 'precio' => $precio
    								 );

    				
    				$_SESSION['carrito']=$arreglo;
    				echo json_encode($_SESSION['carrito']);
    			}
    		}
    	}

    	function deleteElementoCarrito($indice){
    		if ($indice == 'cero') {
    			$indice = 0;
    		}
    		$j=0;
    		$arreglo=$_SESSION['carrito']; #print_r($arreglo); exit();
    		for ($i=0; $i < count($arreglo); $i++) { 
    			if ($indice == $i) {

    			}else{
    				$nuevo[$j]=array('nombre' => $arreglo[$i]['nombre'],
    								 'codigo' => $arreglo[$i]['codigo'],
    								 'precio' => $arreglo[$i]['precio']
    								 );
    				$j++;
    			}
    		}
    		if (isset($nuevo)) {
    			$_SESSION['carrito']=$nuevo;
    			echo json_encode($_SESSION['carrito']);
    		}else{
    			$result=false;
    			echo json_encode($result);
    		}
    		
    	}

    	function codigoP($familia){
            $query = "SELECT id, codigo FROM `mercancia` WHERE familia_id = $familia ORDER by id desc LIMIT 1";
            $data = $this->_main->select($query);
            $valornum = intval(preg_replace('/[^0-9]+/', '', $data[0]['codigo']), 10);
            $valorletra = ereg_replace("[^A-Za-z]", "", $data[0]['codigo']);
            $resultado = $valornum+1;
            $codigo = $valorletra.$resultado;
            echo json_encode($codigo);
        }

    	function indexK($id){
    		$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/kardex'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    
    		$query = "SELECT unidad_negocio.id as idU, unidad_negocio.nombre as udn, modelo.nombre as modelo, empresa_id From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $id";
    		$mo = $this->_main->select($query);
    		$this->_view->model = $mo;
    		$this->_view->render('kardex', 'inventario', '',''); 	
    	}

    	function consultarkardex($fechaini,$fechafin,$tipom,$motivo,$idU,$prod){
    		//echo $idU."<br><br>";
    		$query = "SELECT empresa_id From unidad_negocio where unidad_negocio.id = $idU";
    		$empresa = $this->_main->select($query);
    		//print_r($empresa);
    		if (!is_null($empresa[0][0])) {
    			 $cadena = "and kardex.unidad_negocio_id = ".$idU;
    		}else{
    			 $cadena = "and unidad_negocio.empresa_id = ".$idU." or unidad_negocio.id = ".$idU."";
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
    		
    		$query="SELECT DISTINCT fecha, DATE_FORMAT(hora, '%r') as hora, format(kardex.cantidad,4,'de_DE') as cantidad, kardex.descripcion, tipo_movimiento_id as idtm, kardex.mercancia_id as idmer, usuario_id as idUs, unidad_medida_id as idum, motivo_id as idmot, referencia.referencia as tipomov, mercancia.codigo, CONCAT(mercancia.nombre, ' ', mercancia.marca) As mercancia, CONCAT(usuario.nombre, ' ', usuario.apellido) As Nombre, unidad_medida.unidad, ref.referencia as motivo, ref1.referencia as familia, unidad_negocio.id as idt, lower(unidad_negocio.nombre) as tienda, kardex.existencia, format(kardex.existencia,4,'de_DE') as stock, unidad_medida.abreviatura
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

    	function carroCompra($id, $operador=false, $idt, $cant,$cantx,$idprov,$unidadc,$um,$tiendar=false,$precioOC=false){

    	$query="SELECT mercancia.id as 'idP', mercancia.codigo, mercancia.codigo_anterior, mercancia.nombre as 'producto', mercancia.marca, mercancia.contenido_neto, mercancia.formula_c, mercancia.formula_p, mercancia.formula_s, mercancia.cantidad_presentacion,  mc.existencia, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.id as 'idf', ref.referencia as 'familia', mc.status FROM `mercancia` 
						inner join mercancia_has_unidad_negocio as mc on mc.mercancia_id = mercancia.id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
						inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
						left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
						inner join referencia as ref on ref.id = mercancia.familia_id 
						WHERE mercancia.id = $id and mc.unidad_negocio_id = $idt order by ref.referencia ASC";
    	$producto = $this->_main->select($query);
    	if ($precioOC != 'false') {
    		$p = $precioOC;
    	}else{
    		$p = $producto[0]['precio_unitario'];
    	}
    	if ($idprov != 'false') {
    		$datosprov = $this->datosprov($idprov);
    		$datosprov[0]['precio'] = $p;
    		$datosr[0]['nombre'] = false;
    		$datosr[0]['id'] = false;
    		$datosr[0]['tipo'] = 1;
    	}else if ($tiendar != 'false') {
    		$query="SELECT unidad_negocio.id as idudn, nombre FROM unidad_negocio 
					where unidad_negocio.id = $tiendar";
					$emp = $this->_main->select($query);
    		$datosprov[0]['nombre'] = $emp[0]['nombre'];
    		$datosprov[0]['id'] = false;
    		$datosprov[0]['precio'] = $p;
    		$datosr[0]['nombre'] = $emp[0]['nombre'];
    		$datosr[0]['id'] = $emp[0]['idudn'];
    		$datosr[0]['tipo'] = 2;
    	}else{
    		$query="SELECT id as idempresa, nombre as nombreempresa FROM unidad_negocio 
					where unidad_negocio.id = $idt";
					$emp = $this->_main->select($query);
    		$datosprov[0]['nombre'] = $emp[0]['nombreempresa'];
    		$datosprov[0]['id'] = false;
    		$datosprov[0]['precio'] = $p;
    		$datosr[0]['nombre'] = false;
    		$datosr[0]['id'] = false;
    		$datosr[0]['tipo'] = 3;
    	}
    if(isset($_SESSION['carrito1'])){
      if(isset($id)){
        $arreglo1=$_SESSION['carrito1'];
        $encontro=false;
        $numero=0;
        for($i=0;$i<count($arreglo1);$i++){
          if($arreglo1[$i]['id']==$id){
            $encontro=true;
            $numero=$i;
            
          }
          
        }
        if($encontro==true){
          switch ($operador) {
            case '1':
               	$arreglo1[$numero]['id']= $producto[0]['idP'];
               	$arreglo1[$numero]['nombre']= $producto[0]['producto'];
                $arreglo1[$numero]['precio']= $datosprov[0]['precio'];
                $arreglo1[$numero]['cantidad']=$cant;
                $arreglo1[$numero]['cant']=$cantx;
                $arreglo1[$numero]['proveedor']=$datosprov[0]['nombre'];
                $arreglo1[$numero]['idproveedor']=$datosprov[0]['id'];
                $arreglo1[$numero]['unidadc']=$unidadc;
                $arreglo1[$numero]['idumc']=$um;
                $arreglo1[$numero]['tiendar']=$datosr[0]['nombre'];
                $arreglo1[$numero]['idudn']=$datosr[0]['id'];
                $arreglo1[$numero]['tipo']=$datosr[0]['tipo'];
                
                $_SESSION['carrito1']=$arreglo1;    
            break;
            
            default:
                $arreglo1[$numero]['id']= $producto[0]['idP'];
                $arreglo1[$numero]['nombre']= $producto[0]['producto'];
                $arreglo1[$numero]['precio']= $datosprov[0]['precio'];
                $arreglo1[$numero]['cantidad']=$cant;
                $arreglo1[$numero]['cant']=$cantx;
                $arreglo1[$numero]['proveedor']=$datosprov[0]['nombre'];
                $arreglo1[$numero]['idproveedor']=$datosprov[0]['id'];
                $arreglo1[$numero]['unidadc']=$unidadc;
                $arreglo1[$numero]['idumc']=$um;
                $arreglo1[$numero]['tiendar']=$datosr[0]['nombre'];
                $arreglo1[$numero]['idudn']=$datosr[0]['id'];
                $arreglo1[$numero]['tipo']=$datosr[0]['tipo'];

                $_SESSION['carrito1']=$arreglo1;
            break;
          }
          
        }else{
          $_SESSION['carrito1']=$this->pedido($producto,'nuevo',$cant,$cantx,$datosprov,$unidadc,$um,$datosr);
        }
    }
  }else{
    
    $_SESSION['carrito1']=$this->pedido($producto,'primero',$cant,$cantx,$datosprov,$unidadc,$um,$datosr);

  } //print_r($_SESSION['carrito1']); exit();
    $totales = $this->conversionprecio($_SESSION['carrito1'],$cant,$cantx);
    $_SESSION['totalPagar']=$totales;
    $data = array($_SESSION['carrito1'], $_SESSION['totalPagar']); #print_r($data); exit();
    echo json_encode($data);
  }

    function pedido($producto, $opcion,$cant,$cantx,$datosprov,$unidadc,$um,$datosr){
      $id=Session::get('idU'); 
      switch ($opcion) {
        case 'primero':
        $arreglo1[] = 0;
              $arreglo1[]=array('id'=>$producto[0]['idP'],
              	  'nombre' => $producto[0]['producto'],
              	  'marca' => $producto[0]['marca'],
                  'codigo'=>$producto[0]['codigo'],
                  'precio'=>$datosprov[0]['precio'],
                  'cantidad'=>$cant,
                  'cant'=>$cantx,
                  'proveedor'=>$datosprov[0]['nombre'],
                  'idproveedor'=>$datosprov[0]['id'],
                  'unidadc'=>$unidadc,
                  'idumc'=>$um,
                  'tiendar'=>$datosr[0]['nombre'],
                  'idudn'=>$datosr[0]['id'],
                  'tipo'=>$datosr[0]['tipo']
                  );
              //$_SESSION['carrito1']=$arreglo1;
        break;
        case 'nuevo':
            $arreglo1=$_SESSION['carrito1'];
              $datosNuevos=array('id'=>$producto[0]['idP'],
              	  'nombre' => $producto[0]['producto'],
              	  'marca' => $producto[0]['marca'],
                  'codigo'=>$producto[0]['codigo'],
                  'precio'=>$datosprov[0]['precio'],
                  'cantidad'=>$cant,
              	  'cant'=>$cantx,
              	  'proveedor'=>$datosprov[0]['nombre'],
                  'idproveedor'=>$datosprov[0]['id'],
                  'unidadc'=>$unidadc,
                  'idumc'=>$um,
                  'tiendar'=>$datosr[0]['nombre'],
                  'idudn'=>$datosr[0]['id'],
                  'tipo'=>$datosr[0]['tipo']
              );
              array_push($arreglo1, $datosNuevos);
             // $_SESSION['carrito1']=$arreglo1; 
          break;
      }
      return $arreglo1;
    }

    function borrarElementoCarrito($indice){
        if ($indice == 'cero') {
          $indice = 0;
        }
        $j=0;
        $arreglo1=$_SESSION['carrito1']; #print_r($arreglo1); exit();
        for ($i=0; $i < count($arreglo1); $i++) { 
          if ($indice == $arreglo1[$i]['id']) {

          }else{
            $nuevo[$j]=array('id' => $arreglo1[$i]['id'],
                     'nombre' => $arreglo1[$i]['nombre'],
                     'marca' => $arreglo1[$i]['marca'],
                     'codigo' => $arreglo1[$i]['codigo'],
                     'precio' => $arreglo1[$i]['precio'],
                     'cantidad' => $arreglo1[$i]['cantidad'],
                     'cant'=>$arreglo1[$i]['cant'],
                     'proveedor'=>$arreglo1[$i]['proveedor'],
                  	 'idproveedor'=>$arreglo1[$i]['idproveedor'],
                  	 'unidadc'=>$arreglo1[$i]['unidadc'],
                  	 'idumc'=>$arreglo1[$i]['idumc'],
                  	 'tiendar'=>$arreglo1[$i]['tiendar'],
                  	 'idudn'=>$arreglo1[$i]['idudn'],
                  	 'tipo'=>$arreglo1[$i]['tipo']
                     );
            $j++;
          }
        }
        if (isset($nuevo)) {
          $_SESSION['carrito1']=$nuevo;
          $totales = $this->conversionprecio($_SESSION['carrito1']);
          $_SESSION['totalPagar']=$totales;
        $data = array($_SESSION['carrito1'], $_SESSION['totalPagar']); #print_r($data); exit();
        echo json_encode($data);
        }else{
        	Session::destroy('totalPagar');
        	Session::destroy('carrito1');
          	$result=false;
          	echo json_encode($result);
        }
        
      }


      function conversionprecio($producto,$cantidad=false,$cantidadx=false){
			/*
			Cantidad es la cantidad comprada.
			cantidadx es la cantidad que contiene la unidad de compra de la unidad de presentacion,
			x ejemplo 1 bulto que contiene 24 unidades de 1 kg c/u.
			*/
			//print_r($producto);
			//echo $producto[1]['precio'];
			//echo  count($producto); exit();
			$preciofinal = 0;
			for ($i=0; $i < count($producto); $i++){ 
				$preciot[$i] = ($producto[$i]['cantidad'] * $producto[$i]['cant']) * $producto[$i]['precio'];
				$preciofinal = $preciofinal + $preciot[$i];
				$total = number_format($preciofinal,4,",",".");
				//echo $total;
			} 
			return $total;//exit();
		}

      function cancelarPedido(){
      	Session::destroy('totalPagar');
        Session::destroy('carrito1');
        $data=true;
        echo json_encode($data);
      }

      public function selectprov($idm){
      	$query ="SELECT * FROM proveedor 
		inner join proveedor_has_mercancia on proveedor.id = proveedor_id
		WHERE mercancia_id = $idm";
		$data=$this->_main->select($query);
        echo json_encode($data);
      }

      public function datosprov($idprov){
      	$query ="SELECT proveedor.id, nombre, rif, razon_social, correo, proveedor.status, ubicacion_id, empresa_id, proveedor_has_mercancia.id as idphm, mercancia_id, proveedor_id, codigo_x_proveedor,precio,proveedor_has_mercancia.status as stphm FROM proveedor 
		left join proveedor_has_mercancia on proveedor.id = proveedor_id
		WHERE proveedor_id = $idprov";
		$data=$this->_main->select($query);
        return $data;
      }

      

    public function cargaringredientes($idt){

				//Controller::varDump($_POST);exit();
				$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, unidad_medida_compra_id as umcid, unidad_medida_consumo_id as umpid, unidad_medida_sistema_id as umsid, umc.abreviatura as abumc, ump.abreviatura as abump, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) As ingrediente, mercancia.precio_unitario as precioU, mudn.existencia, mudn.stock_min, mudn.stock_max, format(existencia,4,'de_DE') as stockt, format(stock_min,4,'de_DE') as stmin, format(stock_max,4,'de_DE') as stmax, referencia.referencia as familia   FROM `mercancia`
			inner join referencia on referencia.id = familia_id
			left join unidad_medida as umc on umc.id = mercancia.unidad_medida_compra_id
            inner join unidad_medida as ump on ump.id = mercancia.unidad_medida_consumo_id
            inner join unidad_medida as ums on ums.id = mercancia.unidad_medida_sistema_id
            inner join mercancia_has_unidad_negocio as mudn on mudn.mercancia_id = mercancia.id
            where mudn.unidad_negocio_id = $idt";
			$data = $this->_main->select($query);

    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}

    function asignacionProducto($id){
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
    		$this->_view->setJs(array('js/inventario'));	
    		$query = "SELECT unidad_negocio.id as 'idU', unidad_negocio.nombre, modelo.id as 'idM', modelo.nombre as 'modelo', empresa_id 
    		FROM `unidad_negocio` 
    		INNER JOIN modelo_has_submodelo on modelo_has_submodelo.id = modelo_has_submodelo_id 
    		INNER JOIN modelo on modelo.id = modelo_has_submodelo.modelo_id 
    		WHERE unidad_negocio.empresa_id = $id"; 
			$data = $this->_main->select($query);
			$modelo = $this->_main->simplificarDatos($data,'modelo'); #print_r($modelo);
			$idM = $this->_main->simplificarDatos($data,'idM'); #print_r($idM);
			$this->_view->modelo=$modelo;
			$this->_view->datos=$data;
			$this->_view->idm=$idM;
			$this->_view->render('asignacion', 'inventario', '','');
    	}

    public function ingredientes($id1,$id2){

    	/*funcion para cargar los ingredientes que corresponden a la empresa pero unicamente los que no tiene la tienda seleccionada y viceversa - $id1 = tienda, $id2 = empresa*/
    	$query = "SELECT mercancia.id as idpro, codigo, nombre as producto, marca, CONCAT(nombre,' ',marca) as mercancia, referencia.referencia as clasificacion FROM `mercancia`
		inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
		inner join referencia on referencia.id = familia_id
		where unidad_negocio_id = $id2 and mercancia.id not in(SELECT id 
		FROM mercancia 
		inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id 
		where unidad_negocio_id = $id1)";
		$data = $this->_main->select($query);
		$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function ingredientest($idt){
    	/*funcion para cargar los ingredientes que tiene la tienda seleccionada*/
    	$query = "SELECT mercancia.id as idpro, codigo, nombre as product, marca, CONCAT(mercancia.nombre,' ',mercancia.marca) as mercancia, referencia.referencia as clasificacion FROM `mercancia`
		inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
		inner join referencia on referencia.id = familia_id
		where unidad_negocio_id = $idt ORDER by mercancia.id desc";
		$data = $this->_main->select($query);
    	//print_r($data);exit();
    	$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function pventa($id1,$id2){
    	/*funcion para cargar los productos que corresponden a la empresa pero unicamente los que no tiene la tienda seleccionada y viceversa*/
    	$query = "SELECT producto.id as idpro, producto.codigo, producto.nombre as product, grupo.nombre as clasificacion FROM `producto`
		inner join producto_has_unidad_negocio on producto_id = producto.id
		inner join grupo on grupo_id = grupo.id
		where unidad_negocio_id = $id2 and producto.id not in(SELECT id 
		FROM producto 
		inner join producto_has_unidad_negocio on producto_id = producto.id 
		where unidad_negocio_id = $id1)";
		$data = $this->_main->select($query);
		$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function pventat($idt){
    	/*funcion para cargar los productos que tiene la tienda seleccionada*/
    	$query = "SELECT producto.id as idpro, producto.codigo, producto.nombre as product, grupo.nombre as clasificacion FROM `producto`
		inner join producto_has_unidad_negocio on producto_id = producto.id
		inner join grupo on grupo_id = grupo.id
		where unidad_negocio_id = $idt";
		$data = $this->_main->select($query);
    	//print_r($data);exit();
    	$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function pros($idp){
    	$query = "SELECT id, nombre from producto where producto.id = $idp";
    	$data = $this->_main->select($query);
    	//print_r($data);exit();
    	echo json_encode($data);
    }

    public function nombrepro($idpro,$idt){
    	$query = "SELECT nombre as producto from producto 
    	inner join producto_has_unidad_negocio on producto_id = producto.id
    	where  producto_id = '".$idpro."' and unidad_negocio_id = '".$idt."'";
    	$data = $this->_main->select($query);
    	//print_r($data);exit();
    	echo json_encode($data);
    }

    public function nombrepro2($idpro,$idm){
    	$query = "SELECT nombre as producto from producto 
    	inner join producto_has_modelo on producto_id = producto.id
    	where  producto_id = '".$idpro."' and modelo_id = '".$idm."'";
    	$data = $this->_main->select($query);
    	//print_r($data);exit();
    	echo json_encode($data);
    }



    public function insertasignacion(){
    	if ($_SERVER['REQUEST_METHOD']=='POST') {
    		//Controller::varDump($_POST);exit();
    		foreach($_POST['mercancia'] as $selected){

		    		$idti = $_POST['idti'];
		    		$query = "DELETE FROM mercancia_has_unidad_negocio where mercancia_id = '".$selected."' and unidad_negocio_id = '".$idti."'";
		    		$borrado = $this->_main->eliminar($query); 
		            $query = "INSERT INTO `mercancia_has_unidad_negocio`(`mercancia_id`, `unidad_negocio_id`, `status`) VALUES  
		            ('".$selected."','".$idti."',0)"; 
		            $mhu = $this->_main->insertar($query);   		
		           
		    }
    	}
    	echo json_encode($mhu);
    }

    public function insertasignacionp(){
    	if ($_SERVER['REQUEST_METHOD']=='POST') {
    		//Controller::varDump($_POST);exit();
    		foreach($_POST['producto'] as $selected){

		    		$idti = $_POST['idti'];
		    		$query = "DELETE FROM producto_has_unidad_negocio where producto_id = '".$selected."' and unidad_negocio_id = '".$idti."'";
		    		$borrado = $this->_main->eliminar($query); 
		            $query = "INSERT INTO `producto_has_unidad_negocio`(`producto_id`, `unidad_negocio_id`) VALUES  
		            ('".$selected."','".$idti."')"; 
		            $mhu = $this->_main->insertar($query);   		
		           
		    }
    	}
    	echo json_encode($mhu);
    }

    public function borrarasignacion($idpro,$id,$tipo){
    	if ($tipo == 1) {
			$query = "SELECT unidad_negocio.id as idt, unidad_negocio.nombre from unidad_negocio 
		    		inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
		    		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
		    		where modelo_id = '".$id."'";
		    $tiendas = $this->_main->select($query);
		    for ($i=0; $i <count($tiendas) ; $i++) { 
    			$query = "SELECT * FROM mercancia_has_unidad_negocio where mercancia_id = '".$idpro."' and unidad_negocio_id = '".$tiendas[$i]['idt']."'";
    			$asignado[$i] = $this->_main->select($query);
	    		if (!empty($asignado[$i])) {
	    			$query = "DELETE FROM `mercancia_has_unidad_negocio` where mercancia_id = '".$idpro."' and unidad_negocio_id = '".$tiendas[$i]['idt']."'"; 
		            $mhu = $this->_main->insertar($query);
	    		}
		    }
		    $query = "DELETE FROM mercancia_has_modelo where mercancia_id = '".$idpro."' and modelo_id = '".$id."'";
			$borrado = $this->_main->eliminar($query);
    	}else{
    		$query = "DELETE FROM mercancia_has_unidad_negocio where mercancia_id = '".$idpro."' and unidad_negocio_id = '".$id."'";
			$borrado = $this->_main->eliminar($query); 
    	}
		 		
		echo json_encode($borrado);
    }

    public function borrarasignacionp($idpro,$id,$tipo){
    	if ($tipo == 1) {
    		$query = "SELECT unidad_negocio.id as idt, unidad_negocio.nombre from unidad_negocio 
		    		inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
		    		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
		    		where modelo_id = '".$id."'";
		    $tiendas = $this->_main->select($query);
		    for ($i=0; $i <count($tiendas) ; $i++) { 
    			$query = "SELECT * FROM producto_has_unidad_negocio where producto_id = '".$idpro."' and unidad_negocio_id = '".$tiendas[$i]['idt']."'";
    			$asignado[$i] = $this->_main->select($query);
	    		if (!empty($asignado[$i])) {
	    			$query = "DELETE FROM `producto_has_unidad_negocio` where producto_id = '".$idpro."' and unidad_negocio_id = '".$tiendas[$i]['idt']."'"; 
		            $mhu = $this->_main->insertar($query);
	    		}
		    }
		    $query = "DELETE FROM producto_has_modelo where producto_id = '".$idpro."' and modelo_id = '".$id."'";
			$borrado = $this->_main->eliminar($query);
    	}else{
			$query = "DELETE FROM producto_has_unidad_negocio where producto_id = '".$idpro."' and unidad_negocio_id = '".$id."'";
			$borrado = $this->_main->eliminar($query);  
		}		
		echo json_encode($borrado);
    }

    function cargarinventario($id){
    	$this->_view->setJs(array('js/jquery-1.12.4.min'));
		$this->_view->setJs(array('js/inventario'));
		$this->_view->setJs(array('js/cargainventario'));
		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
	    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
	    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
	    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
	    $this->_view->setJs(array('datatable/js/tabla'));
    	$datos = $this->_main->datostienda($id);
    	$this->_view->mercancia = $datos;
    	$this->_view->render('cargainventario', 'inventario', '','');
    }

	public function validarfechas($tipo,$fecha){
        /*$ obtener ultimo dia del mes de la fecha que le pase como parametro*/
        switch ($tipo) {
            case '164':
                $fechaminima = $fecha;
                $fechamaxima = $fecha;
                break;

            case '165':
                $fechaminima = $fecha;
                $fechamaxima = strtotime ( '+9 day' , strtotime ( $fecha ) ) ;
                $fechamaxima = date ( 'Y-m-d' , $fechamaxima );
                break;
            
            default:
            	$fi = new DateTime($fecha);
				$fi->modify('first day of this month');
            	$ff = new DateTime($fecha);
				$ff->modify('last day of this month');
				//echo $fi->format('Y-m-d');
                $fechaminima = $fi->format('Y-m-d');
                $fechamaxima = $ff->format('Y-m-d');
            break;
        }
        $valores = array('fechai' => $fechaminima, 'fechaf' =>$fechamaxima);

        echo json_encode($valores);
    }

    public function validarCarga($idtipo,$fecha1,$fecha2,$idt){
    	$query = "SELECT * From inventario where fecha_inicial = '".$fecha1."' and fecha_final = '".$fecha2."' and tipo_inventario = $idtipo and unidad_negocio_id = $idt";
    	$data = $this->_main->select($query);
    	echo json_encode($data);
    }

 	public function insertIventario($idtipo,$fecha1,$fecha2,$idt){
 		$datost = $this->_main->datostienda($idt);
 		for ($i=0; $i <count($datost) ; $i++) {
 			if ($datost[$i]['tipo_inventario_id'] == $idtipo) {
 				$query = "INSERT INTO `inventario`(`mercancia_id`, `unidad_negocio_id`, `existencia_teorica`, `existencia_real`, `diferencia`, `unidad_medida_id`, `fecha_inicial`, `fecha_final`, `tipo_inventario`, `comentario`, `procesado`) VALUES ('".$datost[$i]['idP']."',$idt,'".$datost[$i]['existencia']."',NULL,'-".$datost[$i]['existencia']."','".$datost[$i]['idUMS']."','".$fecha1."','".$fecha2."','".$idtipo."',NULL,0)";
 				$idinv = $this->_main->insertar($query);
 			}else if ($idtipo == 171 or $idtipo == 172) {
 				$query = "INSERT INTO `inventario`(`mercancia_id`, `unidad_negocio_id`, `existencia_teorica`, `existencia_real`, `diferencia`, `unidad_medida_id`, `fecha_inicial`, `fecha_final`, `tipo_inventario`, `comentario`, `procesado`) VALUES ('".$datost[$i]['idP']."',$idt,'".$datost[$i]['existencia']."',NULL,'-".$datost[$i]['existencia']."','".$datost[$i]['idUMS']."','".$fecha1."','".$fecha2."','".$idtipo."',NULL,0)";
 				$idinv = $this->_main->insertar($query);
 			}
 			
 		}
 		echo json_encode($datost);
 	}

    public function mostrarDatos($idtipo,$fecha1,$fecha2,$idt){
    	$query = "SELECT inventario.id as idinv, mercancia.id as idm, inventario.unidad_negocio_id, existencia_teorica, format(existencia_teorica,4,'de_DE') as stockt, existencia_real, format(existencia_real,4,'de_DE') as stockr, diferencia, format(diferencia,4,'de_DE') as dif, unidad_medida_id as idum, fecha_inicial, fecha_final, inventario.tipo_inventario, comentario, procesado, mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) as mercancia, mercancia.contenido_neto, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia'
	    	FROM inventario
	    	inner join mercancia on mercancia.id = inventario.mercancia_id 
			inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
			inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
			left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
			inner join referencia as ref on ref.id = mercancia.familia_id 
	    	where fecha_inicial = '".$fecha1."' and fecha_final = '".$fecha2."' and tipo_inventario = $idtipo and unidad_negocio_id = $idt";
    	$data = $this->_main->select($query);
		$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function conversor($c1,$c2,$c3,$iduc,$idup,$idus,$idm){
    	$conversion = $this->_main->conversor($c1,$c2,$c3,$iduc,$idup,$idus,$idm);
    	echo json_encode($conversion);
    }

    public function actualizacion($existente,$fechain,$fechafi,$tipo,$idt,$idus,$comentario,$idm,$idinv){
    	$comment1 = str_replace("@"," ",$comentario);
    	$comment = str_replace("******",'NULL',$comment1);
    	$existencia = str_replace("*",0.0000,$existente);
    	$query = "SELECT existencia_teorica from inventario where inventario.id = $idinv";
    	$existente = $this->_main->select($query);
    	$diferencia = $existencia - $existente[0][0];
    	$query = "UPDATE `inventario` SET `existencia_real`='".$existencia."',`diferencia`='".$diferencia."',`comentario`='".$comment."' where inventario.id = $idinv";
    	$this->_main->modificar($query);
    	echo json_encode($diferencia);
    }

    public function validartodoscargados($f1,$f2,$tipo,$idt){
    	$query = "SELECT * FROM `inventario` WHERE fecha_inicial = '".$f1."' and fecha_final = '".$f2."' and tipo_inventario = $tipo and unidad_negocio_id = $idt";
    	$data = $this->_main->select($query);
    	echo json_encode($data);
    	
    }

    public function validarInventarioInicial($tienda){
    	$query = "SELECT * FROM `inventario` WHERE tipo_inventario = 171 and unidad_negocio_id = $tienda";
    	$data = $this->_main->select($query);
    	echo json_encode($data);
    }

    public function finCargaInv($f1,$f2,$tipo,$idt){
    	$query = "UPDATE `inventario` SET `procesado`=1 WHERE fecha_inicial = '".$f1."' and fecha_final = '".$f2."' and tipo_inventario = $tipo and unidad_negocio_id = $idt";
    	$this->_main->modificar($query);
    	if ($tipo == 172) {
    		$fecha1 = strtotime ( '+1 day' , strtotime ( $f2 ) ) ;
            $fecha1 = date ( 'Y-m-d' , $fecha1 );
            $fi = new DateTime($fecha1);
			$fi->modify('first day of this month');
        	$ff = new DateTime($fecha1);
			$ff->modify('last day of this month');
            $fechaminima = $fi->format('Y-m-d');
            $fechamaxima = $ff->format('Y-m-d');
    		$query = "SELECT * FROM inventario WHERE fecha_inicial = '".$f1."' and fecha_final = '".$f2."' and tipo_inventario = $tipo and unidad_negocio_id = $idt";
	    	$datos = $this->_main->select($query);
	    	for ($i=0; $i <count($datos); $i++) { 
	    		$accion = "Actualizado";
	    		$detalles = false;
	    		$this->_main->log($datos[$i]['mercancia_id'],$idt,$accion);
				$this->_main->kardex($datos[$i]['existencia_real'],174,131,$datos[$i]['mercancia_id'],$idt,$datos[$i]['unidad_medida_id'],$detalles);
				$this->_main->kardex($datos[$i]['existencia_real'],173,131,$datos[$i]['mercancia_id'],$idt,$datos[$i]['unidad_medida_id'],$detalles,$fechaminima);
	    		$query = "UPDATE `mercancia_has_unidad_negocio` SET `existencia`='".$datos[$i]['existencia_real']."' WHERE mercancia_id = '".$datos[$i]['mercancia_id']."' and unidad_negocio_id = $idt";
	    		$this->_main->modificar($query);
	    	}
	    	$inicial = $this->insertII($fechaminima,$fechamaxima,$idt,$datos);
    	}
    	if ($tipo == 171) {
            $fi = new DateTime($f1);
			$fi->modify('first day of this month');
        	$ff = new DateTime($f1);
			$ff->modify('last day of this month');
            $fechaminima = $fi->format('Y-m-d');
            $fechamaxima = $ff->format('Y-m-d');
    		$query = "SELECT * FROM inventario WHERE fecha_inicial = '".$f1."' and fecha_final = '".$f2."' and tipo_inventario = $tipo and unidad_negocio_id = $idt";
	    	$datos = $this->_main->select($query);
    		for ($i=0; $i <count($datos); $i++) { 
	    		$accion = "Actualizado";
	    		$detalles = false;
	    		$this->_main->log($datos[$i]['mercancia_id'],$idt,$accion);
				$k = $this->_main->kardex($datos[$i]['existencia_real'],173,131,$datos[$i]['mercancia_id'],$idt,$datos[$i]['unidad_medida_id'],$detalles,$fechaminima);
	    	}
    	}
    	
    	echo json_encode($idt);
    }

    public function insertII($fecha1,$fecha2,$idt,$datost){
 		for ($i=0; $i <count($datost) ; $i++) {
 				$query = "INSERT INTO `inventario`(`mercancia_id`, `unidad_negocio_id`, `existencia_teorica`, `existencia_real`, `diferencia`, `unidad_medida_id`, `fecha_inicial`, `fecha_final`, `tipo_inventario`, `comentario`, `procesado`) VALUES ('".$datost[$i]['id']."',$idt,'".$datost[$i]['existencia_real']."','".$datost[$i]['existencia_real']."',0.0000,'".$datost[$i]['unidad_medida_id']."','".$fecha1."','".$fecha2."',171,'".$datost[$i]['comentario']."',1)";
 				$idinv = $this->_main->insertar($query);
 			} 	
 		return $datost;
 	}

 	public function tomaInventario(){
 		//var_dump($_POST); exit();
		//Session::accessRole(array('Super usuario','Tecnico','Administrador'));
		$fecha1 = $_POST['fecha_ini'];
		$fecha2 = $_POST['fecha_fin'];
		$idtipo = $_POST['tipe'];
		$idt = $_POST['unidad_n'];
		if (isset($_POST['checkcero'])) {
			$filtro = true;
		}else{
			$filtro = false;
		}
		
		$date1 = date_create($fecha1);
		$date2 = date_create($fecha2);
		$reporte=$this->export($idtipo,$fecha1,$fecha2,$idt,$filtro);
		header("Content-Type: application/vnd.ms-excel");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("content-disposition: attachment;filename=Toma_inventario_".$reporte[0]['tipoInv']."_".date('d-m-Y_g-i').".xls");
		
		//print_r($reporte);

    	date_default_timezone_set('America/asuncion');
    	echo '<table style="background: #C3E8F8; border: solid 2px">
				<tbody>
					<tr>
						<td colspan="7" rowspan="2" style=" vertical-algin: center"><center><h2><b>Formato para la toma de inventario '.$reporte[0]['tipoInv'].'</b></h2></center></td>
					</tr>
				</tbody>
			</table>';
    	$dia = date ( 'd/m/Y');
    	$hour = date ( 'ga');
    	echo '<table style="background: #C3E8F8; border: solid 2px">
				<tbody>
					<tr>
						<td colspan="7"><b>Generado: '.$dia.' - '.$hour.'</b></td>
					</tr>
					<tr>
						<td colspan="7"><b>Rango Seleccionado: desde el ' .date_format($date1,"d/m/Y").' hasta el '.date_format($date2,"d/m/Y").'</b></td>
					</tr>
					<tr>
						<td colspan="7"><b>Tipo de inventario: '.$reporte[0]['tipoInv'].'</b></td>
					</tr>
				</tbody>
			</table>';
	            echo'<table style="border: solid 2px">
	            <tr>
			        <th style="font-size:12px; text-align: center; border: solid 1px">Codigo</th>
			        <th style="font-size:12px; text-align: center; border: solid 1px">Producto</th>
			        <th style="font-size:12px; text-align: center; border: solid 1px">Familia</th>
			        <th style="font-size:12px; text-align: center; border: solid 1px">Existencia teorica</th>
			        <th colspan="2" style="font-size:12px; text-align: center; border: solid 1px">Existencia real</th>
			        <th style="font-size:12px; text-align: center; border: solid 1px">Unidad de medida</th>
			    </tr>
	            <tbody>';
	            
	    for ($j=0; $j < count($reporte); $j++){
	    	if (is_null($reporte[$j]['stockr'])) {
	    		$str = '';
	    	}else{
	    		$str = $reporte[$j]['stockr'].' '.$reporte[$j]['abreviaturaS'];
	    	}
	    	           echo'<tr>
	                        <td style="text-align:left; border: solid thin">';
	                        echo $reporte[$j]['codigo'].'</td>';
	                        echo'<td style="text-align:center; border: solid thin">';
	                        echo $reporte[$j]['mercancia'].'</td>';
	                        echo '<td style="text-align:center; border: solid thin">';
	                        echo $reporte[$j]['familia'].'</td>';
	                        echo'<td style="text-align:center; border: solid thin">';
	                        echo $reporte[$j]['existencia_teorica'].' '.$reporte[$j]['abreviaturaS'].'</td>';
	                        if ($filtro == true) {
	                        	echo'<td colspan="2" style="text-align:left; border: solid thin"></td>';
	                        }else{
	                        	echo '<td colspan="2" style="text-align:left; border: solid thin">'.$str.'</td>';
	                        }
	                        echo'<td style="text-align:left; border: solid thin">';
	                        echo $reporte[$j]['abreviaturaS'].'</td>';    
	             
	    }   
	        echo'</tbody>
	        </table>';
	        
	        echo'<br></h4>';
	        

		
	}

 	public function export($idtipo,$fecha1,$fecha2,$idt,$filtro=false){
 		if ($filtro !=false) {
 			$condic = 'and existencia_real is null';
 		}else{
 			$condic = '';
 		}
    	$query = "SELECT inventario.id as idinv, mercancia.id as idm, inventario.unidad_negocio_id, existencia_teorica, format(existencia_teorica,4,'de_DE') as stockt, existencia_real, format(existencia_real,4,'de_DE') as stockr, diferencia, format(diferencia,4,'de_DE') as dif, unidad_medida_id as idum, fecha_inicial, fecha_final, inventario.tipo_inventario, comentario, procesado, mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) as mercancia, mercancia.contenido_neto, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia', ref2.referencia as tipoInv
	    	FROM inventario
	    	inner join mercancia on mercancia.id = inventario.mercancia_id 
			inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
			inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
			left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
			inner join referencia as ref on ref.id = mercancia.familia_id
			inner join referencia as ref2 on ref2.id = tipo_inventario
	    	where fecha_inicial = '".$fecha1."' and fecha_final = '".$fecha2."' and tipo_inventario = $idtipo and unidad_negocio_id = $idt $condic order by codigo asc";
    	$data = $this->_main->select($query);
		return $data;
    }

    public function consultamodelo($idmodelo){
    	$query = "SELECT mercancia.id as idpro, mercancia.codigo, mercancia.nombre as producto, mercancia.marca, CONCAT(mercancia.nombre,' ', mercancia.marca) as mercancia, mercancia_has_modelo.modelo_id as idmod, ref.referencia as clasificacion
    	FROM mercancia_has_modelo
    	inner join mercancia on mercancia.id = mercancia_id
    	inner join referencia as ref on ref.id = familia_id
    	where modelo_id = $idmodelo";
    	$data = $this->_main->select($query);
    	$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function consultamodelopv($idmodelo){
    	/*funcion para cargar los productos de venta que corresponden al modelo seleccionado*/
    	$query = "SELECT producto.id as idpro, producto.codigo, producto.nombre as product, grupo.nombre as clasificacion FROM `producto`
		inner join producto_has_modelo on producto_id = producto.id
		inner join grupo on grupo_id = grupo.id
		where modelo_id = $idmodelo";
		$data = $this->_main->select($query);
    	//print_r($data);exit();
    	$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function notinmodel($id1, $id2){
    	/*funcion para cargar los ingredientes que corresponden a la empresa pero unicamente los que no tiene el modelo seleccionado y viceversa - $id1 = modelo, $id2 = empresa*/
    	$query = "SELECT DISTINCT mercancia.id as idpro, codigo, nombre as producto, marca, CONCAT(nombre,' ',marca) as mercancia, referencia.referencia as clasificacion FROM `mercancia`
		inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
		inner join referencia on referencia.id = familia_id
		where unidad_negocio_id = $id2 and mercancia.id not in(SELECT mercancia_id 
		FROM mercancia_has_modelo 
		where modelo_id = $id1)";
		$data = $this->_main->select($query);
		$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function notinmodelpv($id1,$id2){
    	/*funcion para cargar los ingredientes que corresponden a la empresa pero unicamente los que no tiene la tienda seleccionada y viceversa*/
    	$query = "SELECT producto.id as idpro, producto.codigo, producto.nombre as product, grupo.nombre as clasificacion FROM `producto`
    	inner join grupo on grupo_id = grupo.id
		inner join producto_has_unidad_negocio on producto_id = producto.id
		where unidad_negocio_id = $id2 and producto.id not in(SELECT producto_id 
		FROM producto_has_modelo 
		where modelo_id = $id1)";
		$data = $this->_main->select($query);
		$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
    }

    public function asignacionxmodelo(){
    	if ($_SERVER['REQUEST_METHOD']=='POST') {
    		//Controller::varDump($_POST);exit();
    		foreach($_POST['mercancia'] as $selected){
		    		
		    		$idmodel = $_POST['idmodel'];
		    		$query = "SELECT * from mercancia_has_modelo where mercancia_id = '".$selected."' and modelo_id = '".$idmodel."'";
		    		$enmodelos = $this->_main->select($query);
		    		if (empty($enmodelos)) {
		    			$query = "INSERT INTO `mercancia_has_modelo`(`mercancia_id`, `modelo_id`) VALUES  
		            ('".$selected."','".$idmodel."')";
		            $mhm = $this->_main->insertar($query);
		    		}
		    		$query = "SELECT unidad_negocio.id as idt, unidad_negocio.nombre from unidad_negocio 
		    		inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
		    		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
		    		where modelo_id = '".$idmodel."'";
		    		$tiendas = $this->_main->select($query);
		    		
		    		for ($i=0; $i <count($tiendas) ; $i++) { 
		    			$query = "SELECT * FROM mercancia_has_unidad_negocio where mercancia_id = '".$selected."' and unidad_negocio_id = '".$tiendas[$i]['idt']."'";
		    			$asignado[$i] = $this->_main->select($query);
			    		if (empty($asignado[$i])) {
			    			$query = "INSERT INTO `mercancia_has_unidad_negocio`(`mercancia_id`, `unidad_negocio_id`, `status`) VALUES  
				            ('".$selected."','".$tiendas[$i]['idt']."',0)"; 
				            $mhu = $this->_main->insertar($query);
			    		}
		    		} 
		    }
    	}
    	echo json_encode($idmodel);
    }

    public function asignacionxmodelopv(){
    	if ($_SERVER['REQUEST_METHOD']=='POST') {
    		//Controller::varDump($_POST);exit();
    		foreach($_POST['producto'] as $selected){

		    		
		    		$idmodel = $_POST['idmodel'];
		    		$query = "SELECT * from producto_has_modelo where producto_id = '".$selected."' and modelo_id = '".$idmodel."'";
		    		$enmodelos = $this->_main->select($query);
		    		if (empty($enmodelos)) {
		    			$query = "INSERT INTO `producto_has_modelo`(`producto_id`, `modelo_id`) VALUES  
		            ('".$selected."','".$idmodel."')";
		            $phm = $this->_main->insertar($query);
		    		}
		    		$query = "SELECT unidad_negocio.id as idt, unidad_negocio.nombre from unidad_negocio 
		    		inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
		    		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
		    		where modelo_id = '".$idmodel."'";
		    		$tiendas = $this->_main->select($query);
		    		for ($i=0; $i <count($tiendas) ; $i++) { 
			    		$query = "SELECT * FROM producto_has_unidad_negocio where producto_id = '".$selected."' and unidad_negocio_id = '".$tiendas[$i]['idt']."'";
			    		$asignado[$i] = $this->_main->select($query); 
			    		if (empty($asignado[$i])) {
				            $query = "INSERT INTO `producto_has_unidad_negocio`(`producto_id`, `unidad_negocio_id`) VALUES  
				            ('".$selected."','".$tiendas[$i]['idt']."')"; 
				            $mhu = $this->_main->insertar($query);  
			            }
		            } 		
		           
		    }
    	}
    	echo json_encode($mhu);
    }

    public function modalmodelo($idP,$idm){
			#ESTA FUNCION ME PERMITE CARGAR LA INFO DEL PRODUCTO A EDITAR Y LA CONVERSION DE LA UNIDAD MINIMA A LA DE COMPRA Y PRESENTACION.
			$query = "SELECT mercancia.id as 'idP', mercancia.codigo, mercancia.codigo_anterior, mercancia.nombre as 'producto', mercancia.marca, mercancia.contenido_neto, mercancia.formula_c, mercancia.formula_p, mercancia.formula_s, mercancia.cantidad_presentacion, mc.modelo_id, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.id as 'idf', ref.referencia as 'familia', asociado_id, tipo_inventario_id, tipo_mercancia_id, ref2.referencia as tipo_ingrediente, mercancia.descripcion FROM `mercancia`
				inner join mercancia_has_modelo as mc on mc.mercancia_id = mercancia.id 
				inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
				inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
				left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
				inner join referencia as ref on ref.id = mercancia.familia_id
				inner join referencia as ref2 on ref2.id = mercancia.tipo_mercancia_id
				WHERE mercancia.id = $idP and mc.modelo_id = $idm order by ref.referencia ASC"; 
			$data = $this->_main->select($query);
			
			
			echo json_encode($data);
		}

	public function validarexistencias($idpro,$idm){
		$query = "SELECT unidad_negocio.id as idt, unidad_negocio.nombre FROM `unidad_negocio` 
		inner join modelo_has_submodelo on modelo_has_submodelo.id = modelo_has_submodelo_id
		inner join modelo on modelo_has_submodelo.modelo_id = modelo.id
		where modelo_id = $idm";
		$tiendas = $this->_main->select($query);
		for ($i=0; $i <count($tiendas) ; $i++) { 
			$query = "SELECT * FROM mercancia_has_unidad_negocio where mercancia_id = '".$idpro."' and unidad_negocio_id = '".$tiendas[$i]['idt']."'";
			$asignado[$i] = $this->_main->select($query);
			//print_r($asignado[$i]);
    		if ($asignado[$i][0]['existencia']>0) {
	            $data = $asignado[$i];
	            echo json_encode($data);exit();
    		}
		}
		echo json_encode(1);
	}



}?>