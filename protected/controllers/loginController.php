<?php
	class loginController extends Controller {
		private $_login;
		public function __construct() {
			parent::__construct();
			$this->_login = $this->loadModel('login');
			$this->_main = $this->loadModel('main');
			$this->_sidebar_menu = false;
		}
		
		function index() {
					
			if (Session::get('authenticated')) {
				$this->_view->redirect('');
			}else {
			//	$this->_view->render('access','','login');
				$this->_view->render('access', '','login');
			}
			
			
		}
		
		public function signIn($valor=false) {
			
						
			if ($_SERVER['REQUEST_METHOD'] == 'POST') {
				//echo $_POST['password']; 
				if ((empty($_POST['password']))) {
					$this->_view->_error = Controller::getBoxAlert(
							'Campos requeridos', 
							'Debe suministrar un nombre de usuario y una contrase&ntilde;a validos para el acceso.',
							'danger'
					);
					$this->_view->render('access', '','login');
					exit();
				}
				
				$data = $this->_login->getUser($_POST['password']); #print_r($data); exit();
				
				if (!$data) {
					$this->_view->_error = Controller::getBoxAlert(
							'Usuario no Existente O Contrase&ntilde;a Incorrecta', 
							'',
							'danger'
					);
					$this->_view->render('access', '','login');
					exit();
				}
				if ($valor == 1) {
					Session::set('header',$valor);
				}
				
				
				Session::set('clave', $_POST['password']);
				Session::set('idUsuario', $data['id']);
				Session::set('authenticated', true);
				$privilegio = Session::modelo('idUsuario');
				Session::set('level', $data['tipoU']);
				Session::set('time', time());
				$bussines= Session::empresa('idUsuario');
				  if (!empty($bussines)) {
				    $privilegios = 'e';
				  }else{
				    $privilegios = 't';
				  }
				$r = $this->_main->contarrequisiciones($privilegios);
				Session::set('requisiciones', $r);
				if (empty($privilegio)) {
					$this->_view->_error = Controller::getBoxAlert(
							'El usuario no tiene marca asignada, para su administracion.', 
							'',
							'danger'
					);
					$this->_view->render('access', '','login');
					exit();
				}
				//Session::set('level', $data['perfil']);
				//exit();
				switch ($data['tipoU']) {
					case 'Super usuario':
						Session::set('user', 'Sr(a). '.$data['nombre'].', '.$data['apellido']);
						$this->_view->redirect('index','index');
					break;
					
					default:
						Session::set('user', $data['nombre'].', '.$data['apellido']);
						$this->_view->redirect('index','index');
					break;
				}
			}else {
				$this->_view->render('access', '','login');
			}
		}
			
		public function close($param=false) {
			Session::destroy();
			$this->_view->redirect('login',$this->_sidebar_menu);
		}


	
	}
?>