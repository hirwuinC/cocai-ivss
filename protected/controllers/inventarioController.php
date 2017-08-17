<?php 
	class inventarioController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_inventario;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
		//Objeto donde almacenamos todas las funciones de PersonsModel.php

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
			$this->_view->setCss(array('datatable/css/dataTables.bootstrap'));
            $this->_view->setCss(array('datatable/css/jquery.datatable.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setjs(array('datatable/js/jquery.dataTables.min'));
		    $this->_view->setJs(array('datatable/js/dataTables.bootstrap.min'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            $this->_view->setJs(array('js/inventario'));
            Session::time();
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mc.descripcion, mc.existencia, mc.contenido_neto, mc.stock_min, mc.stock_max, mc.status, mc.precio_unitario, unidad_medida.id as 'idUM',unidad_medida.unidad, unidad_medida.abreviatura, unidad_medida.id as 'idUM',unidad_medida.unidad, unidad_medida.abreviatura, ref.referencia as 'familia' FROM `unidad_negocio` inner join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id inner join mercancia on mercancia.id = mc.mercancia_id inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_compra_id inner join referencia as ref on ref.id = mercancia.familia_id WHERE unidad_negocio.id = $tienda ORDER BY mercancia.status = 1"; 
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
			$this->_view->setCss(array('datatable/css/dataTables.bootstrap'));
            $this->_view->setCss(array('datatable/css/jquery.datatable.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setjs(array('datatable/js/jquery.dataTables.min'));
		    $this->_view->setJs(array('datatable/js/dataTables.bootstrap.min'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            $this->_view->setJs(array('js/inventario'));
            #$idUser =Session::modelo('idUsuario'); echo $idUser[0]['id'];
            Session::time();
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mc.descripcion, mc.existencia, mercancia.contenido_neto, mc.stock_min, mc.stock_max, mc.status, mercancia.precio_unitario, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia' FROM `unidad_negocio` 
						inner join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id 
						inner join mercancia on mercancia.id = mc.mercancia_id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
						inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_presentacion_id 
						inner join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
						inner join referencia as ref on ref.id = mercancia.familia_id 
						WHERE unidad_negocio.id = $id order by ref.referencia ASC"; 
			$valores = $this->_main->select($query); #print_r($valores);
			$cantidad= count($valores);
			$this->_view->mercancia = $valores;
			$this->_view->render('stockE', 'inventario', '','');	
		}

			function setunidadT($unidad_p){
			$query = "SELECT * from unidad_medida where id = $unidad_p";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}


		function insert(){
			if ($_SERVER['REQUEST_METHOD']=='POST') {		
			//Guardamos en un arreglo  lo que recibimos via POST de la vista
               	#print_r($_POST); exit();
                $conversion = Controller::formula($_POST['unidad_medida_c'],$_POST['cantidad'],$_POST['contenidoC'],$_POST['contenidoN'],$_POST['formulac']); 
                $accion = 'Creado'; #var_dump($conversion); 
				$f = $this->verificarFormulasVacias($_POST['formulap'],$_POST['formulas']); #print_r($f); exit();
			    $query = "INSERT INTO `mercancia`(`codigo`, `codigo_anterior`, `nombre`, `marca`, `precio_unitario`, `contenido_neto`, `cantidad_presentacion`, `formula_c`, `formula_p`, `formula_s`, `familia_id`, `unidad_medida_compra_id`, `unidad_medida_presentacion_id`, `unidad_medida_sistema_id`) values ('".$_POST['codigo']."','".$_POST['codigo_anterior']."','".$_POST['nombre']."','".$_POST['descripcion']."','".$_POST['precio_unitario']."',".$_POST['contenidoN'].",".$_POST['cantidad'].",'".$_POST['formulac']."','".$f[0][0]."','".$f[0][1]."',".$_POST['familia'].",".$_POST['unidad_medida_c'].",".$_POST['unidad_medida_p'].",".$_POST['unidad_medida_s'].")";
				$idP=$this->_main->insertar($query); 
			    $query = "INSERT INTO `mercancia_has_unidad_negocio`(`mercancia_id`, `unidad_negocio_id`, `stock_min`, `stock_max`, `existencia`, `descripcion`, `status`) VALUES (".$idP.",".$_POST['idT'].",".$_POST['stockmin'].",".$_POST['stockmax'].",".$conversion.",'".$_POST['descripcion']."',0)"; 
				$this->_main->insertar($query);
				$this->log($idP,$_POST['idT'],$accion);
				$this->kardex($conversion,'Producto creado','Entra',$idP,$_POST['idT'],$_POST['unidad_medida_s']);
				$this->_view->redirect('inventario/evaluar/'.$_POST['idT']);
			}else{ 
				$this->_view->redirect('inventario/evaluar/'.$_POST['idT']);
			}
		}

		function update(){
			if ($_SERVER['REQUEST_METHOD']=='POST') {
				if ($_POST['status'] == 'Activo') {
					$status = '0'; 
				}else{
					$status = '1';
				}
				//print_r($_POST); echo"<br>"; exit();
				$accion = 'Modificado';
				$query = "UPDATE `grupo` SET `ordenNum`='".$_POST['orden']."', `nombre`='".$_POST['nombre']."', `recetaInactiva`='".$status."' WHERE `id`= ".$_POST['idg']."";
				$this->_admin->modificar($query);
				$this->log($_POST['idg'],$_POST['idm'],$_POST['idsm'],$accion);
				$this->_view->redirect('grupo/inicio/'.$_POST['idsm'].'/'.$_POST['idm']);

			}else{
				$this->_view->redirect('grupo/inicio/'.$_POST['idsm'].'/'.$_POST['idm']);

			}
		}

		function delete($idsm, $idm, $idg){
			//echo $idm.' '.$idsm; exit();
			$accion = 'Eliminado';
			$query = "SELECT * from producto where grupo_id = $idg";
            $productos = $this->_admin->listar($query);
            $lista = count($productos);
            
            if ($lista > 0){
                for ($i=0; $i < count($productos); $i++) { 
                    //evaluar idmodelo para saber cual submodelo asignar
                    $query ="UPDATE producto set grupo_id = NULL where grupo_id = $idg";
                    $this->_admin->modificar($query);
                    //$this->log($idg,$idm,$idsm,$accion);
                }
                $this->log($idg,$idm,$idsm,$accion);
                $query ="DELETE FROM `grupo` WHERE id = $idg";
                $resultado=$this->_admin->eliminar($query);
                if (!empty($resultado)) {
                	$js = true;
                	echo json_encode($js);
	            }else{
	                $js = false;
	                echo json_encode($js);
	            }
            }else{
            	$this->log($idg,$idm,$idsm,$accion);
                $query ="DELETE FROM `grupo` WHERE id = $idg";
                $resultado=$this->_admin->eliminar($query);
                if (!empty($resultado)) {
	                $js = true;
	                echo json_encode($js);
	            }else{
	                $js = false;
	                echo json_encode($js);
            	}
            }	
		}

		function verificarFormulasVacias($formulap,$formulas){
			$formulaP=list($unidad, $signo, $contenidoNetoP) = explode(" ", $formulap);
			$formulaS=list($unidad, $signo, $contenidoNetoS) = explode(" ", $formulas);
			if ($contenidoNetoP == null) {
				$formulaP=null;
			}
			if ($contenidoNetoS == null) {
				$formulaS = null;
			}
			$resultado[0] = $formulaP;
			$resultado[1] = $formulaS;
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

		function nombreProAlert($id){
	        $query = "SELECT grupo.id, grupo.nombre, referencia.id as 'id_submodelo', referencia.referencia as 'submodelo' FROM `grupo` 
	        		  INNER JOIN referencia on referencia.id = grupo.submodelo_id where grupo.id = $id";
	        $data = $this->_admin->listar($query);
	        echo json_encode($data);
    	}

    	function grupoEditar($id){
    		$query = "SELECT * FROM `grupo` WHERE id = $id"; 
			$data = $this->_admin->listar($query);
			echo json_encode($data);
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

    	function kardex($cantidad,$motivo,$tipoM,$idP,$idT,$unidad){
	    	$fecha = date ('Y-m-d');
	        $hora = date ('h:i:s');
	        $user =Session::modelo('idUsuario'); #echo $idUser; exit();
	        $query = "SELECT nombre FROM `mercancia` WHERE id = $idP";
	        $producto = $this->_main->select($query); //print_r($pro); echo "<br>";
	        $query = "INSERT INTO `kardex`(`fecha`, `hora`, `cantidad`, `motivo`, `tipo_movimiento`, `mercancia_id`, `unidad_negocio_id`, `usuario_id`, `unidad_medida_id`) VALUES ('".$fecha."','".$hora."',".$cantidad.",'".$motivo."','".$tipoM."',".$idP.",".$idT.",".$user[0]['id'].",$unidad)";
    		$producto = $this->_main->insertar($query);
    	}

}?>