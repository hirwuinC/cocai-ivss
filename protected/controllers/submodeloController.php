<?php 
	class submodeloController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_sub;
		
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
           // Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index(){
			$this->_view->render('index', 'producto', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function inicio($modelo){
			$this->_view->setCss(array('datatable/css/dataTables.bootstrap'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setjs(array('datatable/js/jquery.dataTables.min'));
		    $this->_view->setJs(array('datatable/js/dataTables.bootstrap.min'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            $this->_view->setJs(array('js/subM'));
            Session::time();
			$query = "SELECT referencia.id as 'idmodelo', referencia.referencia as 'modelo', ref1.id as 'idsm', ref1.referencia as 'subM' FROM `referencia` INNER JOIN referencia as ref1 on ref1.padre_id = referencia.id WHERE referencia.id= $modelo and ref1.referencia NOT in ('Sin asignar')"; 
			$valores = $this->_admin->listar($query);
			$this->_view->sm = $valores;
			//print_r($valores);
			//exit();	
			$this->_view->render('inicio', 'submodelo', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function insert(){
			if ($_SERVER['REQUEST_METHOD']=='POST') {		
			//Guardamos en un arreglo  lo que recibimos via POST de la vista
			    $query = "INSERT INTO `referencia`(`referencia`, `padre_id`) VALUES ('".$_POST['subModelo']."',".$_POST['modelo'].")";
				$idRegistro = $this->_admin->insertar($query);	
				$resultado=strtoupper($_POST['subModelo']);
		        $inicial1 = substr($resultado, 0, 1);
		        $inicial2 = substr($resultado, 1, 1);
		        $siglas = $inicial1.$inicial2;
		        $query="INSERT INTO sigla (nombre, sub_modelo_id) values ('".$siglas."',$idRegistro)"; 
		        $r2=$this->_admin->insertar($query);
                $accion = 'Creado';
                $this->log($_POST['modelo'],$idRegistro,$accion); 
				$this->_view->redirect('submodelo/inicio/'.$_POST['modelo']);
			}else{ 
				$this->_view->render('inicio', 'submodelo', '','');
				}
		}

		function update(){
			if ($_SERVER['REQUEST_METHOD']=='POST') {
				//echo $_POST['idm']."<br>"; exit();
				$query = "UPDATE `referencia` SET `referencia`='".$_POST['subModelo']."' WHERE `id`= ".$_POST['idsm']."";
				$this->_admin->modificar($query);
		        $resultado=strtoupper($_POST['subModelo']);
		        $inicial1 = substr($resultado, 0, 1);
		        $inicial2 = substr($resultado, 1, 1);
		        $siglas = $inicial1.$inicial2;
		        $query = "UPDATE sigla SET nombre= '".$siglas."' WHERE sub_modelo_id=".$_POST['idsm']."";
		        $r2 = $this->_admin->modificar($query);
                $accion = 'Modificado';
                $this->log($_POST['idm'],$_POST['idsm'],$accion); 	
				$this->_view->redirect('submodelo/inicio/'.$_POST['idm']);

			}else{
				$this->_view->redirect('submodelo/inicio/'.$_POST['idm']);

			}
		}

		function delete($idsm, $idm){
			//echo $idm.' '.$idsm; exit();
			$query = "SELECT * from grupo where submodelo_id = $idsm";
            $g = $this->_admin->listar($query);
            $lista = count($g);
            
            if ($lista > 0){
            for ($i=0; $i < count($g); $i++) { 
                //evaluar idmodelo para saber cual submodelo asignar
                switch ($idm) {
                    case '31':
                        $query ="UPDATE grupo set submodelo_id = 136 where submodelo_id = $idsm";
                        $this->_admin->modificar($query);
                        break;
                    case '32':
                        $query ="UPDATE grupo set submodelo_id = 137 where submodelo_id = $idsm";
                        $this->_admin->modificar($query);
                        break;
                    case '33':
                        $query ="UPDATE grupo set submodelo_id = 138 where submodelo_id = $idsm";
                        $this->_admin->modificar($query);
                        break;
                    case '34':
                        $query ="UPDATE grupo set submodelo_id = 139 where submodelo_id = $idsm";
                        $this->_admin->modificar($query);
                        break;
                    case '35':
                        $query ="UPDATE grupo set submodelo_id = 140 where submodelo_id = $idsm";
                        $this->_admin->modificar($query);
                        break;
                    case '36':
                        $query ="UPDATE grupo set submodelo_id = 141 where submodelo_id = $idsm";
                        $this->_admin->modificar($query);
                        break;
                    case '43':
                        $query ="UPDATE grupo set submodelo_id = 142 where submodelo_id = $idsm";
                        $this->_admin->modificar($query);
                        break;
                    
                }
                
            }
            } 

            $query = "SELECT * from producto where sub_modelo_id = $idsm";
            $prod = $this->_admin->listar($query);
            $lista2 = count($prod);

            if ($lista2 > 0){

                for ($i=0; $i < count($prod); $i++) { 
                    //evaluar idmodelo para saber cual submodelo asignar
                    switch ($idm) {
                        case '31':
                            $query ="UPDATE producto set sub_modelo_id = 136 where sub_modelo_id = $idsm";
                            $this->_admin->modificar($query);
                            break;
                        case '32':
                            $query ="UPDATE producto set sub_modelo_id = 137 where sub_modelo_id = $idsm";
                            $this->_admin->modificar($query);
                            break;
                        case '33':
                        //echo "ando por aqui por los productos";
                            $query ="UPDATE producto set sub_modelo_id = 138 where sub_modelo_id = $idsm";
                            $this->_admin->modificar($query);
                            break;
                        case '34':
                            $query ="UPDATE producto set sub_modelo_id = 139 where sub_modelo_id = $idsm";
                            $this->_admin->modificar($query);
                            break;
                        case '35':
                            $query ="UPDATE producto set sub_modelo_id = 140 where sub_modelo_id = $idsm";
                            $this->_admin->modificar($query);
                            break;
                        case '36':
                            $query ="UPDATE producto set sub_modelo_id = 141 where sub_modelo_id = $idsm";
                            $this->_admin->modificar($query);
                            break;
                        case '43':
                            $query ="UPDATE producto set sub_modelo_id = 142 where sub_modelo_id = $idsm";
                            $this->_admin->modificar($query);
                            break;
                        
                    }
                    
                }
            } //exit();
            $accion = 'Eliminado';
            $this->log($idm,$idsm,$accion);
            $query = "DELETE FROM sigla WHERE sub_modelo_id=$idsm"; //exit();
            $this->_admin->eliminar($query);
            $query = "DELETE FROM `referencia` WHERE id = $idsm";
            $resultado=$this->_admin->eliminar($query); 
            $query = "UPDATE unidad_negocio SET
                         sub_modelo_id = NULL
                         WHERE sub_modelo_id =$idsm";
            $this->_admin->modificar($query);   
                if (!empty($resultado)) {
                    $js = true;
                    echo json_encode($js);
                }else{
                    $js = false;
                    echo json_encode($js);
                }		}

        function nombreProAlert($id){
            $query = "SELECT referencia.id as 'id_submodelo', referencia.referencia as 'submodelo', ref1.id as 'idmodelo', ref1.referencia as 'modelo'FROM `referencia` INNER JOIN referencia as ref1 on ref1.id = referencia.padre_id where referencia.id = $id";
            $data = $this->_admin->listar($query);
            echo json_encode($data);
        }

        function log($idm,$idsm,$accion){
            $referencia='SubModelo';
            $fecha = date ('Y-m-d');
            $hora = date ('h:i:s');
            $idUser =Session::modelo('idUsuario');
            $query = "SELECT nombre, apellido FROM `usuario` WHERE id = ".$idUser[0][0]."";
            $user = $this->_admin->listar($query); #print_r($user); echo "<br>";
            $query = "SELECT referencia FROM `referencia` WHERE id = ".$idm."";
            $model = $this->_admin->listar($query); #print_r($model); echo "<br>";
            $query = "SELECT referencia FROM `referencia` WHERE id = ".$idsm."";
            $sM = $this->_admin->listar($query); #print_r($sM); echo "<br>"; 
            $query = "INSERT INTO `log`(`fecha`, `hora`, `referencia`, `accion`, `modelo`, `sub_modelo`, `usuario` , `submodelo_id`) VALUES ('".$fecha."','".$hora."','".$referencia."','".$accion."','".$model[0]['referencia']."','".$sM[0]['referencia']."','".$user[0]['nombre'].' '.$user[0]['apellido']."', $idsm)"; 
            $this->_admin->insertar($query);    
    }
 
}?>