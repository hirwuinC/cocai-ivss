<?php 
	class explosionController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_explosion;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			$this->_explosion = $this->loadModel('explosion');

			/*$this->_sidebar_menu =array(
					array(
				'id' => 'insert_new',
				'title' => 'Nueva Persona',
				'link' => BASE_URL . 'persons' . DS . 'insert'
						)
			);*/

			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index($id=false){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/explosiones'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    
    		$query = "SELECT unidad_negocio.id as idU, unidad_negocio.codigo, unidad_negocio.nombre as udn, modelo.nombre as modelo From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $id";
    		$mo = $this->_main->select($query);
    		$this->_view->model = $mo;
			$this->_view->render('index', 'explosion', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function cargarankings(){
			$result = false;
			$carpeta = 'public/archivos/';
		    if(is_dir($carpeta)){
		        if($dir = opendir($carpeta)){
		        	$i=0;
		            while(($archivo = readdir($dir)) !== false){		              
		                if($archivo != '.' && $archivo != '..' && $archivo != '.htaccess'){
		                  	$arreglo[] = $archivo;
		                    //echo '<li><a target="_blank" href="'.$carpeta.'/'.$archivo.'">'.$archivo.'</a></li>';
		                }
		                $i++;
		            }//print_r($result);
		            closedir($dir);
		        }
		    }
			
			echo json_encode($arreglo);
		}

		public function validarcierre($hoy,$idt){
			$query ="SELECT * from explosion where fecha_ranking = '".$hoy."' and unidad_negocio_id = $idt";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		function insertarexplosion($fecha,$codigot,$idt){
			$directorio = BASE_URL.'public/archivos/';
			$ruta = $directorio.$fecha."-".$codigot.".txt";
         	$lineas = count(file($ruta));
         	$fechaexp = date('Y-m-d');
         	$dia = substr($fecha, -2);
         	$mes = substr($fecha, -4, 2);
         	$year = substr($fecha, 0, 4);
         	$fecharanking = $year."-".$mes."-".$dia;

         //echo $ruta."<br>".$valor['t']."<br>".$lineas."<br>"; 
         $fp= fopen($ruta,"r");
         $arrayfichero=file($ruta); // print_r($arrayfichero); exit();
        for ($j=0; $j < $lineas; $j++) { 
            list($grupo,$cod,$descripcion,$cantidad,$monto,$porcentajeVentas,$costo,$costoTotal,$porcentajeCosto) = explode(',',$arrayfichero[$j]);
            $gru[$j]= $grupo;
            $pro[$j]=$cod;
            $info[$j]=array('grupo'=>$grupo,
                            'codigo' =>$cod,
                            'descripcion'=>$descripcion,
                            'cantidad'=>$cantidad,
                            'monto'=>$monto,
                            'porcentajeVentas'=>$porcentajeVentas,
                            'costo'=>$costo,
                            'costoTotal'=>$costoTotal,
                            'porcentajeCosto'=>$porcentajeCosto);
            $receid[] = $this->validarrecetas($info[$j]['codigo']);
            
            $query = "INSERT INTO `explosion`(`fecha`, `fecha_ranking`, `grupo`, `codigo_prod`, `producto`, `cantidad`, `monto`, `porcentaje_vta`, `costo`, `costo_total`, `porcentaje_costo`, `unidad_negocio_id`) 
    		VALUES ('".$fechaexp."','".$fecharanking."','".$info[$j]['grupo']."','".$info[$j]['codigo']."','".$info[$j]['descripcion']."','".$info[$j]['cantidad']."','".$info[$j]['monto']."','".$info[$j]['porcentajeVentas']."','".$info[$j]['costo']."','".$info[$j]['costoTotal']."','".$info[$j]['porcentajeCosto']."',$idt)";
    		$explo[] = $this->_main->insertar($query);
            if (!isset($receid[$j][0]['receta_id'])) {
            	$this->resultadoexplosion($info[$j],$explo[$j]);
            }else{
            	$rec = $this->ingredientesexplosion($info[$j]['codigo'],$idt,$info[$j]['cantidad']);
        	
	            for ($m=0; $m <count($rec) ; $m++) { 
	            	//echo $rec[$m]['recetaing']."<br>";
	            		if (isset($rec[$m]['recetaing'])) {
							$idrece = $rec[$m]['recetaing'];
							$sub = $this->subrecetas($idrece,$explo[$j]);
							//echo "rec"; print_r($rec);  echo "<br>";
							//echo "if cantidad: ".$rec[$m]['cantidad']."<br>";
						}else{
							//echo "en el otro else<br>";
							//echo "rec"; print_r($rec);  echo "<br>";
							//echo "else cantidad: ".$rec[$m]['cantidad']."<br>";
							$this->resultadoexplosion($rec[$m],$explo[$m]/*,$rec[0]['cantidad'],$rec[0]['unidad_medida_id']*/);
						}
	            }
            }
        	
            
        }//print_r($receid); echo "sip <br><br>";
        //print_r($rec);
    		//echo count($receid); print_r($receid);
    	}
        
        //$separado = $this->separaringredientes($ingredientes);
                //print_r($rec);
		

		function ingredientesexplosion($info,$idt,$cantidad){
			//echo($info)."<br>";
			//echo($idt)."<br>";
			//echo($cantidad)."<br>";
				for ($i=0; $i <count($info) ; $i++) { 
					$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, mercancia.contenido_neto, mhudn.existencia, ixr.cantidad, ixr.unidad_medida_id, unidad_medida.abreviatura, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, producto.id as idprod, producto.nombre as producto, format(mercancia.precio_unitario,2,'de_DE') as costo, mercancia.precio_unitario as precioU, receta.id as idreceta, mercancia.receta_id as recetaing, receta.nombre as receta, unidad_sistema.id as 'idUMS',unidad_sistema.unidad as 'unidadS', unidad_sistema.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', formula_c, formula_p, formula_s, cantidad_presentacion
	        	FROM `ingrediente_has_receta` as ixr
				inner join receta on receta.id = ixr.receta_id
				inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
				inner join mercancia on mercancia.id = ixr.ingrediente_id
				left join receta as sub on sub.id = mercancia.receta_id 
				inner join mercancia_has_unidad_negocio as mhudn on mhudn.mercancia_id = mercancia.id
	            inner join unidad_negocio on mhudn.unidad_negocio_id = unidad_negocio.id
				inner join producto on receta.id = producto.receta_id
				inner join unidad_medida as unidad_sistema on unidad_sistema.id = mercancia.unidad_medida_sistema_id
				inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
				inner join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id
				WHERE producto.codigo = '".$info."' and unidad_negocio.id = $idt ";
	    		$ingredientes[] = $this->_main->select($query);
	    		//echo "ingredientes:"; print_r($ingredientes); echo "<br>";
		    		for ($j=0; $j <=count($ingredientes) ; $j++) {
						if (isset($ingredientes[$i][$j]['idi'])) {
							//echo $ingredientes[$i][$j]['idi'];
							$nuevo[] = array('iding'=>$ingredientes[$i][$j]['idi'],
		                               	 'codigoing' =>$ingredientes[$i][$j]['codigi'],
		                                 'cantidad'=>$ingredientes[$i][$j]['cantidad'],
		                                 'abreviatura'=>$ingredientes[$i][$j]['abreviatura'],
		                                 'ingredientes'=>$ingredientes[$i][$j]['ingrediente'],
		                                 'unidad_medida_id'=>$ingredientes[$i][$j]['unidad_medida_id'],
		                                 'costo'=>$ingredientes[$i][$j]['costo'],
		                                 'idreceta'=>$ingredientes[$i][$j]['idreceta'],
		                                 'recetaing'=>$ingredientes[$i][$j]['recetaing'],
		                             	 'idpadre'=>$ingredientes[$i][$j]['idprod'],
		                                 'padre'=>$ingredientes[$i][$j]['producto']);
						}					 					
					}
				}
				//print_r($nuevo);

			return $nuevo;
		}

		function subrecetas($idreceta,$explo){
			//echo "id=";print_r($idreceta); echo "<br><br>";
			$query = "SELECT mercancia.id as idi, mercancia.receta_id, mercancia.codigo as codigi, mercancia.receta_id as recetaing, ixr.cantidad, abreviatura, mercancia.nombre as producto, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, format(mercancia.precio_unitario,2,'de_DE') as costo, mercancia.precio_unitario as precioU, ixr.receta_id as idreceta, receta.nombre as receta, ixr.unidad_medida_id
					FROM `mercancia`
					inner join ingrediente_has_receta as ixr on mercancia.id = ixr.ingrediente_id
					inner join receta on receta.id = ixr.receta_id
                    inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
                    WHERE ixr.receta_id = $idreceta";
					$ingredientes = $this->_main->select($query);
					//print_r($ingredientes);
					for ($k=0; $k <=count($ingredientes) ; $k++) {
						if (isset($ingredientes[$k]['idi'])) {
							$subreceta[] = array('iding'=>$ingredientes[$k]['idi'],
		                               	 'codigoing' =>$ingredientes[$k]['codigi'],
		                                 'cantidad'=>$ingredientes[$k]['cantidad'],
		                                 'abreviatura'=>$ingredientes[$k]['abreviatura'],
		                                 'ingredientes'=>$ingredientes[$k]['ingrediente'],
		                                 'unidad_medida_id'=>$ingredientes[$k]['unidad_medida_id'],
		                                 'costo'=>$ingredientes[$k]['precioU'],
		                                 'idreceta'=>$ingredientes[$k]['idreceta'],
		                                 'recetaing'=>$ingredientes[$k]['recetaing']);
							
						}
						if (isset($subreceta[$k]['recetaing'])) {
							//echo $subrece[$k]['recetaing']."<br>";
							$idrc = $subreceta[$k]['recetaing'];
							$subs = $this->subrecetas($idrc,$explo);
							//echo "en el if<br>";
							for ($i=0; $i <count($subs) ; $i++) { 
								if (!isset($subs[$i]['recetaing'])) {
									$this->resultadoexplosion($subs[$i],$explo/*,$subs[0]['cantidad'],$subs[0]['unidad_medida_id']*/);
								}
								
							}
							
						}
					 					
					}
					
					return $subreceta;
		}

		function resultadoexplosion($receta){
			echo "a";print_r($receta); echo "<br><br>";
			//exit();
		}

		function validarrecetas($codigop){
			$query = "SELECT id, receta_id FROM producto where codigo ='".$codigop."'";
			$datosprod = $this->_main->select($query);
			//print_r($datosprod);
			return $datosprod;
		}

			
			
		



		
	}
?>