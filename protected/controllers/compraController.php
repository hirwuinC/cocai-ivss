<?php 
	class compraController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_compra;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			$this->_compra = $this->loadModel('compra');
			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index($id=false){
			Session::destroy('productosC');
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $this->_view->setJs(array('js/facturas'));
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
			$this->_view->render('indexF', 'compra', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function datosproveedor($idprov){
			$query = "SELECT proveedor.id as idprov, proveedor.nombre as nombreprov, rif, razon_social, correo, proveedor.status as statusprov, ubicacion_id, edificio, calle, urbanizacion, nro_intercomunicador, punto_referencia, direccion.id as idparroq, direccion.nombre as parroquia, dir.id as idmuni, dir.nombre as municipio, dir2.id as idedo, dir2.nombre as estado, telefono.numero, referencia.referencia as cod_tlf, mercancia.id as idmerc, mercancia.codigo, mercancia.nombre, mercancia.marca, codigo_x_proveedor, precio, phm.status as statusmerc FROM `proveedor`
			inner join ubicacion on ubicacion.id = ubicacion_id
			inner join direccion on parroquia_id = direccion.id
			inner join direccion as dir on direccion.padre_id = dir.id
            inner join direccion as dir2 on dir.padre_id = dir2.id
			left join proveedor_has_telefono as pht on pht.proveedor_id = proveedor.id 
			left join telefono on pht.telefono_id = telefono.id
			left join referencia on referencia.id = telefono.codigo_id
			left join proveedor_has_mercancia as phm on phm.proveedor_id = proveedor.id
			left join mercancia on phm.mercancia_id = mercancia.id
			WHERE proveedor.id = $idprov";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		public function materiaprima($idt,$idprov){
			$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, unidad_medida_compra_id as umcid, unidad_medida_consumo_id as umpid, unidad_medida_sistema_id as umsid, umc.abreviatura as abumc, ump.abreviatura as abump, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) As ingrediente, mercancia.precio_unitario as precioU, mudn.existencia, format(mudn.existencia,4,'de_DE') as stock, stock_min, stock_max, format(mudn.stock_min,4,'de_DE') as stmin, format(mudn.stock_max,4,'de_DE') as stmax FROM `mercancia`
            left join unidad_medida as umc on umc.id = mercancia.unidad_medida_compra_id
            inner join unidad_medida as ump on ump.id = mercancia.unidad_medida_consumo_id
            inner join unidad_medida as ums on ums.id = mercancia.unidad_medida_sistema_id
            inner join mercancia_has_unidad_negocio as mudn on mudn.mercancia_id = mercancia.id
            inner join unidad_negocio on unidad_negocio.id = mudn.unidad_negocio_id
            left join proveedor_has_mercancia on mercancia.id = proveedor_has_mercancia.mercancia_id
            where mudn.unidad_negocio_id = $idt and familia_id != 135 and proveedor_id = $idprov";
            $data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}

		function ordenC($id,$success = false){
    		$this->_view->setJs(array('js/jquery-1.12.4'));
    		$this->_view->setJs(array('js/facturas'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
      		$this->_view->render('ordenescompra', 'compra', '','');
    	}

		public function tablaproductos($tipo,$idpro=false,$idt=false){
			//var_dump($_POST); exit();
			if (isset($_POST['cantidad'])) {
				$mystring = $_POST['cantidad'];
				$mystring2 = $_POST['precioc'];
				$findme   = ',';
				$pos = strpos($mystring, $findme);
				$pos1 = strpos($mystring2, $findme);
			
				if ($pos != false) {
					$p1 = str_replace(".","",$_POST['cantidad']);
	           		$cant = str_replace(",",".",$p1);
				}else{
					$cant = $_POST['cantidad'];
				}

				if ($pos1 != false) {
					$p2 = str_replace(".","",$_POST['precioc']);
	           		$monto = str_replace(",",".",$p2);
				}else{
					$monto = $_POST['precioc'];
				}
			}
			if (isset($_POST['idpro']) and isset($_POST['udn'])) {
				$id = $_POST['idpro'];
				$idt = $_POST['udn'];
			}else{
				$id = $idpro;
				$idt = $idt;
			}
			if (isset($_POST['impuesto']) and $_POST['impuesto'] >0) {
				$porcimpuesto = $_POST['impuesto'];
				$mul = $monto*$porcimpuesto;
				$impuesto = $mul/100;
			}else{
				$porcimpuesto = 0;
				$impuesto = 0;
			}
			if (isset($_POST['tipoimpuesto'])) {
				$tipoImp = $_POST['tipoimpuesto'];
				if ($tipoImp == 1) {
					$preciot = $monto;
					$monto = $preciot-$impuesto;
				}else{
					$preciot = $monto+$impuesto;
					$monto = $monto;
				}
			}
			
			
			
			if (isset($_POST['dctoporc']) and $_POST['dctoporc']>0) {
				$porcdescuento = $_POST['dctoporc'];
				$mul2 = $preciot*$porcdescuento;
				$descuento = $mul2/100;
			}else if (isset($_POST['dctomonto']) and $_POST['dctomonto']>0) {
				$descuento = $_POST['dctomonto'];
				$mul2 = $descuento*100;
				$porcdescuento = $mul2/$preciot;
			}else{
				$descuento = 0;
				$porcdescuento = 0;
			}
			if (isset($preciot) and isset($cant)) {
				$preciofinalU = $preciot-$descuento;
				$preciototal = $cant*$preciofinalU;
			}
			

			
			$query = "SELECT mercancia.id, nombre, marca,codigo, precio_unitario, mercancia.contenido_neto, um1.id as idums, um1.abreviatura as ums, um2.id as idump, um2.abreviatura as ump, mhudn.existencia, format(existencia,4,'de_DE') as stock, format(precio_unitario,4,'de_DE') as costo, formula_c FROM mercancia
			inner join unidad_medida as um1 on um1.id = mercancia.unidad_medida_sistema_id
			inner join unidad_medida as um2 on um2.id = mercancia.unidad_medida_consumo_id
			inner join mercancia_has_unidad_negocio as mhudn on mhudn.mercancia_id = mercancia.id
			where mercancia.id = $id and mhudn.unidad_negocio_id = $idt";
				$datos = $this->_main->select($query);

			if (isset($_SESSION['productosC'])) {
				$arreglo = $_SESSION['productosC'];
				//print_r($arreglo); echo "<br>";
				$encontro=false;
        		$numero=0;
        		for($i=0;$i<count($arreglo);$i++){
		          if($arreglo[$i]['id']==$id){
		            $encontro=true;
		            $numero=$i;
		          }
		        }
		        	if($encontro==true){
			          switch ($tipo) {
			            case '1':
			                $arreglo[$numero]['id']= $id;
			                $arreglo[$numero]['precio']=$datos[0]['precio_unitario'];
			                $arreglo[$numero]['porcimpuesto']=$porcimpuesto;
			                $arreglo[$numero]['impuesto']=$impuesto;
			                $arreglo[$numero]['tipoImp']=$tipoImp;
			                $arreglo[$numero]['porcdescuento']=$porcdescuento;
			                $arreglo[$numero]['descuento']=$descuento;
			                $arreglo[$numero]['preciofinalU']=$preciofinalU;
			                $arreglo[$numero]['preciototal']=$preciototal;
			                $arreglo[$numero]['costo']=$datos[0]['costo'];
			                $arreglo[$numero]['ump'] = $datos[0]['ump'];
			                $arreglo[$numero]['ums'] = $datos[0]['ums'];
			                $arreglo[$numero]['formula'] = $datos[0]['formula_c'];
			                $arreglo[$numero]['idum'] = $_POST['unidad_medida_c'];
			                $arreglo[$numero]['nombre'] = $datos[0]['nombre'];
			                $arreglo[$numero]['marca'] = $datos[0]['marca'];
			                $arreglo[$numero]['codigo'] = $datos[0]['codigo'];
			                $arreglo[$numero]['existencia'] = $datos[0]['existencia'];
			                $arreglo[$numero]['stock'] = $datos[0]['stock'];
			                $arreglo[$numero]['contenido_neto'] = $datos[0]['contenido_neto'];
			                $arreglo[$numero]['cant'] = $cant;
			                $arreglo[$numero]['unidadesx'] = $_POST['cantidadConsumo'];
			                $arreglo[$numero]['cantidad'] = $_POST['cantidad'];
			                $arreglo[$numero]['precioc'] = $monto;			                
			                $arreglo[$numero]['abreviatura'] = $_POST['abreviatura'];
			                $arreglo[$numero]['comentario'] = $_POST['comentario'];
			                $_SESSION['productosC']=$arreglo;
			              
			              
			            break;
			            
			            default:
			            	unset($_SESSION['productosC'][$numero]);
			                $arreglo = array_values($_SESSION['productosC']);
			                $_SESSION['productosC']=$arreglo;
			            break;
			          }
			          
			        }else{
			        	if ($tipo == 1) {
				        	$arreglo = $_SESSION['productosC'];
				        	$datosNuevos=array('id'=>$id,
			                    'precio'=>$datos[0]['precio_unitario'],
			                    'porcimpuesto'=>$porcimpuesto,
			                    'impuesto'=>$impuesto,
			                    'tipoImp'=>$tipoImp,
			                    'porcdescuento'=>$porcdescuento,
			                    'descuento'=>$descuento,
			                    'preciofinalU'=>$preciofinalU,
			                    'preciototal'=>$preciototal,
			                    'costo'=>$datos[0]['costo'],
			                    'ump'=>$datos[0]['ump'],
			                    'ums'=>$datos[0]['ums'],
			                    'formula'=>$datos[0]['formula_c'],
			                    'idum'=>$_POST['unidad_medida_c'],
			                    'nombre'=>$datos[0]['nombre'],
			                    'marca'=>$datos[0]['marca'],
			                    'codigo'=>$datos[0]['codigo'],
			                    'existencia'=>$datos[0]['existencia'],
			                    'stock'=>$datos[0]['stock'],
			                    'contenido_neto'=>$datos[0]['contenido_neto'],
			                    'cant'=>$cant,
			                    'unidadesx'=>$_POST['cantidadConsumo'],
			                    'cantidad'=>$_POST['cantidad'],
			                    'precioc'=>$monto,			                    
			                    'abreviatura'=>$_POST['abreviatura'],
			                    'comentario'=>$_POST['comentario']);
			                  array_push($arreglo, $datosNuevos);
				          	$_SESSION['productosC']=$arreglo;
			        	}
			        	
			        }
			}else{
				$arreglo[]=array('id'=>$id,
                    'precio'=>$datos[0]['precio_unitario'],
                    'porcimpuesto'=>$porcimpuesto,
                    'impuesto'=>$impuesto,
                    'tipoImp'=>$tipoImp,
                    'porcdescuento'=>$porcdescuento,
                    'descuento'=>$descuento,
                    'preciofinalU'=>$preciofinalU,
                    'preciototal'=>$preciototal,
                    'costo'=>$datos[0]['costo'],
                    'ump'=>$datos[0]['ump'],
			        'ums'=>$datos[0]['ums'],
			        'formula'=>$datos[0]['formula_c'],
			        'idum'=>$_POST['unidad_medida_c'],
                    'nombre'=>$datos[0]['nombre'],
                    'marca'=>$datos[0]['marca'],
                    'codigo'=>$datos[0]['codigo'],
                    'existencia'=>$datos[0]['existencia'],
                    'stock'=>$datos[0]['stock'],
                    'contenido_neto'=>$datos[0]['contenido_neto'],
                    'cant'=>$cant,
                    'unidadesx'=>$_POST['cantidadConsumo'],
                    'cantidad'=>$_POST['cantidad'],
                    'precioc'=>$monto,                    
                    'abreviatura'=>$_POST['abreviatura'],
                    'comentario'=>$_POST['comentario']);
				$_SESSION['productosC'] = $arreglo;
			}
			
			echo json_encode($_SESSION['productosC']);
				
		}

		public function datoscompra($id=false){
			$data = $_SESSION['productosC'];
			$response = array("data"=>$data);
			if ($id!=false) {
				for ($i=0; $i < count($data); $i++) { 
					if ($data[$i]['id'] == $id) {
						$detalle = $data[$i];
						echo json_encode($detalle);exit();
					}else{
						$detalle = 0;
					}
				}
				echo json_encode($detalle);
			}else{
				echo json_encode($response);
			}
			
    		//print_r($response);
    		
		}

		public function datosdevolucion($id){
			$query = "SELECT comentario_devolucion as comentario, mercancia.nombre, mercancia.marca FROM mercancia_has_factura
			inner join mercancia on mercancia_id = mercancia.id
			where mercancia_has_factura.id = $id";
			$data = $this->_main->select($query);
			
    		//print_r($response);
    		echo json_encode($data);
    		
		}

		public function vaciarsesion(){
			Session::destroy('productosC');
			$data = true;
			echo json_encode($data);
		}

		public function validartotalF(){
			$datos = $_SESSION['productosC'];
			$totalf = 0;
			for ($j=0; $j <count($datos); $j++) {
				$totalpro[$j] = $datos[$j]['preciototal'];
				$totalf = $totalpro[$j]+$totalf; 
			}
			if (!empty($datos)) {
				echo json_encode($totalf);
			}else{
				echo json_encode('nodata');
			}
			
		}

		public function procesarfactura($idT,$type=false,$oc=false){
			//var_dump($_POST);exit();
			$datos = $_SESSION['productosC'];
			$accion = 'Modificado';
			$motivo = 199;
			$tipoM = 131;
			$totalf = 0;
			$totalp = 0;
			$totalimp = 0;
			$totalpcimp = 0;
			$totaldcto = 0;
			$totalpcdcto = 0;
			$findme   = ',';
			$hoy = date('Y-m-d');
			$num_orden = date('ynjhi');

			for ($j=0; $j <count($datos); $j++) {
				$totalpro[$j] = $datos[$j]['preciototal'];
				$totalf = $totalpro[$j]+$totalf; 
				$totalimppro[$j] = $datos[$j]['impuesto'];
				$totalimp = $totalimppro[$j]+$totalimp;
				$totalporcimppro[$j] =  $datos[$j]['porcimpuesto'];
				$totalpcimp = $totalporcimppro[$j]+$totalpcimp;
				$totaldctopro[$j] = $datos[$j]['descuento'];
				$totaldcto = $totaldctopro[$j]+$totaldcto;
				$totalporcdctopro[$j] =  $datos[$j]['porcdescuento'];
				$totalpcdcto = $totalporcdctopro[$j]+$totalpcdcto;
			}
			//$TotalF = $totalf-$impuesto;
			/*echo $TotalF."<br>";
			echo $impuesto; exit();*/
			if ($type == 'oc') {
				$query = "INSERT INTO `orden_compra`(`num_orden`,`fecha`, `porcentaje_impuesto`, `impuesto`, `porcentaje_descuento`, `descuento`, `total_orden`, `proveedor_id`, `unidad_negocio_id`, `status_id`) VALUES ('".$num_orden."','".$hoy."','".$totalpcimp."','".$totalimp."', '".$totalpcdcto."','".$totaldcto."','".$totalf."','".$_POST['selectp']."',$idT,41)";
					$ordencompra = $this->_main->insertar($query);
			}else{
				$query = "INSERT INTO `factura`(`num_factura`, `fecha_carga`, `fecha_factura`, `porcentaje_impuesto`, `impuesto_factura`, `porcentaje_descuento`, `descuento`, `total_factura`, `proveedor_id`, `unidad_negocio_id`) VALUES ('".$_POST['num_factura']."','".$hoy."','".$_POST['fechac']."','".$totalpcimp."','".$totalimp."', '".$totalpcdcto."','".$totaldcto."','".$totalf."','".$_POST['selectp']."',$idT)";
					$factura = $this->_main->insertar($query);
			}
			
			for ($i=0; $i < count($datos); $i++) { 
					$conte = $datos[$i]['contenido_neto'];
					$pos4 = strpos($conte, $findme);
					if ($pos4 != false) {
						$p4 = str_replace(".","",$datos[$i]['contenido_neto']);
	               		$contenidoN = str_replace(",",".",$p4);
					}else{
						$contenidoN = $datos[$i]['contenido_neto'];
					}
					if ($datos[$i]['idum'] != $datos[$i]['ums']) {
						$conversion = Controller::formula($datos[$i]['idum'],$datos[$i]['unidadesx'],$datos[$i]['cant'],$contenidoN,$datos[$i]['formula']);
					}else{
						$conversion = $datos[$i]['cant'];
					}

					if ($datos[$i]['idum'] == $datos[$i]['ums'] and ($datos[$i]['idum'] != $datos[$i]['ump'])) {
						$a = $datos[$i]['cant'];
						$b = $datos[$i]['preciofinalU'];
						$c = 1000;
						$m = $b*$c;
						$d = $m/$a;
						$preicoconsumo = $d;
					}else if ($datos[$i]['idum'] != $datos[$i]['ums'] and $datos[$i]['idum'] != $datos[$i]['ump']) {
						$a = $datos[$i]['unidadesx'];
						$b = $datos[$i]['preciofinalU'];
						$c = $b/$a;
						$preicoconsumo = $c;
					}else{
						$preicoconsumo = $datos[$i]['preciofinalU'];
					}
					
					$query = "SELECT existencia FROM mercancia_has_unidad_negocio where unidad_negocio_id = $idT and mercancia_id = '".$datos[$i]['id']."'";
					$stock = $this->_main->select($query);
					if ($type == 'oc') {
					$query = "INSERT INTO `mercancia_has_oc`(`orden_compra_id`, `mercancia_id`, `cantidad`, `cantidadx`, `unidad_medida_id`, `precio_unitario_um`, `porc_impuesto`, `impuesto`, `porc_descuento`, `descuento`, `preciou_consumo`) VALUES ('".$ordencompra."','".$datos[$i]['id']."','".$datos[$i]['cant']."','".$datos[$i]['unidadesx']."', '".$datos[$i]['idum']."','".$datos[$i]['precioc']."','".$datos[$i]['porcimpuesto']."','".$datos[$i]['impuesto']."','".$datos[$i]['porcdescuento']."','".$datos[$i]['descuento']."','".$preicoconsumo."')";
					$mercanciaF = $this->_main->insertar($query);
					}else{
						$query = "INSERT INTO `mercancia_has_factura`(`factura_id`, `mercancia_id`, `cantidad`, `cantidadx`, `unidad_medida_id`, `precio_unitario_um`, `porc_impuesto`, `impuesto`, `porc_descuento`, `descuento`, `preciou_consumo`, `devolucion`) VALUES ('".$factura."','".$datos[$i]['id']."','".$datos[$i]['cant']."','".$datos[$i]['unidadesx']."', '".$datos[$i]['idum']."','".$datos[$i]['precioc']."','".$datos[$i]['porcimpuesto']."','".$datos[$i]['impuesto']."','".$datos[$i]['porcdescuento']."','".$datos[$i]['descuento']."','".$preicoconsumo."',0)";
						$mercanciaF = $this->_main->insertar($query);
					}
					$cant = $stock[0]['existencia']+$conversion;
					
					if ($type != 'oc') {
						$this->_main->log($datos[$i]['id'],$idT,$accion);
						$this->_main->kardex($datos[$i]['cantidad'],$motivo,$tipoM,$datos[$i]['id'],$idT,$datos[$i]['idum'],$datos[$i]['comentario']);
						$query = "UPDATE mercancia_has_unidad_negocio set existencia=$cant where unidad_negocio_id = $idT and mercancia_id = '".$datos[$i]['id']."'";
						$actualizado = $this->_main->modificar($query);
						$query = "SELECT SUM(preciou_consumo) as pc, count(id) as registros FROM mercancia_has_factura where mercancia_id = '".$datos[$i]['id']."'";
						$datosPrecio = $this->_main->select($query);
						$totalp = $datosPrecio[0]['pc'];
						$registros = $datosPrecio[0]['registros'];
						$promedio = $totalp/$registros;
						$query = "UPDATE mercancia set precio_unitario=$promedio where mercancia.id = '".$datos[$i]['id']."'";
						$actualizapre = $this->_main->modificar($query);
					}
					if ($oc != false) {
						$query = "UPDATE `orden_compra` SET `status_id`=43 WHERE orden_compra.id = $oc";
						$actualizaoc = $this->_main->modificar($query);
					}
						
			}
				if ($type == 'oc') {
					$tipo = 1;
					$totalPagar = $totalf;
					$query = "SELECT empresa_id, unidad_negocio.id as idU, unidad_negocio.nombre as udn, modelo.nombre as modelo From unidad_negocio
	              	left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
	                left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $idT";
	            	$idempresa = $this->_main->select($query);
	                $query = "SELECT correo,nombre as proveedor FROM proveedor where id = '".$_POST['selectp']."'";
	                $email = $this->_main->select($query);
	                $query ="SELECT correo FROM unidad_negocio where id = '".$idT."'";
	                $correot = $this->_main->select($query);
	                if (isset($email)) {
	                  $this->_compra->correo($datos,$totalPagar,$idempresa,$email,$correot,$tipo);
	                }
	            }

			echo json_encode($datos);
			//Session::destroy('productosC');

		}

		

		public function validarfechas($fecha){
	        /*$ obtener ultimo dia del mes de la fecha que le pase como parametro*/
	    	$fechaminima = $fecha;
	        $fechamaxima = strtotime ( '+30 day' , strtotime ( $fecha ) ) ;
	        $fechamaxima = date ( 'Y-m-d' , $fechamaxima );
	        $valores = array('fechai' => $fechaminima, 'fechaf' =>$fechamaxima);

	        echo json_encode($valores);
    	}

		public function consultarF($idt,$tipo,$f1,$f2,$ide=false){
			if ($ide != false) {
				$query = "SELECT factura.id as idF, num_factura, DATE_FORMAT(fecha_carga, '%d-%m-%Y') as fecha_carga, DATE_FORMAT(fecha_factura, '%d-%m-%Y') as fecha_factura, porcentaje_impuesto as porcImp, format(impuesto_factura,4,'de_DE') as impuesto, impuesto_factura as impueston, porcentaje_descuento as porcdcto, format(descuento,4,'de_DE') as descuento, descuento as descuenton, format(total_factura-impuesto_factura+descuento,4,'de_DE') as total_factura, total_factura as subtotal, format(total_factura,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov From factura
				inner join proveedor on proveedor.id = proveedor_id 
				inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
				where fecha_factura BETWEEN '".$f1."' and '".$f2."' and factura.unidad_negocio_id = $idt ORDER BY factura.id desc";
				$datae = $this->_main->select($query);
				$query = "SELECT factura.id as idF, num_factura, DATE_FORMAT(fecha_carga, '%d-%m-%Y') as fecha_carga, DATE_FORMAT(fecha_factura, '%d-%m-%Y') as fecha_factura, porcentaje_impuesto as porcImp, format(impuesto_factura,4,'de_DE') as impuesto, impuesto_factura as impueston, porcentaje_descuento as porcdcto, format(descuento,4,'de_DE') as descuento, descuento as descuenton, format(total_factura-impuesto_factura+descuento,4,'de_DE') as total_factura, total_factura as subtotal, format(total_factura,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov From factura
				inner join proveedor on proveedor.id = proveedor_id 
				inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
				where fecha_factura BETWEEN '".$f1."' and '".$f2."' and unidad_negocio.empresa_id = $idt ORDER BY factura.id desc";
				$datat = $this->_main->select($query);
				$data = array_merge($datae,$datat);
			}else{
				$query = "SELECT factura.id as idF, num_factura, DATE_FORMAT(fecha_carga, '%d-%m-%Y') as fecha_carga, DATE_FORMAT(fecha_factura, '%d-%m-%Y') as fecha_factura, porcentaje_impuesto as porcImp, format(impuesto_factura,4,'de_DE') as impuesto, impuesto_factura as impueston, porcentaje_descuento as porcdcto, format(descuento,4,'de_DE') as descuento, descuento as descuenton, format(total_factura-impuesto_factura+descuento,4,'de_DE') as total_factura, total_factura as subtotal, format(total_factura,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov From factura
				inner join proveedor on proveedor.id = proveedor_id 
				inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
				where fecha_factura BETWEEN '".$f1."' and '".$f2."' and factura.unidad_negocio_id = $idt ORDER BY factura.id desc";
				$data = $this->_main->select($query);
			}
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function consultarD($idt,$f1,$f2,$ide=false){
			if ($ide != false) {
				$query = "SELECT mhf.id as idmhf, factura.id as idf, mercancia.id as idm, unidad_medida.id as idum, abreviatura, mercancia.codigo, mercancia.nombre, mercancia.marca, cantidad, cantidadx, precio_unitario_um as puum, format(precio_unitario_um+impuesto-mhf.descuento,4,'de_DE') as precioUpro, format(impuesto,4,'de_DE') as impuesto, impuesto as imp, porc_impuesto, format(mhf.descuento,4,'de_DE') as descuento, mhf.descuento as scto, porc_descuento, devolucion, comentario_devolucion as comentarioD, DATE_FORMAT(factura.fecha_factura, '%d-%m-%Y') as fecha_factura, factura.proveedor_id, factura.num_factura, unidad_negocio.id as idund, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.id as idprov, DATE_FORMAT(fecha_devolucion, '%d-%m-%Y') as fecha_devolucion, format(cantidadNC,4,'de_DE') as cantnc, precioNC, format(precioNC,4,'de_DE') as montonc FROM `mercancia_has_factura` as mhf
				inner join mercancia on mercancia.id = mercancia_id
				INNER JOIN factura on factura_id = factura.id
				inner join unidad_medida on unidad_medida.id = unidad_medida_id
				inner join unidad_negocio on unidad_negocio.id = factura.unidad_negocio_id
				inner join proveedor on proveedor.id = proveedor_id
				where devolucion = 1 and factura.fecha_factura BETWEEN '".$f1."' and '".$f2."' and factura.unidad_negocio_id = $idt";
				$datae = $this->_main->select($query);
				$query = "SELECT mhf.id as idmhf, factura.id as idf, mercancia.id as idm, unidad_medida.id as idum, abreviatura, mercancia.codigo, mercancia.nombre, mercancia.marca, cantidad, cantidadx, precio_unitario_um as puum, format(precio_unitario_um+impuesto-mhf.descuento,4,'de_DE') as precioUpro, format(impuesto,4,'de_DE') as impuesto, impuesto as imp, porc_impuesto, format(mhf.descuento,4,'de_DE') as descuento, mhf.descuento as scto, porc_descuento, devolucion, comentario_devolucion as comentarioD, DATE_FORMAT(factura.fecha_factura, '%d-%m-%Y') as fecha_factura, factura.proveedor_id, factura.num_factura, unidad_negocio.id as idund, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.id as idprov, DATE_FORMAT(fecha_devolucion, '%d-%m-%Y') as fecha_devolucion, format(cantidadNC,4,'de_DE') as cantnc, precioNC, format(precioNC,4,'de_DE') as montonc FROM `mercancia_has_factura` as mhf
				inner join mercancia on mercancia.id = mercancia_id
				INNER JOIN factura on factura_id = factura.id
				inner join unidad_medida on unidad_medida.id = unidad_medida_id
				inner join unidad_negocio on unidad_negocio.id = factura.unidad_negocio_id
				inner join proveedor on proveedor.id = proveedor_id
				where devolucion = 1 and factura.fecha_factura BETWEEN '".$f1."' and '".$f2."' and unidad_negocio.empresa_id = $idt";
				$datat = $this->_main->select($query);
				$data = array_merge($datae,$datat);
			}else{
				$query = "SELECT mhf.id as idmhf, factura.id as idf, mercancia.id as idm, unidad_medida.id as idum, abreviatura, mercancia.codigo, mercancia.nombre, mercancia.marca, cantidad, cantidadx, precio_unitario_um as puum, format(precio_unitario_um+impuesto-mhf.descuento,4,'de_DE') as precioUpro, format(impuesto,4,'de_DE') as impuesto, impuesto as imp, porc_impuesto, format(mhf.descuento,4,'de_DE') as descuento, mhf.descuento as scto, porc_descuento, devolucion, comentario_devolucion as comentarioD, DATE_FORMAT(factura.fecha_factura, '%d-%m-%Y') as fecha_factura, factura.proveedor_id, factura.num_factura, unidad_negocio.id as idund, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.id as idprov, DATE_FORMAT(fecha_devolucion, '%d-%m-%Y') as fecha_devolucion, format(cantidadNC,4,'de_DE') as cantnc, precioNC, format(precioNC,4,'de_DE') as montonc FROM `mercancia_has_factura` as mhf
				inner join mercancia on mercancia.id = mercancia_id
				INNER JOIN factura on factura_id = factura.id
				inner join unidad_medida on unidad_medida.id = unidad_medida_id
				inner join unidad_negocio on unidad_negocio.id = factura.unidad_negocio_id
				inner join proveedor on proveedor.id = proveedor_id
				where devolucion = 1 and factura.fecha_factura BETWEEN '".$f1."' and '".$f2."' and factura.unidad_negocio_id = $idt";
				$data = $this->_main->select($query);
			}
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function productosfactura($idf){
			$query = "SELECT factura.id as idF, num_factura, mercancia.id as idmer, format(cantidad,4,'de_DE') as cantidad, cantidad as cant, unidad_medida_id as idum, abreviatura, precio_unitario_um as pup, format(precio_unitario_um,4,'de_DE') as precioUpro, format(precio_unitario_um*cantidad+impuesto-mhf.descuento,4,'de_DE') as precioproT, format(impuesto,4,'de_DE') as impuesto, impuesto as imp, porc_impuesto, format(mhf.descuento,4,'de_DE') as descuento, mhf.descuento as scto, porc_descuento, devolucion, unidad_negocio_id, mercancia.codigo, mercancia.nombre, mercancia.marca, mercancia.contenido_neto, cantidadx, abreviatura, cantidadNC, format(cantidadNC,4,'de_DE') as cantnc, precioNC, format(precioNC,4,'de_DE') as montonc
			FROM `mercancia_has_factura` as mhf
			inner join factura on factura.id = factura_id
			inner join mercancia on mercancia.id = mercancia_id
			inner join unidad_medida on unidad_medida.id = unidad_medida_id
			where factura.id = $idf";
			$data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function productosordenc($idOC){
			$query = "SELECT orden_compra.id as idOC, num_orden, mercancia.id as idmer, format(cantidad,4,'de_DE') as cantidad, cantidad as cant, unidad_medida_id as idum, abreviatura, precio_unitario_um as pup, format(precio_unitario_um,4,'de_DE') as precioUpro, format(precio_unitario_um*cantidad+mhoc.impuesto-mhoc.descuento,4,'de_DE') as precioproT, format(mhoc.impuesto,4,'de_DE') as impuesto, mhoc.impuesto as imp, porc_impuesto, format(mhoc.descuento,4,'de_DE') as descuento, mhoc.descuento as scto, porc_descuento, unidad_negocio_id, mercancia.codigo, mercancia.nombre, mercancia.marca, mercancia.contenido_neto, cantidadx, abreviatura
			FROM `mercancia_has_oc` as mhoc
			inner join orden_compra on orden_compra.id = orden_compra_id
			inner join mercancia on mercancia.id = mercancia_id
			inner join unidad_medida on unidad_medida.id = unidad_medida_id
			where orden_compra.id = $idOC";
			$data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function devolucion($idt){
			//var_dump($_POST);exit();
			$accion = 'Modificado';
			$motivo = 200;
			$tipoM = 132;
			$hoy = date('Y-m-d');
			$query = "SELECT mercancia.nombre, mercancia.marca, mercancia.receta_id, mercancia.formula_c, unidad_medida_sistema_id as ums, existencia 
				FROM mercancia_has_unidad_negocio 
				inner join mercancia on mercancia.id = mercancia_id
				where unidad_negocio_id = $idt and mercancia_id = '".$_POST['idmer']."'";
			$stock = $this->_main->select($query);
			if ($_POST['idum'] != $stock[0]['ums']) {
				$conversion = Controller::formula($_POST['idum'],$_POST['cantx'],$_POST['cantinc'],$_POST['conte'],$stock[0]['formula_c']);
			}else{
				$conversion = $_POST['cantinc'];
			}
			$cant = $stock[0]['existencia']-$conversion;
			$this->_main->log($_POST['idmer'],$idt,$accion);
			$this->_main->kardex($conversion,$motivo,$tipoM,$_POST['idmer'],$idt,$_POST['idum'],$_POST['comentario']);
			$query = "UPDATE mercancia_has_unidad_negocio set existencia=$cant where unidad_negocio_id = $idt and mercancia_id = '".$_POST['idmer']."'";
			$actualizado = $this->_main->modificar($query);
			$query = "SELECT * FROM mercancia_has_factura where factura_id = '".$_POST['idf']."' and mercancia_id = '".$_POST['idmer']."'";
			$mercfact = $this->_main->select($query);
			$a = $_POST['cant'];
			$b = $_POST['preciop']+$mercfact[0]['impuesto']-$mercfact[0]['descuento'];
			$c = $_POST['cantinc'];
			$multi = $c*$b;
			$pvpnc = $multi/$a;
			/*$query = "SELECT * From factura where id = '".$_POST['idf']."'";
			$fact = $this->_main->select($query);
			
			$preciop = $_POST['preciop']*$_POST['cantinc'];
			if ($mercfact[0]['porc_impuesto']>0) {
				$porcentaje = $mercfact[0]['porc_impuesto'];
				$multiplicacion = $preciop*$porcentaje;
				$impuesto = $multiplicacion/100;
			}else{
				$porcentaje = 0;
				$impuesto = 0;
			}
			$impuestnuevo = $fact[0]['impuesto_factura']-$impuesto;
			$precioN = $preciop-$impuesto;
			$precioF = $fact[0]['total_factura']-$precioN;
			$query = "UPDATE `factura` SET `impuesto_factura`='".$impuestnuevo."' ,`total_factura`='".$precioF."' WHERE id= '".$_POST['idf']."'";
			$updateF = $this->_main->modificar($query);*/
			$query = "UPDATE mercancia_has_factura set devolucion=1, `comentario_devolucion`= '".$_POST['comentario']."', `cantidadNC`= '".$_POST['cantinc']."', `precioNC`= '".$pvpnc."',  `fecha_devolucion` = '".$hoy."' 
			where factura_id='".$_POST['idf']."' and mercancia_id ='".$_POST['idmer']."' ";
			$devuelto = $this->_main->modificar($query);
			echo json_encode($devuelto);
		}

		public function validarprecio($idum,$precio,$idt,$idprod){
			$query = "SELECT MAX(mercancia_has_factura.id) as idmhf, unidad_medida_id as um_id, precio_unitario_um as pu_um FROM `mercancia_has_factura`
			inner join factura on factura.id = factura_id
			where unidad_negocio_id = $idt and mercancia_id = $idprod and unidad_medida_id = $idum";
			$fact = $this->_main->select($query);
			if (isset($fact)) {
				$p1 = $fact[0]['pu_um'];
				$p2 = $precio;
				$multi = $p2*100;
				if ($p1 == 0) {
					$divi = $multi/1;
				}else{
					$divi = $multi/$p1;
				}
				$porc = $divi-100;
				$data[0] = $porc;
				$data[1] = number_format($p1,4,",",".");
			}
			echo json_encode($data);
			
		}



		function pdf(){
			require('/libs/fpdf.php');
			$pdf = new FPDF();
			$pdf->AddPage();
			$pdf->SetFont('Arial','B',16);
			$pdf->Cell(40,10,'¡Hola, Mundo!');
			$pdf->Output();
		}

		public function consultarOC($idt,$f1,$f2,$ide=false){
			$data = $this->consulta_OC($idt,$f1,$f2,$ide);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function detallesOC($idr){
			$data = $this->detalles_OC($idr);
      		$data = $this->_main->select($query);
      		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function consulta_OC($idt,$f1,$f2,$ide=false){
			if ($ide != false) {
				$query = "SELECT orden_compra.id as idOC, num_orden, DATE_FORMAT(fecha, '%d-%m-%Y') as fecha, fecha as dia, porcentaje_impuesto as porcImp, format(impuesto,4,'de_DE') as impuesto, impuesto as impueston, porcentaje_descuento as porcdcto, format(descuento,4,'de_DE') as descuento, descuento as descuenton, format(total_orden-impuesto+descuento,4,'de_DE') as total_orden, total_orden as subtotal, format(total_orden,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, status_id From orden_compra
				inner join proveedor on proveedor.id = proveedor_id 
				inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
				where fecha BETWEEN '".$f1."' and '".$f2."' and unidad_negocio_id = $idt ORDER BY orden_compra.id desc";
				$datae = $this->_main->select($query);
				$query = "SELECT orden_compra.id as idOC, num_orden, DATE_FORMAT(fecha, '%d-%m-%Y') as fecha, fecha as dia, porcentaje_impuesto as porcImp, format(impuesto,4,'de_DE') as impuesto, impuesto as impueston, porcentaje_descuento as porcdcto, format(descuento,4,'de_DE') as descuento, descuento as descuenton, format(total_orden-impuesto+descuento,4,'de_DE') as total_orden, total_orden as subtotal, format(total_orden,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, status_id From orden_compra
				inner join proveedor on proveedor.id = proveedor_id 
				inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
				where fecha BETWEEN '".$f1."' and '".$f2."' and unidad_negocio.empresa_id = $idt ORDER BY orden_compra.id desc";
				$datat = $this->_main->select($query);
				$data = array_merge($datae,$datat);
			}else{
				$query = "SELECT orden_compra.id as idOC, num_orden, DATE_FORMAT(fecha, '%d-%m-%Y') as fecha, fecha as dia, porcentaje_impuesto as porcImp, format(impuesto,4,'de_DE') as impuesto, impuesto as impueston, porcentaje_descuento as porcdcto, format(descuento,4,'de_DE') as descuento, descuento as descuenton, format(total_orden-impuesto+descuento,4,'de_DE') as total_orden, total_orden as subtotal, format(total_orden,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, status_id From orden_compra
				inner join proveedor on proveedor.id = proveedor_id 
				inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
				where fecha BETWEEN '".$f1."' and '".$f2."' and unidad_negocio_id = $idt ORDER BY orden_compra.id desc";
				$data = $this->_main->select($query);
			}
			return $data;
		}

		public function detalles_OC($idr){
			$query = "SELECT mhoc.id as idmhoc, orden_compra.id as idOC, mercancia.id as idm, unidad_medida.id as idum, abreviatura, mercancia.codigo, mercancia.nombre, mercancia.marca, cantidad, cantidadx, precio_unitario_um as puum, format(precio_unitario_um+mhoc.impuesto-mhoc.descuento,4,'de_DE') as precioUpro, format(mhoc.impuesto,4,'de_DE') as impuesto, mhoc.impuesto as imp, porc_impuesto, format(mhoc.descuento,4,'de_DE') as descuento, mhoc.descuento as dscto, porc_descuento, DATE_FORMAT(fecha, '%d-%m-%Y') as fecha, orden_compra.proveedor_id, num_orden, unidad_negocio.id as idund, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.id as idprov, total_orden, format(total_orden,4,'de_DE') as ttlorden
			FROM `mercancia_has_oc` as mhoc
				inner join mercancia on mercancia.id = mercancia_id
				INNER JOIN orden_compra on orden_compra_id = orden_compra.id
				inner join unidad_medida on unidad_medida.id = unidad_medida_id
				inner join unidad_negocio on unidad_negocio.id = orden_compra.unidad_negocio_id
				inner join proveedor on proveedor.id = proveedor_id
				where orden_compra_id = $idr and orden_compra.status_id = 41";
      		$data = $this->_main->select($query);
      		return $data;
		}

		public function validarnumfact($num,$idprov){
			$query = "SELECT num_factura From factura where num_factura = $num and proveedor_id = $idprov";
			$data = $this->_main->select($query);
			echo json_encode($data);
		}

		public function cargardesdeOC($idt,$id){
			Session::destroy('productosC');
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
			$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $this->_view->setJs(array('js/facturas'));
		    $this->_view->setJs(array('js/ordenC'));
		    $valores = $this->_main->datostienda($idt);
			$this->_view->g = $valores;
			$detalles = $this->detalles_OC($id);
			$this->_view->detallesOC = $detalles;
			$tipo = 1;
			for ($i=0; $i <count($detalles) ; $i++) { 
			//var_dump($_POST); exit();
			if (isset($detalles[$i]['cantidad'])) {
				$mystring = $detalles[$i]['cantidad'];
				$mystring2 = $detalles[$i]['puum'];
				$findme   = ',';
				$pos = strpos($mystring, $findme);
				$pos1 = strpos($mystring2, $findme);
			
				if ($pos != false) {
					$p1 = str_replace(".","",$detalles[$i]['cantidad']);
	           		$cant = str_replace(",",".",$p1);
				}else{
					$cant = $detalles[$i]['cantidad'];
				}

				if ($pos1 != false) {
					$p2 = str_replace(".","",$detalles[$i]['puum']);
	           		$monto = str_replace(",",".",$p2);
				}else{
					$monto = $detalles[$i]['puum'];
				}
			}
			$idm = $detalles[$i]['idm'];
			$idt = $idt;
			
			if (isset($detalles[$i]['imp']) and $detalles[$i]['imp'] >0) {
				$porcimpuesto = $detalles[$i]['imp'];
				$mul = $monto*$porcimpuesto;
				$impuesto = $mul/100;
			}else{
				$porcimpuesto = 0;
				$impuesto = 0;
			}
			
			$preciot = $monto+$impuesto;
			$monto = $monto;
			$comentario = '';
				
			
			
			
			if (isset($detalles[$i]['porc_descuento']) and $detalles[$i]['porc_descuento']>0) {
				$porcdescuento = $detalles[$i]['porc_descuento'];
				$mul2 = $preciot*$porcdescuento;
				$descuento = $mul2/100;
			}else if (isset($detalles[$i]['dscto']) and $detalles[$i]['dscto']>0) {
				$descuento = $detalles[$i]['dscto'];
				$mul2 = $descuento*100;
				$porcdescuento = $mul2/$preciot;
			}else{
				$descuento = 0;
				$porcdescuento = 0;
			}
			if (isset($preciot) and isset($cant)) {
				$preciofinalU = $preciot-$descuento;
				$preciototal = $cant*$preciofinalU;
			}
			

			
			$query = "SELECT mercancia.id, nombre, marca,codigo, precio_unitario, mercancia.contenido_neto, um1.id as idums, um1.abreviatura as ums, um2.id as idump, um2.abreviatura as ump, mhudn.existencia, format(existencia,4,'de_DE') as stock, format(precio_unitario,4,'de_DE') as costo, formula_c FROM mercancia
			inner join unidad_medida as um1 on um1.id = mercancia.unidad_medida_sistema_id
			inner join unidad_medida as um2 on um2.id = mercancia.unidad_medida_consumo_id
			inner join mercancia_has_unidad_negocio as mhudn on mhudn.mercancia_id = mercancia.id
			where mercancia.id = $idm and mhudn.unidad_negocio_id = $idt";
				$datos = $this->_main->select($query);

			if (isset($_SESSION['productosC'])) {
				$arreglo = $_SESSION['productosC'];
				//print_r($arreglo); echo "<br>";
				$encontro=false;
        		$numero=0;
        		for($j=0;$j<count($arreglo);$j++){
		          if($arreglo[$j]['id']==$idm){
		            $encontro=true;
		            $numero=$j;
		          }
		        }
		        	if($encontro==true){
			          switch ($tipo) {
			            case '1':
			                $arreglo[$numero]['id']= $idm;
			                $arreglo[$numero]['precio']=$datos[0]['precio_unitario'];
			                $arreglo[$numero]['porcimpuesto']=$porcimpuesto;
			                $arreglo[$numero]['impuesto']=$impuesto;
			                $arreglo[$numero]['tipoImp']=1;
			                $arreglo[$numero]['porcdescuento']=$porcdescuento;
			                $arreglo[$numero]['descuento']=$descuento;
			                $arreglo[$numero]['preciofinalU']=$preciofinalU;
			                $arreglo[$numero]['preciototal']=$preciototal;
			                $arreglo[$numero]['costo']=$datos[0]['costo'];
			                $arreglo[$numero]['ump'] = $datos[0]['ump'];
			                $arreglo[$numero]['ums'] = $datos[0]['ums'];
			                $arreglo[$numero]['formula'] = $datos[0]['formula_c'];
			                $arreglo[$numero]['idum'] = $detalles[$i]['idum'];
			                $arreglo[$numero]['nombre'] = $datos[0]['nombre'];
			                $arreglo[$numero]['marca'] = $datos[0]['marca'];
			                $arreglo[$numero]['codigo'] = $datos[0]['codigo'];
			                $arreglo[$numero]['existencia'] = $datos[0]['existencia'];
			                $arreglo[$numero]['stock'] = $datos[0]['stock'];
			                $arreglo[$numero]['contenido_neto'] = $datos[0]['contenido_neto'];
			                $arreglo[$numero]['cant'] = $cant;
			                $arreglo[$numero]['unidadesx'] = $detalles[$i]['cantidadx'];
			                $arreglo[$numero]['cantidad'] = $detalles[$i]['cantidad'];
			                $arreglo[$numero]['precioc'] = $monto;			                
			                $arreglo[$numero]['abreviatura'] = $detalles[$i]['abreviatura'];
			                $arreglo[$numero]['comentario'] = $comentario;
			                $_SESSION['productosC']=$arreglo;
			              
			              
			            break;
			            
			            default:
			            	unset($_SESSION['productosC'][$numero]);
			                $arreglo = array_values($_SESSION['productosC']);
			                $_SESSION['productosC']=$arreglo;
			            break;
			          }
			          
			        }else{
			        	if ($tipo == 1) {
				        	$arreglo = $_SESSION['productosC'];
				        	$datosNuevos=array('id'=>$idm,
			                    'precio'=>$datos[0]['precio_unitario'],
			                    'porcimpuesto'=>$porcimpuesto,
			                    'impuesto'=>$impuesto,
			                    'tipoImp'=>1,
			                    'porcdescuento'=>$porcdescuento,
			                    'descuento'=>$descuento,
			                    'preciofinalU'=>$preciofinalU,
			                    'preciototal'=>$preciototal,
			                    'costo'=>$datos[0]['costo'],
			                    'ump'=>$datos[0]['ump'],
			                    'ums'=>$datos[0]['ums'],
			                    'formula'=>$datos[0]['formula_c'],
			                    'idum'=>$detalles[$i]['idum'],
			                    'nombre'=>$datos[0]['nombre'],
			                    'marca'=>$datos[0]['marca'],
			                    'codigo'=>$datos[0]['codigo'],
			                    'existencia'=>$datos[0]['existencia'],
			                    'stock'=>$datos[0]['stock'],
			                    'contenido_neto'=>$datos[0]['contenido_neto'],
			                    'cant'=>$cant,
			                    'unidadesx'=>$detalles[$i]['cantidadx'],
			                    'cantidad'=>$detalles[$i]['cantidad'],
			                    'precioc'=>$monto,			                    
			                    'abreviatura'=>$detalles[$i]['abreviatura'],
			                    'comentario'=>$comentario);
			                  array_push($arreglo, $datosNuevos);
				          	$_SESSION['productosC']=$arreglo;
			        	}
			        	
			        }
			}else{
				$arreglo[]=array('id'=>$idm,
                    'precio'=>$datos[0]['precio_unitario'],
                    'porcimpuesto'=>$porcimpuesto,
                    'impuesto'=>$impuesto,
                    'tipoImp'=>1,
                    'porcdescuento'=>$porcdescuento,
                    'descuento'=>$descuento,
                    'preciofinalU'=>$preciofinalU,
                    'preciototal'=>$preciototal,
                    'costo'=>$datos[0]['costo'],
                    'ump'=>$datos[0]['ump'],
			        'ums'=>$datos[0]['ums'],
			        'formula'=>$datos[0]['formula_c'],
			        'idum'=>$detalles[$i]['idum'],
                    'nombre'=>$datos[0]['nombre'],
                    'marca'=>$datos[0]['marca'],
                    'codigo'=>$datos[0]['codigo'],
                    'existencia'=>$datos[0]['existencia'],
                    'stock'=>$datos[0]['stock'],
                    'contenido_neto'=>$datos[0]['contenido_neto'],
                    'cant'=>$cant,
                    'unidadesx'=>$detalles[$i]['cantidadx'],
			        'cantidad'=>$detalles[$i]['cantidad'],
                    'precioc'=>$monto,                    
                    'abreviatura'=>$detalles[$i]['abreviatura'],
                    'comentario'=>$comentario);
				$_SESSION['productosC'] = $arreglo;
			}
			

				
		
			}
			$this->_view->render('facturaOC', 'compra', '','');

		}


	}
?>