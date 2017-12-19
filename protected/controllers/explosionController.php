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
			//$this->_explosion->listar_archivos($idt);
			echo json_encode($arreglo);
		}

		public function validarcierre($hoy,$idt){
			$query ="SELECT * from explosion where fecha = '".$hoy."' and unidad_negocio_id = $idt";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		function insertarexplosion($fecha,$codigot,$idt){
			$directorio = BASE_URL.'public/archivos/';
			$ruta = $directorio.$fecha."-".$codigot.".txt";
         	$lineas = count(file($ruta));
         	$fechaexp = date('Y-m-d');

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
        	$rec[] = $this->ingredientesexplosion($info[$j]['codigo'],$idt,false);
        	
            for ($m=0; $m <=count($rec) ; $m++) { 
            		if (isset($rec[$m][$j]['recetaing'])) {
						$idrece = $rec[$m][$j]['recetaing'];
						$sub[] = $this->subrecetas($idrece);
						$rec[] = $sub;
					}
            }
            
        }
        for ($i=0; $i <count($info) ; $i++) { 
    	$query = "INSERT INTO `explosion`(`fecha`, `grupo`, `codigo_prod`, `producto`, `cantidad`, `monto`, `porcentaje_vta`, `costo`, `costo_total`, `porcentaje_costo`, `unidad_negocio_id`) 
    		VALUES ('".$fechaexp."','".$info[$i]['grupo']."','".$info[$i]['codigo']."','".$info[$i]['descripcion']."','".$info[$i]['cantidad']."','".$info[$i]['monto']."','".$info[$i]['porcentajeVentas']."','".$info[$i]['costo']."','".$info[$i]['costoTotal']."','".$info[$i]['porcentajeCosto']."',$idt)";
    		$explo[] = $this->_main->insertar($query);
		}print_r($rec);
    		
    	}
        
        //$separado = $this->separaringredientes($ingredientes);
                //print_r($rec);
		

		function ingredientesexplosion($info,$idt){
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
		    		for ($j=0; $j <=count($ingredientes) ; $j++) {
						if (isset($ingredientes[$i][$j]['idi'])) {
							$nuevo[] = array('iding'=>$ingredientes[$i][$j]['idi'],
		                               	 'codigoing' =>$ingredientes[$i][$j]['codigi'],
		                                 'cantidad'=>$ingredientes[$i][$j]['cantidad'],
		                                 'abreviatura'=>$ingredientes[$i][$j]['abreviatura'],
		                                 'ingredientes'=>$ingredientes[$i][$j]['ingrediente'],
		                                 'costo'=>$ingredientes[$i][$j]['costo'],
		                                 'idreceta'=>$ingredientes[$i][$j]['idreceta'],
		                                 'recetaing'=>$ingredientes[$i][$j]['recetaing'],
		                             	 'idpadre'=>$ingredientes[$i][$j]['idprod'],
		                                 'padre'=>$ingredientes[$i][$j]['producto']);
						}					 					
					}
				}
			return $nuevo;
		}

		function subrecetas($idreceta){
			$query = "SELECT mercancia.id as idi, mercancia.receta_id, mercancia.codigo as codigi, mercancia.receta_id as recetaing, ixr.cantidad, abreviatura, mercancia.nombre as producto, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, format(mercancia.precio_unitario,2,'de_DE') as costo, mercancia.precio_unitario as precioU, ixr.receta_id as idreceta, receta.nombre as receta, CONCAT(mercpadre.nombre, ' ', mercpadre.marca) as ingredientep, mercpadre.id as idpadre
					FROM `mercancia`
					inner join ingrediente_has_receta as ixr on mercancia.id = ixr.ingrediente_id
					inner join receta on receta.id = ixr.receta_id
                    inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
                    left join receta as receta2 on receta2.id = mercancia.receta_id
                    left join ingrediente_has_receta as ixr2 on ixr2.receta_id = receta2.id
                    left join mercancia as mercpadre on ixr2.ingrediente_id = mercpadre.id
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
		                                 'costo'=>$ingredientes[$k]['precioU'],
		                                 'idreceta'=>$ingredientes[$k]['idreceta'],
		                                 'recetaing'=>$ingredientes[$k]['recetaing'],
		                             	 'idpadre'=>$ingredientes[$k]['idpadre'],
		                                 'padre'=>$ingredientes[$k]['ingredientep']);
							
						}
						
					 					
					}//print_r($subreceta);
					return $subreceta;
		}

			
			
		



		
	}
?>