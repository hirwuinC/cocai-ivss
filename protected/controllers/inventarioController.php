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
            $this->_view->setJs(array('js/prod'));
            Session::time();
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.descripcion as marca, unidad_medida.id as 'idUM',unidad_medida.unidad, unidad_medida.abreviatura, ref.referencia as 'familia', modelo.id as 'idM', modelo.nombre as 'modelo', model.nombre as'subM', mercancia_has_unidad_negocio.existencia as existencia, mercancia_has_unidad_negocio.status, stock_min, stock_max, precio_unitario 
				from unidad_negocio
						inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id inner join modelo on modelo.id = modelo_has_submodelo.modelo_id 
						inner join modelo as model on model.id = modelo_has_submodelo.sub_modelo_id 
						inner join mercancia_has_unidad_negocio on mercancia_has_unidad_negocio.unidad_negocio_id = unidad_negocio.id 
						inner join mercancia on mercancia.id = mercancia_has_unidad_negocio.mercancia_id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id 
						inner join referencia as ref on ref.id = mercancia.familia_id 
						WHERE unidad_negocio.id = $tienda ORDER BY mercancia_has_unidad_negocio.status = 1"; 
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
            $this->_view->setJs(array('js/grupo'));
            Session::time();
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.descripcion, mercancia.cantidad_inventariada, mercancia.contenido_neto, mercancia.stock_minimo, mercancia.stock_maximo, mercancia.status, mercancia.precio_unitario, unidad_medida.id as 'idUM',unidad_medida.unidad, unidad_medida.abreviatura, unidad_medida.id as 'idUM',unidad_medida.unidad, unidad_medida.abreviatura, ref.referencia as 'familia' FROM `unidad_negocio` 
						inner join mercancia_has_unidad_negocio on mercancia_has_unidad_negocio.unidad_negocio_id = unidad_negocio.id 
						inner join mercancia on mercancia.id = mercancia_has_unidad_negocio.mercancia_id 
						inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id 
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
                //print_r($_POST); echo "<br>"; exit();
                $accion = 'Creado';
			    $query = "INSERT INTO grupo (`ordenNum`, `nombre`, `recetaInactiva`, `submodelo_id`) values ('".$_POST['orden']."','".$_POST['nombre']."','".$_POST['status']."',".$_POST['submodelo'].")";
				$idg=$this->_admin->insertar($query);
				$this->log($idg,$_POST['modelo'],$_POST['submodelo'],$accion);
				$this->_view->redirect('grupo/inicio/'.$_POST['submodelo'].'/'.$_POST['modelo']);
			}else{ 
				$this->_view->redirect('grupo/inicio/'.$_POST['submodelo'].'/'.$_POST['modelo']);
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
						$query = "SELECT * FROM notificacion_has_remision where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 order by notificacion_has_remision.status asc";
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

    	function log($idg,$idm,$idsm,$accion){
        $referencia='Grupo';
        $fecha = date ('Y-m-d');
        $hora = date ('h:i:s');
        $idUser =Session::modelo('idUsuario');
        $query = "SELECT nombre FROM `grupo` WHERE id = $idg";
        $gru = $this->_admin->listar($query); //print_r($pro); echo "<br>";
        $query = "SELECT nombre, apellido FROM `usuario` WHERE id = ".$idUser[0][0]."";
        $user = $this->_admin->listar($query); #print_r($user); echo "<br>";
        $query = "SELECT referencia FROM `referencia` WHERE id = $idm";
        $model = $this->_admin->listar($query); #print_r($model); echo "<br>";
        $query = "SELECT referencia FROM `referencia` WHERE id = $idsm";
        $sM = $this->_admin->listar($query); #print_r($sM); echo "<br>"; 
        $query = "INSERT INTO `log`(`fecha`, `hora`, `referencia`, `nombre`, `accion`, `modelo`, `sub_modelo`, `usuario` , `submodelo_id`) VALUES ('".$fecha."','".$hora."','".$referencia."','".$gru[0]['nombre']."','".$accion."','".$model[0]['referencia']."','".$sM[0]['referencia']."','".$user[0]['nombre'].' '.$user[0]['apellido']."' , $idsm)"; 
        $this->_admin->insertar($query);
    }

}?>