<?php 
	class administracionController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_admin;
		
		public function __construct(){
	
			parent::__construct();
			$this->_admin = $this->loadModel('administracion');
			$this->_main = $this->loadModel('main');
		//Objeto donde almacenamos todas las funciones de PersonsModel.php

			$this->_sidebar_menu =array(
					array(
				'id' => 'insert_new',
				'title' => 'Nueva Persona',
				'link' => BASE_URL . 'persons' . DS . 'insert'
						)
										);
		}
		
		function index(){
			$this->_view->setCss(array('datatable/css/dataTables.bootstrap'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setjs(array('datatable/js/jquery.dataTables.min'));
		    $this->_view->setJs(array('datatable/js/dataTables.bootstrap.min'));
		    $this->_view->setJs(array('datatable/js/tabla'));
            $this->_view->setJs(array('js/subM'));
			$query = "SELECT mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.descripcion, mercancia.cantidad_inventariada, mercancia.contenido_neto, mercancia.stock_minimo, mercancia.stock_maximo, mercancia.status, mercancia.precio_unitario, unidad_medida.id as 'idUM',unidad_medida.unidad, unidad_medida.abreviatura, ref.referencia as 'familia' FROM `mercancia` inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_compra_id inner join referencia as ref on ref.id = mercancia.familia_id order by ref.referencia ASC";
			$valores = $this->_main->select($query);
			$this->_view->mercancia=$valores;
			$this->_view->render('inicio', 'administracion', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}


			
			function insert(){
				$this->_view->setJs(array('js/insertPerson'));
				//Si hay una solicitud via POST
				if ($_SERVER['REQUEST_METHOD']=='POST') {
				
		//Guardamos en un arreglo  lo que recibimos via POST de la vista
				$persona = array(
					':cedula' => $_POST['cedula'] ,
					':nombre' => $_POST['nombre'] ,
					':apellido' => $_POST['apellido'] ,
					':sexo' => $_POST['sexo'] ,
					':fecha_nacimiento' => $_POST['fecha_nacimiento'] ,
					':telefono' => $_POST['telefono'],
					':correo' => $_POST['correo']  
					);
	//enviamos ala funcion Insert en el modelo de personas el arreglo 
			$this->_person->insertPerson($persona);	
						 // metodo  arreglo
			$this->_view->redirect('persons/listing');
				}else{ 
					// se muestra la ventana si no es via post.
					$this->_view->render('insert', 'persons', '',$this->_sidebar_menu);
				}
			}



			function listing(){
		//llamamos a la funcion getPersons en el modelo y Guardamos en
		// la variable $listado  guarda el resultado de la funcion GetPersons
		//para luego ser enviada a la vista en el objeto _listado
				$listado = $this->_person->getPersons();
				$this->_view->_listado = $listado;
				
				$this->_view->render('listing', 'persons', '',$this->_sidebar_menu);
			}



		
		function update($id = false){
			//Si le damos al boton modificar.
				if ($_SERVER['REQUEST_METHOD']=='POST') {
		//guardamos en un arreglo los valores enviados desde la vista
				//para luego enviarlos a la funcion UpdatePerson
					$persona = array(
							':id' => $_POST['id'] ,
							':cedula' => $_POST['cedula'] ,
							':nombre' => $_POST['nombre'] ,
							':apellido' => $_POST['apellido'] ,
							':sexo' => $_POST['sexo'] ,
							':fecha_nacimiento' => $_POST['fecha_nacimiento'] ,
							':telefono' => $_POST['telefono'],
							':correo' => $_POST['correo']  
						);
					$this->_person->updatePerson($persona);	
						 // metodo  arreglo
					$this->_view->redirect('persons/update/'.$persona[':id']);
					//OJO redireccionamos a persona update MAS EL ID de la persona, 
					//para que vea los cambios

				}else{//si no mostramos igual.

		//llamamos a la funcion getPergetUnicaPersona en el modelo la cual
		// le pasamos el id, Guardamos en la variable $person el resultado 
		//de la funcion getUnicaPersona
		//para luego ser enviada a la vista en el objeto _persona

					$persona = $this->_person->getUnicaPersona($id);
					$this->_view->_persona = $persona;
					$this->_view->render('update', 'persons', '',$this->_sidebar_menu);

				}
		}




		function delete($id){

			$this->_person->deletePersons($id);
			$this->_view->redirect('persons/listing');

		}
		
		
		
		function select(){
			$this->_view->setJs(array('js/persons'));
			$this->_view->render('select', 'persons', '',$this->_sidebar_menu);

		}
		
		function loadSexo(){

				 	$result = $this->_person->getSexo();
					$data = array();
					for ($i = 0; $i < count($result); $i++) {
						$data[$i] = array("value"=>$result[$i]['id'],"option"=>$result[$i]['sexo']);
					}
					echo json_encode($data);

		}
		
		

	
	
	
	









}?>