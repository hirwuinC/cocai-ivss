<?php 
	class inventarioController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_inventario;
		
		public function __construct(){
	
			parent::__construct();
			$this->_admin = $this->loadModel('administracion');
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

		function inicio($tienda){
			$this->_view->setCss(array('datatable/css/dataTables.bootstrap'));
            $this->_view->setCss(array('datatable/css/jquery.datatable.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setjs(array('datatable/js/jquery.dataTables.min'));
		    $this->_view->setJs(array('datatable/js/dataTables.bootstrap.min'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            $this->_view->setJs(array('js/grupo'));
            Session::time();
			$query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.descripcion, mercancia.cantidad_inventariada, mercancia.status, referencia.referencia as 'unidad_medida', ref.referencia as 'familia', modelo.id as 'idM', modelo.nombre as 'modelo', model.nombre as 'subM' FROM `unidad_negocio` inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id inner join modelo on modelo.id = modelo_has_submodelo.modelo_id inner join modelo as model on model.id = modelo_has_submodelo.sub_modelo_id inner join mercancia_has_unidad_negocio on mercancia_has_unidad_negocio.unidad_negocio_id = unidad_negocio.id inner join mercancia on mercancia.id = mercancia_has_unidad_negocio.mercancia_id inner join referencia on referencia.id = mercancia.unidad_medida_id inner join referencia as ref on ref.id = mercancia.familia_id WHERE unidad_negocio.id = $tienda ORDER BY mercancia.status = 1"; 
			$valores = $this->_admin->listar($query); #print_r($valores);
			$cantidad= count($valores);
			if ($cantidad > 0) {
				$this->_view->g = $valores;	
				$this->_view->render('inicio', 'grupo', '','');
			}else{
				$query = "SELECT referencia.id as 'submodelo_id' ,referencia.referencia as 'subM', ref1.id as 'idmodelo', ref1.referencia as 'modelo' FROM `referencia` INNER JOIN referencia as ref1 on ref1.id = referencia.padre_id WHERE referencia.id = $subM"; 
				$valores = $this->_admin->listar($query);
				$valores[0]['nombre'] = 'vacio'; 
				//print_r($valores);
				$this->_view->g = $valores;	
				$this->_view->render('inicio', 'inventario', '','');
			}
			
			
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