<?php 
	class compraController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_compra;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			//$this->_compra = $this->loadModel('compra');
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

		public function materiaprima($idt){
			$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, unidad_medida_compra_id as umcid, unidad_medida_consumo_id as umpid, unidad_medida_sistema_id as umsid, umc.abreviatura as abumc, ump.abreviatura as abump, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) As ingrediente, mercancia.precio_unitario as precioU, mudn.existencia, format(mudn.existencia,4,'de_DE') as stock, stock_min, stock_max, format(mudn.stock_min,4,'de_DE') as stmin, format(mudn.stock_max,4,'de_DE') as stmax FROM `mercancia`
            left join unidad_medida as umc on umc.id = mercancia.unidad_medida_compra_id
            inner join unidad_medida as ump on ump.id = mercancia.unidad_medida_consumo_id
            inner join unidad_medida as ums on ums.id = mercancia.unidad_medida_sistema_id
            inner join mercancia_has_unidad_negocio as mudn on mudn.mercancia_id = mercancia.id
            inner join unidad_negocio on unidad_negocio.id = mudn.unidad_negocio_id
            where mudn.unidad_negocio_id = $idt and familia_id != 135";
            $data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

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

		public function validartotalF($imp=false){
			$datos = $_SESSION['productosC'];
			$totalf = 0;
			if ($imp == false) {
				$imp = 0;
			}
			for ($j=0; $j <count($datos); $j++) {
				$totalpro[$j] = $datos[$j]['precioc']*$datos[$j]['cant'];
				$totalf = $totalpro[$j]+$totalf; 
			}
			if ($imp>0) {
				$porcentaje = $imp;
				$multiplicacion = $totalf*$porcentaje;
				$impuesto = $multiplicacion/100;
			}else{
				$porcentaje = 0;
				$impuesto = 0;
			}
			$TotalF = $totalf-$impuesto;
			echo json_encode($totalf);
		}

		public function procesarfactura($idT=false){
			//var_dump($_POST);exit();
			$datos = $_SESSION['productosC'];
			$accion = 'Modificado';
			$motivo = 199;
			$tipoM = 131;
			$totalf = 0;
			$findme   = ',';
			$hoy = date('Y-m-d');
			for ($j=0; $j <count($datos); $j++) {
				$totalpro[$j] = $datos[$j]['precioc']*$datos[$j]['cant'];
				$totalf = $totalpro[$j]+$totalf; 
			}
			if ($_POST['impuesto']>0) {
				$porcentaje = $_POST['impuesto'];
				$multiplicacion = $totalf*$porcentaje;
				$impuesto = $multiplicacion/100;
			}else{
				$porcentaje = 0;
				$impuesto = 0;
			}
			$TotalF = $totalf-$impuesto;
			/*echo $TotalF."<br>";
			echo $impuesto; exit();*/
			$query = "INSERT INTO `factura`(`num_factura`, `fecha_carga`, `fecha_factura`, `porcentaje_impuesto`, `impuesto_factura`, `total_factura`, `proveedor_id`, `unidad_negocio_id`) VALUES ('".$_POST['num_factura']."','".$hoy."','".$_POST['fechac']."','".$porcentaje."','".$impuesto."','".$TotalF."','".$_POST['selectp']."',$idT)";
			$factura = $this->_main->insertar($query);
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
					
					$query = "SELECT existencia FROM mercancia_has_unidad_negocio where unidad_negocio_id = $idT and mercancia_id = '".$datos[$i]['id']."'";
					$stock = $this->_main->select($query);
					$query = "INSERT INTO `mercancia_has_factura`(`factura_id`, `mercancia_id`, `cantidad`, `cantidadx`, `unidad_medida_id`, `precio_unitario_um`, `devolucion`) VALUES ('".$factura."','".$datos[$i]['id']."','".$datos[$i]['cant']."','".$datos[$i]['unidadesx']."', '".$datos[$i]['idum']."','".$datos[$i]['precioc']."',0)";
					$mercanciaF = $this->_main->insertar($query);
					$cant = $stock[0]['existencia']+$conversion;
					$this->_main->log($datos[$i]['id'],$idT,$accion);
					$this->_main->kardex($datos[$i]['cantidad'],$motivo,$tipoM,$datos[$i]['id'],$idT,$datos[$i]['idum'],$datos[$i]['comentario']);
					$query = "UPDATE mercancia_has_unidad_negocio set existencia=$cant where unidad_negocio_id = $idT and mercancia_id = '".$datos[$i]['id']."'";
					$actualizado = $this->_main->modificar($query);
				
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
				$query = "SELECT factura.id as idF, num_factura, DATE_FORMAT(fecha_carga, '%d-%m-%Y') as fecha_carga, DATE_FORMAT(fecha_factura, '%d-%m-%Y') as fecha_factura, porcentaje_impuesto as porcImp, format(impuesto_factura,4,'de_DE') as impuesto, impuesto_factura as impueston, format(total_factura,4,'de_DE') as total_factura, total_factura as subtotal, format(impuesto_factura + total_factura,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov From factura
				inner join proveedor on proveedor.id = proveedor_id 
				inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
				where fecha_factura BETWEEN '".$f1."' and '".$f2."' and factura.unidad_negocio_id = $idt ORDER BY factura.id desc";
				$datae = $this->_main->select($query);
				$query = "SELECT factura.id as idF, num_factura, DATE_FORMAT(fecha_carga, '%d-%m-%Y') as fecha_carga, DATE_FORMAT(fecha_factura, '%d-%m-%Y') as fecha_factura, porcentaje_impuesto as porcImp, format(impuesto_factura,4,'de_DE') as impuesto, impuesto_factura as impueston, format(total_factura,4,'de_DE') as total_factura, total_factura as subtotal, format(impuesto_factura + total_factura,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov From factura
				inner join proveedor on proveedor.id = proveedor_id 
				inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
				where fecha_factura BETWEEN '".$f1."' and '".$f2."' and unidad_negocio.empresa_id = $idt ORDER BY factura.id desc";
				$datat = $this->_main->select($query);
				$data = array_merge($datae,$datat);
			}else{
				$query = "SELECT factura.id as idF, num_factura, DATE_FORMAT(fecha_carga, '%d-%m-%Y') as fecha_carga, DATE_FORMAT(fecha_factura, '%d-%m-%Y') as fecha_factura, porcentaje_impuesto as porcImp, format(impuesto_factura,4,'de_DE') as impuesto, impuesto_factura as impueston, format(total_factura,4,'de_DE') as total_factura, total_factura as subtotal, format(impuesto_factura + total_factura,4,'de_DE') as ttl, proveedor_id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov From factura
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
				$query = "SELECT mercancia_has_factura.id as idmhf, factura.id as idf, mercancia.id as idm, unidad_medida.id as idum, abreviatura, mercancia.codigo, mercancia.nombre, mercancia.marca, cantidad, cantidadx, precio_unitario_um as puum, devolucion, comentario_devolucion as comentarioD, factura.fecha_factura, factura.proveedor_id, factura.num_factura, unidad_negocio.id as idund, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.id as idprov, fecha_devolucion FROM `mercancia_has_factura`
				inner join mercancia on mercancia.id = mercancia_id
				INNER JOIN factura on factura_id = factura.id
				inner join unidad_medida on unidad_medida.id = unidad_medida_id
				inner join unidad_negocio on unidad_negocio.id = factura.unidad_negocio_id
				inner join proveedor on proveedor.id = proveedor_id
				where devolucion = 1 and factura.fecha_factura BETWEEN '".$f1."' and '".$f2."' and factura.unidad_negocio_id = $idt";
				$datae = $this->_main->select($query);
				$query = "SELECT mercancia_has_factura.id as idmhf, factura.id as idf, mercancia.id as idm, unidad_medida.id as idum, abreviatura, mercancia.codigo, mercancia.nombre, mercancia.marca, cantidad, cantidadx, precio_unitario_um as puum, devolucion, comentario_devolucion as comentarioD, factura.fecha_factura, factura.proveedor_id, factura.num_factura, unidad_negocio.id as idund, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.id as idprov, fecha_devolucion FROM `mercancia_has_factura`
				inner join mercancia on mercancia.id = mercancia_id
				INNER JOIN factura on factura_id = factura.id
				inner join unidad_medida on unidad_medida.id = unidad_medida_id
				inner join unidad_negocio on unidad_negocio.id = factura.unidad_negocio_id
				inner join proveedor on proveedor.id = proveedor_id
				where devolucion = 1 and factura.fecha_factura BETWEEN '".$f1."' and '".$f2."' and unidad_negocio.empresa_id = $idt";
				$datat = $this->_main->select($query);
				$data = array_merge($datae,$datat);
			}else{
				$query = "SELECT mercancia_has_factura.id as idmhf, factura.id as idf, mercancia.id as idm, unidad_medida.id as idum, abreviatura, mercancia.codigo, mercancia.nombre, mercancia.marca, cantidad, cantidadx, precio_unitario_um as puum, devolucion, comentario_devolucion as comentarioD, factura.fecha_factura, factura.proveedor_id, factura.num_factura, unidad_negocio.id as idund, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.id as idprov, fecha_devolucion FROM `mercancia_has_factura`
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
			$query = "SELECT factura.id as idF, num_factura, mercancia.id as idmer, format(cantidad,4,'de_DE') as cantidad, cantidad as cant, unidad_medida_id as idum, abreviatura, precio_unitario_um as pup, format(cantidad,4,'de_DE') as precioUpro, format(precio_unitario_um*cantidad,4,'de_DE') as precioproT, devolucion, unidad_negocio_id, mercancia.codigo, mercancia.nombre, mercancia.marca, mercancia.contenido_neto, cantidadx, abreviatura 
			FROM `mercancia_has_factura` 
			inner join factura on factura.id = factura_id
			inner join mercancia on mercancia.id = mercancia_id
			inner join unidad_medida on unidad_medida.id = unidad_medida_id
			where factura.id = $idf and devolucion = 0";
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
				$conversion = Controller::formula($_POST['idum'],$_POST['cantx'],$_POST['cant'],$_POST['conte'],$stock[0]['formula_c']);
			}else{
				$conversion = $_POST['cant'];
			}
			$cant = $stock[0]['existencia']-$conversion;
			$this->_main->log($_POST['idmer'],$idt,$accion);
			$this->_main->kardex($conversion,$motivo,$tipoM,$_POST['idmer'],$idt,$_POST['idum'],$_POST['comentario']);
			$query = "UPDATE mercancia_has_unidad_negocio set existencia=$cant where unidad_negocio_id = $idt and mercancia_id = '".$_POST['idmer']."'";
			$actualizado = $this->_main->modificar($query);
			$query = "SELECT * From factura where id = '".$_POST['idf']."'";
			$fact = $this->_main->select($query);
			$preciop = $_POST['preciop']*$_POST['cant'];
			if ($fact[0]['porcentaje_impuesto']>0) {
				$porcentaje = $fact[0]['porcentaje_impuesto'];
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
			$updateF = $this->_main->modificar($query);
			$query = "UPDATE mercancia_has_factura set devolucion=1, `comentario_devolucion`= '".$_POST['comentario']."', `fecha_devolucion` = '".$hoy."' 
			where factura_id='".$_POST['idf']."' and mercancia_id ='".$_POST['idmer']."' ";
			$devuelto = $this->_main->modificar($query);
			echo json_encode($devuelto);
		}

		function pdf(){
			require('/libs/fpdf.php');

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,'¡Hola, Mundo!');
$pdf->Output();
		}


	}
?>