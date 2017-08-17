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

		function setunidadT($unidad_p){
			$query = "SELECT * from unidad_medida where id = $unidad_p";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		function datosPT($idP,$idT){
			$query = "SELECT mercancia.id as idM, mercancia.codigo, mercancia.nombre as producto, mercancia.descripcion as marca, precio_unitario, stock_min, stock_max, unidad_medida_sistema_id, referencia.referencia as familia, unidad_medida.unidad, unidad_medida.abreviatura
			FROM mercancia 
            inner join mercancia_has_unidad_negocio on mercancia_has_unidad_negocio.mercancia_id = mercancia.id
			inner join referencia on referencia.id = familia_id
			inner join unidad_medida on unidad_medida_sistema_id = unidad_medida.id
            inner join unidad_negocio on mercancia_has_unidad_negocio.unidad_negocio_id = unidad_negocio.id
            where mercancia.id = $idP and unidad_negocio.id = $idT ";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		public function notificaciones($privilegios){
			$modelos = Session::modelo('idUsuario');
			switch ($privilegios) {
				case 'e':
					$query = "SELECT * FROM notificacion_has_remision where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 order by notificacion_has_remision.status_id asc";
					$data = $this->_main->select($query);
					echo json_encode($data);
					break;
				
				case 't':
					for ($i=0; $i < count($modelos); $i++) {
						$udn = $modelos[$i]['idUd'];
						$query = "SELECT * FROM notificacion_has_remision where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 order by notificacion_has_remision.status_id asc";
						$datos = $this->_main->select($query);
						
							for ($j=0; $j <count($datos) ; $j++) { 
								if ($datos[$j]['unidad_negocio_id'] == $udn) {
									$data[$j] = $datos[$j];
								}
							}//print_r($data);
					}echo json_encode($data);
					break;
		
			}	    
      	}


      	function rpm($status,$idk,$idudn,$cont){
      		$query = "SELECT kardex_id as idk, notificacion_has_remision.unidad_negocio_id as idur, status_id as statusN, unidad_negocio.codigo as codigour, unidad_negocio.nombre as tiendar, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, fecha, hora, cantidad, motivo, tipo_movimiento_id as idtmv, mercancia_id, unidad_medida_id as idumpresentacion, unidad_medida_sistema_id as idumsist, referencia.referencia as tipoMov, udn.id as idue, udn.nombre as tiendae, udn.rif as rife, udn.razon_social as razon_se, udn.correo as emailue, udn.empresa_id as idempresaue, mercancia.id as idm, mercancia.codigo as codim, mercancia.codigo_anterior as coditcr, mercancia.nombre as producto, mercancia.descripcion as marca, contenido_neto, familia_id, ref.referencia as familia, usuario.nombre, usuario.apellido, ref2.referencia as tipo_u, modelo.nombre as modelo, refn.referencia as statusN,umpresentacion.abreviatura as abrevpres, umsistema.abreviatura as abrevsist
      		FROM notificacion_has_remision
      		inner join referencia as refn on refn.id = notificacion_has_remision.status_id
      		inner join unidad_negocio on notificacion_has_remision.unidad_negocio_id = unidad_negocio.id
      		inner join kardex on kardex_id = kardex.id
      		inner join unidad_negocio as udn on kardex.unidad_negocio_id = udn.id
      		inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
      		inner join referencia on referencia.id = tipo_movimiento_id
      		inner join mercancia on mercancia.id = kardex.mercancia_id
      		inner join referencia as ref on mercancia.familia_id = ref.id
      		inner join usuario on kardex.usuario_id = usuario.id
      		inner join referencia as ref2 on ref2.id = usuario.tipo_usuario_id
      		inner join unidad_medida as umpresentacion on kardex.unidad_medida_id = umpresentacion.id
      		inner join unidad_medida as umsistema on unidad_medida_sistema_id = umsistema.id
      		where notificacion_has_remision.kardex_id = $idk and notificacion_has_remision.unidad_negocio_id = $idudn 
      		and notificacion_has_remision.status_id=$status";
      		$info = $this->_main->select($query);
      		$this->_view->datos = $info;
      		$this->_view->render('notificaciones', 'inventario', '','');

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