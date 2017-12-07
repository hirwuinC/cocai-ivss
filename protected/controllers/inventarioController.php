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
			WHERE unidad_negocio.id = $tienda ORDER BY mc.status = 1"; 

			$valores = $this->_main->select($query); #print_r($valores);
			$cantidad= count($valores);
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
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/inventario'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            #$idUser =Session::modelo('idUsuario'); echo $idUser[0]['id'];
            Session::time();
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, mc.existencia, mercancia.contenido_neto, mercancia.cantidad_presentacion, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia' FROM `unidad_negocio` 
						inner join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id 
						inner join mercancia on mercancia.id = mc.mercancia_id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
						inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
						inner join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
						inner join referencia as ref on ref.id = mercancia.familia_id 
						WHERE unidad_negocio.id = $id order by ref.referencia ASC"; 
			$valores = $this->_main->select($query); #print_r($valores);
			$producto = Controller::conversion($valores);
			$this->_view->mercancia = $producto;
			$this->_view->render('stockE', 'inventario', '','');	
		}

		function insert($idT=false){
			/*Esta funcion aun falta pulirla, no esta funcionando al 100%*/
			if ($_SERVER['REQUEST_METHOD']=='POST') {		
               	//print_r($_POST); echo "<br>"; exit();
               	$mystring = $_POST['precio_unitario'];
				$findme   = ',';
				$pos = strpos($mystring, $findme);
				if ($pos != false) {
					$p1 = str_replace(".","",$_POST['precio_unitario']);
               		$precioU = str_replace(",",".",$p1);
				}else{
					$precioU = $_POST['precio_unitario'];
				}
               	//echo $precioU; exit();
               	Session::destroy('carrito');
               	$campos = $this->verificarFormulasYcamposVacios($_POST); #print_r($campos); exit();
               	if ($campos[5] == 1) { 
                	$conversion = Controller::formula($_POST['unidad_medida_c'],false,$_POST['contenidoC'],$_POST['contenidoN'],$_POST['formulac']); 
                	$accion = 'Creado'; //var_dump($conversion); exit();
			    	$query = "INSERT INTO `mercancia`(`codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`, `peso_escurrido`, `descripcion`, `exento_impuesto`, `rendimiento`) 
			    	values ('".$_POST['codigo']."','".$campos[2]."','".$_POST['nombre']."','".$_POST['marca']."','".$precioU."',".$_POST['contenidoN'].",".$_POST['contenidoC'].",'".$_POST['formulac']."','".$campos[0]."','".$campos[1]."','".$_POST['familia']."',".$_POST['unidad_medida_c'].",".$_POST['unidad_medida_p'].",".$_POST['unidad_medida_s'].",".$campos[3].",'".$campos[8]."',".$campos[6].",".$campos[4].")";
					$idP=$this->_main->insertar($query); 
			   		 $query = "INSERT INTO `mercancia_has_unidad_negocio`(`mercancia_id`, `unidad_negocio_id`, `existencia`, `stock_min`, `stock_max`, `status`, `descripcion`) VALUES (".$idP.",".$_POST['idT'].",".$conversion.",".$_POST['stockmin'].",".$_POST['stockmax'].",".$campos[7].",'".$_POST['descripcion']."')"; 
               		$this->_main->insertar($query);
					$this->insertProveedor($idP);
					$this->log($idP,$_POST['idT'],$accion);
					$this->kardex($conversion,123,131,$idP,$_POST['idT'],$_POST['unidad_medida_s'],'Producto creado');
					$this->_view->redirect('inventario/evaluar/'.$_POST['idT']);
                	
                }else{
	                $conversion = Controller::formula($_POST['unidad_medida_c'],$campos[5],$_POST['contenidoC'],$_POST['contenidoN'],$_POST['formulac']); 
	                $accion = 'Creado'; //var_dump($conversion); exit();
				    $query = "INSERT INTO `mercancia`(`codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `unidad_medida_compra_id`, `unidad_medida_consumo_id`, `unidad_medida_sistema_id`) values ('".$_POST['codigo']."','".$_POST['codigo_anterior']."','".$_POST['nombre']."','".$_POST['marca']."','".$precioU."',".$_POST['contenidoN'].",".$campos[5].",'".$_POST['formulac']."','".$campos[0]."','".$campos[1]."',".$_POST['familia'].",".$_POST['unidad_medida_c'].",".$_POST['unidad_medida_p'].",".$_POST['unidad_medida_s'].")";
					$idP=$this->_main->insertar($query); 
				    $query = "INSERT INTO `mercancia_has_unidad_negocio`(`mercancia_id`, `unidad_negocio_id`, `stock_min`, `stock_max`, `existencia`, `descripcion`, `status`) VALUES (".$idP.",".$_POST['idT'].",".$_POST['stockmin'].",".$_POST['stockmax'].",".$conversion.",'".$_POST['descripcion']."',".$campos[7].")";
					$this->_main->insertar($query);
					$this->insertProveedor($idP);
					$this->log($idP,$_POST['idT'],$accion);
					$this->kardex($conversion,123,131,$idP,$_POST['idT'],$_POST['unidad_medida_s'],'Producto creado');
					$this->_view->redirect('inventario/evaluar/'.$_POST['idT']);
				}
			}else{ 
				Session::destroy('carrito');
				$this->_view->setJs(array('js/inventario'));
				$this->_view->idT = $idT;
				$this->_view->render('insertar','inventario','','');
			}
		}

		function log($idP,$idT,$accion){
    		#echo $idP.' '.$idT.' '.$accion;
	        $referencia='Producto';
	        $fecha = date ('Y-m-d');
	        $hora = date ('h:i:s');
	        $user =Session::modelo('idUsuario'); #print_r($user); exit();
	        $query = "SELECT nombre FROM `mercancia` WHERE id = $idP";
	        $producto = $this->_main->select($query); #print_r($producto); echo "<br>"; exit();
	        $query = "INSERT INTO `log`(`fecha`, `hora`, `referencia`, `nombre`, `accion`, `usuario` , `unidad_negocio_id`) VALUES ('".$fecha."','".$hora."','".$referencia."','".$producto[0]['nombre']."','".$accion."','".$user[0]['name'].' '.$user[0]['apellido']."' , $idT)"; 
	        $this->_main->insertar($query);
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
			$query = "SELECT mercancia.id as 'idP', mercancia.codigo, mercancia.codigo_anterior, mercancia.nombre as 'producto', mercancia.marca, mercancia.contenido_neto, mercancia.formula_c, mercancia.formula_p, mercancia.formula_s, mercancia.cantidad_presentacion,  mc.existencia, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.id as 'idf', ref.referencia as 'familia', mc.status FROM `mercancia` 
						inner join mercancia_has_unidad_negocio as mc on mc.mercancia_id = mercancia.id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
						inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
						inner join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
						inner join referencia as ref on ref.id = mercancia.familia_id 
						WHERE mercancia.id = $idP and mc.unidad_negocio_id = $idT order by ref.referencia ASC"; 
			$data = $this->_main->select($query);
			$producto = Controller::conversion($data);
			echo json_encode($producto);
		}

		function update(){
            if ($_SERVER['REQUEST_METHOD']=='POST') {
                //print_r($_POST); echo"<br>"; exit();
                $mystring = $_POST['precio_unitario'];
				$findme   = ',';
				$pos = strpos($mystring, $findme);
				if ($pos != false) {
					$p1 = str_replace(".","",$_POST['precio_unitario']);
               		$precioU = str_replace(",",".",$p1);
				}else{
					$precioU = $_POST['precio_unitario'];
				}
                
                $existencia = $_POST['existencia']; 
                $this->entradaOsalida($_POST['idP'],$_POST['idT'],$existencia, $_POST['unidad_medida_si']);
                
                $query = "UPDATE `mercancia` SET `codigo`='".$_POST['codigo']."',`codigo_anterior`='".$_POST['codigo_tcr']."',`nombre`='".$_POST['nombre']."',`marca`='".$_POST['marca']."',`precio_unitario`='".$precioU."',`contenido_neto`='".$_POST['contenidoN']."',`cantidad_presentacion`='".$_POST['cantidad']."',`formula_c`='".$_POST['formulac']."',`formula_p`='".$_POST['formulap']."',`formula_s`='".$_POST['formulas']."',`familia_id`=".$_POST['familia_id'].",`unidad_medida_compra_id`=".$_POST['unidad_medida_co'].",`unidad_medida_consumo_id`=".$_POST['unidad_medida_pr'].",`unidad_medida_sistema_id`=".$_POST['unidad_medida_si']." WHERE `id`= ".$_POST['idP']."";
                $this->_main->modificar($query);
                $query = "UPDATE `mercancia_has_unidad_negocio` SET `existencia`='".$existencia."',`stock_min`='".$_POST['stockmin']."',`stock_max`='".$_POST['stockmax']."',`status`=".$_POST['status']." WHERE `mercancia_id`= ".$_POST['idP']." and unidad_negocio_id = ".$_POST['idT']."";
                $this->_main->modificar($query);
                $accion='Modificado'; 
                $this->log($_POST['idP'],$_POST['idT'],$accion);
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
        			$descripcion='Error cargando los datos del producto';
        		}
        		$tipoM = 132;
        		$this->kardex($existencia,$motivo,$tipoM,$idP,$idT,$unidad,$descripcion);
        	}elseif ($existencia > $dato) {
        		if ($motivo != false and $descripcion != false) {
        			$motivo = $motive;
        			$descripcion= $description;
        		}else{
        			$motivo = 123;
        			$descripcion='Compra';
        		}
        		$tipoM = 131;
        		$this->kardex($existencia,$motivo,$tipoM,$idP,$idT,$unidad,$descripcion);
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
                $this->log($idP,$idT,$accion);
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
            	$this->log($idP,$idT,$accion);
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
			if ($post['rendimientoId'] == null) {
				$rendimiento=NULL;
			}else{
				$rendimiento=$post['rendimientoId'];
			}
			if ($post['cantidadConsumo'] == false) {
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
			$resultado[4] = $rendimiento;
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

        function validarProducto($name, $marca){
            $nombre=str_replace ( ':' , ' ' , $name);
            $query = "SELECT nombre, marca FROM mercancia where nombre = '".$nombre."' and marca = '".$marca."'";
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
					$query = "SELECT reposicion_id, remision_id, remision.unidad_negocio_id as udnremi, status_id, remision.fecha as fecharemi, remision.hora as horaremi, descripcion, cantidad, rm.unidad_negocio_id as udnrepo, rm.fecha as fecharepo, rm.hora as horarepo, total, tipo_reposicion
FROM notificacion_has_remision 
					left join remision on remision_id = remision.id
                    left join reposicion_mercancia as rm on rm.id = notificacion_has_remision.reposicion_id
					where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 order by notificacion_has_remision.status_id, remision.fecha, rm.fecha asc";
					$data = $this->_main->select($query);
					echo json_encode($data);
				break;
				
				case 't':
					
					for ($i=0; $i < count($modelos); $i++) {
						$udn[$i] = $modelos[$i]['idUd'];
					$query = "SELECT reposicion_id, remision_id, remision.unidad_negocio_id as udnremi, status_id, remision.fecha as fecharemi, remision.hora as horaremi, descripcion, cantidad, rm.unidad_negocio_id as udnrepo, rm.fecha as fecharepo, rm.hora as horarepo, total, tipo_reposicion
FROM notificacion_has_remision 
					left join remision on remision_id = remision.id
                    left join reposicion_mercancia as rm on rm.id = notificacion_has_remision.reposicion_id
					where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 order by notificacion_has_remision.status_id, remision.fecha, rm.fecha asc";
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


      	function rmm($status,$idr,$idudn,$cont){
      		$query = "SELECT distinct remision_id as idr, notificacion_has_remision.unidad_negocio_id as idur, status_id as idstatusN, unidad_negocio.codigo as codigour, unidad_negocio.nombre as tiendar, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, fecha, hora, cantidad, remision.descripcion, mercancia_has_unidad_negocio.mercancia_id, unidad_medida_consumo_id as idumpresentacion, unidad_medida_sistema_id as idumsist, unidad_medida_compra_id as idumcompra, udn.id as idue, udn.nombre as tiendae, udn.rif as rife, udn.razon_social as razon_se, udn.correo as emailue, udn.empresa_id as idempresaue, mercancia.id as idm, mercancia.codigo as codim, mercancia.codigo_anterior as coditcr, mercancia.nombre as producto, mercancia.marca as marca, contenido_neto, familia_id, ref.referencia as familia, usuario.nombre, usuario.apellido, ref2.referencia as tipo_u, modelo.nombre as modelo, refn.referencia as statusN,umpresentacion.abreviatura as abrevpres, umsistema.abreviatura as abrevsist, umcompra.abreviatura as abrevcompr, stock_max, stock_min, umsolicitud.id as idumsol, umsolicitud.abreviatura as abrevsol, existencia
			FROM notificacion_has_remision
      		inner join referencia as refn on refn.id = notificacion_has_remision.status_id
      		inner join unidad_negocio on notificacion_has_remision.unidad_negocio_id = unidad_negocio.id
      		inner join remision on remision_id = remision.id
      		inner join unidad_negocio as udn on remision.unidad_negocio_id = udn.id
      		inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
      		inner join mercancia on mercancia.id = remision.mercancia_id
      		inner join mercancia_has_unidad_negocio on mercancia.id = mercancia_has_unidad_negocio.mercancia_id
      		inner join referencia as ref on mercancia.familia_id = ref.id
      		inner join usuario on remision.usuario_id = usuario.id
      		inner join referencia as ref2 on ref2.id = usuario.tipo_usuario_id
      		inner join unidad_medida as umpresentacion on unidad_medida_consumo_id = umpresentacion.id
      		inner join unidad_medida as umsistema on unidad_medida_sistema_id = umsistema.id
            inner join unidad_medida as umcompra on unidad_medida_compra_id = umcompra.id
            inner join unidad_medida as umsolicitud on remision.unidad_medida_id = umsolicitud.id
      		where notificacion_has_remision.remision_id = $idr and notificacion_has_remision.unidad_negocio_id = $idudn
      		and notificacion_has_remision.status_id=$status group by unidad_negocio.id";
      		$info = $this->_main->select($query);
      		$this->_view->datos = $info;
      		$this->_view->render('notiremision', 'inventario', '','');


    	}

    	function kardex($cantidad,$motivo,$tipoM,$idP,$idT,$unidad,$descripcion){
	    	$fecha = date ('Y-m-d');
	        $hora = date ('h:i:s');
	        $user =Session::modelo('idUsuario'); #echo $idUser; exit();
	        $query = "SELECT nombre FROM `mercancia` WHERE id = $idP";
	        $producto = $this->_main->select($query); //print_r($pro); echo "<br>";
	        $query = "INSERT INTO `kardex`(`fecha`, `hora`, `cantidad`, `descripcion`, `tipo_movimiento_id`, `mercancia_id`, `unidad_negocio_id`, `usuario_id`, `unidad_medida_id`, `motivo_id`) VALUES ('".$fecha."','".$hora."',".$cantidad.",'".$descripcion."','".$tipoM."',".$idP.",".$idT.",".$user[0]['id'].",$unidad,'".$motivo."')";
    		$producto = $this->_main->insertar($query);
    	}

    	function remisionM($id,$success = false){
    		$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/remision'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
    		
    		$modelos = Session::modelo('idUsuario');
    			$query = "SELECT unidad_negocio.id, unidad_negocio.nombre, modelo.id as idM, modelo.nombre as modelo From unidad_negocio 
    		inner join modelo_has_submodelo on modelo_has_submodelo_id = modelo_has_submodelo.id
    		inner join modelo on modelo_id = modelo.id where unidad_negocio.id = $id";
    		$datosT = $this->_main->select($query);

    		$modeloid = $datosT[0]['idM'];
    		$query = "SELECT unidad_negocio.id, unidad_negocio.nombre, modelo.nombre as modelo from unidad_negocio 
    		inner join modelo_has_submodelo  on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
    		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
    		where modelo_has_submodelo.modelo_id = $modeloid and unidad_negocio.id !=$id";
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
    	}

    	function reposicionM($id,$success = false){
    		$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/remision'));
    		$this->_view->setJs(array('js/carrito'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    Session::destroy('idtienda');
		    Session::destroy('totalPagar');
       		Session::destroy('carrito1');
    		$_SESSION['idtienda'] = $id;
    		$modelos = Session::modelo('idUsuario');
    			$query = "SELECT unidad_negocio.id, unidad_negocio.nombre, modelo.id as idM, modelo.nombre as modelo, empresa_id From unidad_negocio left join modelo_has_submodelo on modelo_has_submodelo_id = modelo_has_submodelo.id left join modelo on modelo_id = modelo.id where unidad_negocio.id = $id";
    		$datosT = $this->_main->select($query);
    		if (!is_null($datosT[0]['idM'])) {
    			$modeloid = $datosT[0]['idM'];
    		$query = "SELECT unidad_negocio.id, unidad_negocio.nombre, modelo.nombre as modelo from unidad_negocio 
    		inner join modelo_has_submodelo  on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
    		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
    		where modelo_has_submodelo.modelo_id = $modeloid and unidad_negocio.id !=$id";
    		$tiendas = $this->_main->select($query);
    		}
    		
    		$query = "SELECT nombre from mercancia";
    		$products = $this->_main->select($query);
    		$this->_view->prod = $products;
    		$tiendas[0]['tiendaen'] = $datosT[0]['nombre'];
    		$tiendas[0]['idempresa'] = $datosT[0]['empresa_id'];

    		$this->_view->datos = $tiendas;
    		$this->_view->idu = $id;
    		if ($success == 'success') {
					$this->_view->_error = Controller::getBoxAlert(
	                        'Solicitud enviada con exito', 
	                        '',
	                        'success');
	        		//$this->_view->render('remision', 'inventario', '','');

				}
      		$this->_view->render('reposicion', 'inventario', '',''); 		
    	}

    	function compraDirecta(){
    		if ($_SERVER['REQUEST_METHOD']=='POST') {
    			Controller::varDump($_POST); 
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
    			$accion='Modificado'; 
                $this->log($_POST['idP'],$_POST['idT'],$accion);
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
    		inner join unidad_medida as um2 on um2.id = unidad_medida_compra_id
    		where mercancia.nombre = '".$nombre."' and mercancia.marca like '%".$marca."%' group by US,UP,UC";
    		$conte = $this->_main->select($query);
    		echo json_encode($conte);

    	}

    	 function autocompletarp(){
    		$query = "SELECT distinct id,nombre as label, nombre as value from mercancia group by nombre";
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

    	function insertRemision(){
    		$fecha = date('Y-m-d');
			$hora = date('g:i:s a');
			$idUsuario = Session::get('idUsuario');
			#echo $fecha.' '.$hora;exit(); 
			if ($_SERVER['REQUEST_METHOD']=='POST') {
				//Controller::varDump($_POST);exit();
				$query = "INSERT INTO remision (`fecha`, `hora`, `descripcion`, `cantidad`, `unidad_medida_id`, `unidad_negocio_id`, `usuario_id`, `mercancia_id`) VALUES ('".$fecha."','".$hora."','".$_POST['descripcion']."','".$_POST['cantidadR']."','".$_POST['unidades']."','".$_POST['tiendae']."',$idUsuario,'".$_POST['mercancia_id']."');";
				$idr = $this->_main->insertar($query);
				$query = "INSERT INTO notificacion_has_remision (`remision_id`, `unidad_negocio_id`, `status_id`) VALUES ($idr,'".$_POST['tiendar']."','".$_POST['status_id']."')";
				$idn =$this->_main->insertar($query);
				$this->_view->redirect('inventario/remisionM/'.$_POST['tiendae'].'/success');

			}


    	}

    	 function validarcante(){

    	}

    	/*public function conversionExistencia($idP, $idT){
    		$query = "SELECT mercancia.id as 'idP', mercancia.codigo, mercancia.codigo_anterior, mercancia.nombre as 'producto', mercancia.marca, mercancia.contenido_neto, mercancia.formula_c, mercancia.formula_p, mercancia.formula_s, mercancia.cantidad_presentacion,  mc.existencia, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.id as 'idf', ref.referencia as 'familia', mc.status FROM mercancia 
            inner join mercancia_has_unidad_negocio as mc on mc.mercancia_id = mercancia.id 
            inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
            inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
            inner join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
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

    	function codigoP($idT){
            $query = "SELECT id FROM unidad_negocio where id = $idT";
            $data = $this->_main->select($query);
            $query = "SELECT id FROM `mercancia` inner join mercancia_has_unidad_negocio on mercancia_has_unidad_negocio.mercancia_id = mercancia.id where mercancia_has_unidad_negocio.unidad_negocio_id = $idT";
            $producto = $this->_main->totalRegistros($query);
            $codigo[0]= $producto + 1;
            $codigo[1]= $data[0][0];
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
		    
    		$query = "SELECT unidad_negocio.id as idU, unidad_negocio.nombre as udn, modelo.nombre as modelo From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $id";
    		$mo = $this->_main->select($query);
    		$this->_view->model = $mo;
    		$this->_view->render('kardex', 'inventario', '',''); 	
    	}

    	function consultarkardex($fechaini,$fechafin,$tipom,$motivo,$idU){
    		//echo $idU."<br><br>";
    		if ($idU != 59) {
    			 $cadena = "and kardex.unidad_negocio_id = ".$idU;
    		}else{
    			 $cadena = 'and kardex.unidad_negocio_id is not null';
    		}
    		if ($tipom == 'false' and $motivo == 'false') {
    		$query="SELECT fecha, DATE_FORMAT(hora, '%r') as hora, CONCAT(cantidad, ' ', unidad_medida.abreviatura) as cantidad, kardex.descripcion, tipo_movimiento_id as idtm, mercancia_id as idmer, usuario_id as idUs, unidad_medida_id as idum, motivo_id as idmot, referencia.referencia as tipomov, CONCAT(mercancia.nombre, ' ', mercancia.marca) As mercancia, CONCAT(usuario.nombre, ' ', usuario.apellido) As Nombre, unidad_medida.unidad,  ref.referencia as motivo, ref1.referencia as familia, unidad_negocio.id as idt, unidad_negocio.nombre as tienda
    			FROM `kardex` 
    			inner join referencia on referencia.id = tipo_movimiento_id 
    			inner join mercancia on mercancia.id = kardex.mercancia_id 
    			inner join usuario on usuario.id = kardex.usuario_id 
    			inner join unidad_medida on unidad_medida.id = kardex.unidad_medida_id 
    			inner join referencia as ref on ref.id = kardex.motivo_id 
    			inner join referencia as ref1 on ref1.id = mercancia.familia_id
                inner join unidad_negocio on kardex.unidad_negocio_id = unidad_negocio.id
    			WHERE fecha BETWEEN '".$fechaini."' and '".$fechafin."' $cadena ";
    		$data = $this->_main->select($query);

    		}else if ($motivo == 'false' and $tipom != 'false') {
    			$query="SELECT fecha, DATE_FORMAT(hora, '%r') as hora, CONCAT(cantidad, ' ', unidad_medida.abreviatura) as cantidad, kardex.descripcion, tipo_movimiento_id as idtm, mercancia_id as idmer, usuario_id as idUs, unidad_medida_id as idum, motivo_id as idmot, referencia.referencia as tipomov, CONCAT(mercancia.nombre, ' ', mercancia.marca) As mercancia, CONCAT(usuario.nombre, ' ', usuario.apellido) As Nombre, unidad_medida.unidad,  ref.referencia as motivo, ref1.referencia as familia, unidad_negocio.id as idt, unidad_negocio.nombre as tienda
    			FROM `kardex` 
    			inner join referencia on referencia.id = tipo_movimiento_id 
    			inner join mercancia on mercancia.id = kardex.mercancia_id 
    			inner join usuario on usuario.id = kardex.usuario_id 
    			inner join unidad_medida on unidad_medida.id = kardex.unidad_medida_id 
    			inner join referencia as ref on ref.id = kardex.motivo_id 
    			inner join referencia as ref1 on ref1.id = mercancia.familia_id
                inner join unidad_negocio on kardex.unidad_negocio_id = unidad_negocio.id
    			WHERE fecha BETWEEN '".$fechaini."' and '".$fechafin."' and tipo_movimiento_id = $tipom $cadena";
    		$data = $this->_main->select($query);
    		

    		}else if ($tipom != 'false' and $motivo != 'false') {
    			$query="SELECT fecha, DATE_FORMAT(hora, '%r') as hora, CONCAT(cantidad, ' ', unidad_medida.abreviatura) as cantidad, mercancia.descripcion, tipo_movimiento_id as idtm, mercancia_id as idmer, usuario_id as idUs, unidad_medida_id as idum, motivo_id as idmot, referencia.referencia as tipomov, CONCAT(mercancia.nombre, ' ', mercancia.marca) As mercancia, CONCAT(usuario.nombre, ' ', usuario.apellido) As Nombre, unidad_medida.unidad,  ref.referencia as motivo, ref1.referencia as familia, unidad_negocio.id as idt, unidad_negocio.nombre as tienda
    			FROM `kardex` 
    			inner join referencia on referencia.id = tipo_movimiento_id 
    			inner join mercancia on mercancia.id = kardex.mercancia_id 
    			inner join usuario on usuario.id = kardex.usuario_id 
    			inner join unidad_medida on unidad_medida.id = kardex.unidad_medida_id 
    			inner join referencia as ref on ref.id = kardex.motivo_id 
    			inner join referencia as ref1 on ref1.id = mercancia.familia_id
                inner join unidad_negocio on kardex.unidad_negocio_id = unidad_negocio.id
    			WHERE fecha BETWEEN '".$fechaini."' and '".$fechafin."' and tipo_movimiento_id = $tipom and motivo_id = $motivo $cadena";
    		$data = $this->_main->select($query);
    		}

    		
    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
    	}

    	function carroCompra($id, $operador=false, $idt, $cant,$cantx,$idprov,$unidadc,$um){

    $query="SELECT mercancia.id as 'idP', mercancia.codigo, mercancia.codigo_anterior, mercancia.nombre as 'producto', mercancia.marca, mercancia.contenido_neto, mercancia.formula_c, mercancia.formula_p, mercancia.formula_s, mercancia.cantidad_presentacion,  mc.existencia, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.id as 'idf', ref.referencia as 'familia', mc.status FROM `mercancia` 
						inner join mercancia_has_unidad_negocio as mc on mc.mercancia_id = mercancia.id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
						inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
						inner join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
						inner join referencia as ref on ref.id = mercancia.familia_id 
						WHERE mercancia.id = $id and mc.unidad_negocio_id = $idt order by ref.referencia ASC";
    	$producto = $this->_main->select($query);
    	if ($idprov != 'false') {
    		$datosprov = $this->datosprov($idprov);
    	}else{
    		$query="SELECT empresa.id as idempresa, empresa.nombre as nombreempresa FROM unidad_negocio 
					inner join unidad_negocio as empresa on empresa.id = unidad_negocio.empresa_id where unidad_negocio.id = $idt";
					$emp = $this->_main->select($query);
    		$datosprov[0]['nombre'] = $emp[0]['nombreempresa'];
    		$datosprov[0]['id'] = false;
    		$datosprov[0]['precio'] = $producto[0]['precio_unitario'];
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
               	$arreglo1[$numero]['nombre']= $producto[0]['producto'];
                $arreglo1[$numero]['precio']= $datosprov[0]['precio'];
                $arreglo1[$numero]['cantidad']=$cant;
                $arreglo1[$numero]['cant']=$cantx;
                $arreglo1[$numero]['proveedor']=$datosprov[0]['nombre'];
                $arreglo1[$numero]['idproveedor']=$datosprov[0]['id'];
                $arreglo1[$numero]['unidadc']=$unidadc;
                $arreglo1[$numero]['idumc']=$um;
                
                $_SESSION['carrito1']=$arreglo1;    
            break;
            
            default:
                $arreglo1[$numero]['nombre']= $producto[0]['producto'];
                $arreglo1[$numero]['precio']= $datosprov[0]['precio'];
                $arreglo1[$numero]['cantidad']=$cant;
                $arreglo1[$numero]['cant']=$cantx;
                $arreglo1[$numero]['proveedor']=$datosprov[0]['nombre'];
                $arreglo1[$numero]['idproveedor']=$datosprov[0]['id'];
                $arreglo1[$numero]['unidadc']=$unidadc;
                $arreglo1[$numero]['idumc']=$um;

                $_SESSION['carrito1']=$arreglo1;
            break;
          }
          
        }else{
          $_SESSION['carrito1']=$this->pedido($producto,'nuevo',$cant,$cantx,$datosprov,$unidadc,$um);
        }
    }
  }else{
    
    $_SESSION['carrito1']=$this->pedido($producto,'primero',$cant,$cantx,$datosprov,$unidadc,$um);

  } //print_r($_SESSION['carrito1']); exit();
    $totales = $this->conversionprecio($_SESSION['carrito1'],$cant,$cantx);
    $_SESSION['totalPagar']=$totales;
    $data = array($_SESSION['carrito1'], $_SESSION['totalPagar']); #print_r($data); exit();
    echo json_encode($data);
  }

    function pedido($producto, $opcion,$cant,$cantx,$datosprov,$unidadc,$um){
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
                  'idumc'=>$um
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
                  'idumc'=>$um
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
                  	 'idumc'=>$arreglo1[$i]['idumc']
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
				$total = number_format($preciofinal,2,",",".");
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
      	$query ="SELECT * FROM proveedor 
		inner join proveedor_has_mercancia on proveedor.id = proveedor_id
		WHERE proveedor_id = $idprov";
		$data=$this->_main->select($query);
        return $data;
      }

      public function insertsolicitudr(){
      	$this->_view->setJs(array('js/carrito/'));		
      	$this->_view->setCss(array('datatable/css/bootstrap4.min'));
	    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
	    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
	    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
	    $this->_view->setJs(array('datatable/js/tabla'));
        $iduser = Session::get('idUsuario');

    		$fecha = date('Y-m-d');
			$hora = date('g:i:s a');
			$idUsuario = Session::get('idUsuario');
			$orden=$_SESSION['carrito1'];
        	$totalPagar=$_SESSION['totalPagar'];
			$idtienda = $_SESSION['idtienda'];
			$tipor = 'compra a proveedores';
			#echo $fecha.' '.$hora;exit(); 
			$query = "INSERT INTO reposicion_mercancia (`fecha`, `hora`, `total`, `tipo_reposicion`, `unidad_negocio_id`, `usuario_id`) 
			VALUES ('".$fecha."','".$hora."','".$totalPagar."','".$tipor."','".$idtienda."','".$iduser."')";
				$idr = $this->_main->insertar($query);
			if (is_null($orden[0]['idproveedor'])) {
				//Controller::varDump($_POST);exit();
				$query = "SELECT empresa_id, unidad_negocio.id as idU, unidad_negocio.nombre as udn, modelo.nombre as modelo From unidad_negocio
	    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
	      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $idtienda";
				$idempresa = $this->_main->select($query);
				$query = "INSERT INTO notificacion_has_remision (`reposicion_id`, `unidad_negocio_id`, `status_id`) VALUES ($idr,'".$idempresa[0][0]."',129)";
				$idn =$this->_main->insertar($query);
				for ($i=1; $i < count($orden); $i++) { 
		              $query = "INSERT INTO mercancia_has_reposicion(cantidad, precio, ingrediente_id, unidad_medida_id, proveedor_id) VALUES  
		              ('".$orden[$i]['cantidad']."','".$orden[$i]['precio']."','".$orden[$i]['id']."','".$orden[$i]['idumc']."',NULL)"; 
		              $mhr = $this->_main->insertar($query);
		          }
			}else{
				for ($i=0; $i < count($orden); $i++) { 
               $query = "INSERT INTO mercancia_has_reposicion(cantidad, precio, ingrediente_id, unidad_medida_id, proveedor_id) VALUES  
              ('".$orden[$i]['cantidad']."','".$orden[$i]['precio']."','".$orden[$i]['id']."','".$orden[$i]['idumc']."','".$orden[$i]['idproveedor']."')"; 
              $mhr = $this->_main->insertar($query);
			}
			
          }
		
        if (isset($mhr)) {
        	$this->_view->_totalP = $totalPagar;
        $this->_view->_pedido = $orden;
        $this->_view->_tienda = $idempresa;
        $this->_view->_idtienda = $idtienda;
        $this->_view->render('solicitudcreada', 'inventario', '');
        }else{
        $this->_view->render('index', 'inventario', '');
        }
        #var_dump($orden); echo "</br><br>";
        #var_dump($totalPagar); echo "</br>";exit();    
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
    	/*funcion para cargar los ingredientes que corresponden a la empresa pero unicamente los que no tiene la tienda seleccionada y viceversa*/
    	$query = "SELECT mercancia.id as idpro, codigo, nombre as producto, marca, CONCAT(nombre,' ',marca) as mercancia FROM `mercancia`
		inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
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
    	/*funcion para cargar los ingredientes que corresponden a la empresa pero unicamente los que no tiene la tienda seleccionada y viceversa*/
    	$query = "SELECT mercancia.id as idpro, codigo, nombre as producto, marca FROM `mercancia`
		inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
		where unidad_negocio_id = $idt";
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

    public function borrarasignacion($idpro,$idt){
		$query = "DELETE FROM mercancia_has_unidad_negocio where mercancia_id = '".$idpro."' and unidad_negocio_id = '".$idt."'";
		$borrado = $this->_main->eliminar($query);  		
		echo json_encode($borrado);
    }



}?>