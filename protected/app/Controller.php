<?php
	abstract class Controller {
		
		protected $_view;
		
		public function __construct() {
			$this->_view = new View(new Request);
		}
	
		abstract public function index();
	
		protected function loadModel($model) {
			
			$model = $model . 'Model';
			$model_route = ROOT . 'protected' . DS . 'models' . DS . $model . '.php';
						
			if (is_readable($model_route)) {
				
				require_once $model_route;
				$model = new $model;
				return $model;
				
			}else {
				
				throw new Exception('EL ARCHIVO: "'. $model_route .'" NO ENCONTRADO.');
				
			}
		}
		
		protected function getLibrary($lib) {
			$route = ROOT . 'libs' . DS . $lib . '.php';
			if (is_readable($route)) {
				require_once $route;
			}else{
				throw new Exception('Error de libreria');
			}
		}
		
		public static function varDump($ar = array()) {
			echo '<pre>';
				print_r($ar);
			echo '</pre>';
		}
		
		public static function saveDate($date) {
			
			$result = date("Y-m-d", strtotime($date) );
			return $result;
		}
		
		public static function getDate($date) {
			
			$result = date("d-m-Y", strtotime($date) );
			return $result;
		}
		
		/**
		 * Metodo para redimencionar una imagen y subirla al servidor
		 * 
		 * las dimeciones standar para una foto carnet son 240 x 320
		 * y para una cedula 640 x 480
		 * 
		 * @param $file: 	input[type=file]
		 * @param $pre:		pic_, dni_, car_
		 * @param $name:	nombre img
		 * @param $width:	ancho
		 * @param $height:	alto
		 */
		
		
		public static function modelSession() {
			$model = 'sessionModel';
			$model_route = ROOT . 'protected' . DS . 'models' . DS . $model . '.php';
						
			if (is_readable($model_route)) {				
				require_once $model_route;
				$model = new $model;
				return $model;				
			}else {				
				throw new Exception('EL ARCHIVO: "'. $model_route .'" NO ENCONTRADO.');				
			}
		}
		
		
		
		/**
		 * 
		 * @param unknown $title
		 * @param unknown $content
		 * @param unknown success, info, warning or danger
		 * @return string
		 */
		public static function getBoxAlert($title, $content, $type) {
			$messeger = '
				<div class="alert alert-'.$type.' ">
					<a class="close" data-dismiss="alert" href="#"><i class="fa fa-close"></i></a>
						<h4> <i class="icon-remove-sign"></i>
							'.$title.'
                        </h4>
						'.$content.'
				</div>';
			return $messeger;
		}


		public function formula($unidadMedida, $cantidad=false, $cantidadComprada, $contenidoNeto=false, $formulaC){
			list($unidad, $signo, $contenidoNeto) = explode(" ", $formulaC);
			switch ($signo) {
				case '*':
					switch ($unidadMedida) {
						case '26':
							#ESTA FORMULA ES PARA CALCULAR LOS PRODUCTOS QUE SU COMPRA ES EN METROS
							$conversion = $cantidadComprada * 100;
						break;
				
						default:
							$cantidadTotal = 0;
							if (empty($cantidad)) {
								#ESTA FORMULA ES PARA CALCULAR LOS PRODUCTOS QUE SU COMPRA ES EN PEQUEÑAS CANTIDADES
								$conversion = $cantidadComprada*$contenidoNeto;
							}else{
								#ESTA FORMULA ES PARA CALCULAR LOS PRODUCTOS QUE SU COMPRA ES EN GRANDES CANTIDADES
								$cantidadTotal = $cantidad*$cantidadComprada;
								$conversion = $cantidadTotal*$contenidoNeto;
							}
							#ESTA FORMULA ES PARA CALCULAR LOS PRODUCTOS QUE VIENEN POR UNIDADES
							if (empty($contenidoNeto)) {
								$conversion = $cantidad*$cantidadComprada;
							}
						break;
					}
					break;
				case '/':
					switch ($unidadMedida) {
						case '26':
							#ESTA FORMULA ES PARA CALCULAR LOS PRODUCTOS QUE SU COMPRA ES EN METROS
							$conversion = $cantidadComprada * 100;
						break;
						
						default:
							$cantidadTotal = 0;
							if (empty($cantidad)) {
								#ESTA FORMULA ES PARA CALCULAR LOS PRODUCTOS QUE SU COMPRA ES EN PEQUEÑAS CANTIDADES
								$conversion = $cantidadComprada/$contenidoNeto;
							}else{
								#ESTA FORMULA ES PARA CALCULAR LOS PRODUCTOS QUE SU COMPRA ES EN GRANDES CANTIDADES
								$cantidadTotal = $cantidad/$cantidadComprada;
							    $conversion = $cantidadTotal/$contenidoNeto;
							}
							#ESTA FORMULA ES PARA CALCULAR LOS PRODUCTOS QUE VIENEN POR UNIDADES
							if (empty($contenidoNeto)) {
								$conversion = $cantidad/$cantidadComprada;
							}
						break;
					}
					break;
			}
			return $conversion;
		}

		

		public function conversion($producto){
			for ($i=0; $i < count($producto); $i++) {
				if ($producto[$i]['contenido_neto']!=0.0000) {
					$unidadPresentacion = $producto[$i]['existencia'] / $producto[$i]['contenido_neto'];
				$unidadCompra = $unidadPresentacion / $producto[$i]['cantidad_presentacion'];
				$producto[$i]['canCompra']=$unidadCompra;
				$producto[$i]['canConsumo']=$unidadPresentacion; 
				$producto[$i]['conversion']= $unidadCompra.' '.$producto[$i]['unidadC']. ' = '.$unidadPresentacion.' '.$producto[$i]['unidadP'].'.<br> '.$unidadPresentacion.' '.$producto[$i]['unidadP'].' = '.$producto[$i]['existencia'].' '.$producto[$i]['unidadS'].'.';
				}else{
					$unidadPresentacion = $producto[$i]['existencia'];
					$producto[$i]['canConsumo']=$unidadPresentacion; 
					$producto[$i]['conversion']= $unidadPresentacion.' '.$producto[$i]['unidadP'].'.<br> '.$unidadPresentacion.' '.$producto[$i]['unidadP'].' = '.$producto[$i]['existencia'].' '.$producto[$i]['unidadS'].'.';
				}
				
			}
            return $producto;
		}

		

	    


				
	}
?>