<?php 

class proveedoresController extends Controller{
	
	public function __construct() {
		parent::__construct();
		$this->_main = $this->loadModel('main');
	}
	
	function index($id=false){
		Session::destroy('numstlf');
		Session::destroy('socios');
		Session::destroy('vendedores');
		$this->_view->setJs(array('js/jquery-1.12.4.min'));
		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
	    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
	    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
	    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
	    $this->_view->setJs(array('datatable/js/tabla'));
	    $this->_view->setJs(array('js/proveedores'));
		$valores = $this->_main->datostienda($id);
		$this->_view->g = $valores;
		$query = "SELECT * FROM proveedor where status = 0 and empresa_id = $id order by id desc";
	    $proveedores = $this->_main->select($query);
	    $this->_view->proveedores = $proveedores;
		$this->_view->render('indexprov', 'inventario', '','');
		// clase  metodo 	  vista    carpeta dentro de views 
	}

	
	function newprov($idt){

		
		if (!empty($_POST['parroquia_id'])) {
			if (isset($_POST['edificio'])) {
				$query = "INSERT INTO `ubicacion`(`edificio`, `calle`, `urbanizacion`, `nro_intercomunicador`, `punto_referencia`, `parroquia_id`,`zona_postal`) 
						VALUES ('".$_POST['edificio']."','".$_POST['calle']."','".$_POST['urbanizacion']."','".$_POST['intercomunicador']."','".$_POST['p_referencia']."','".$_POST['parroquia_id']."','".$_POST['zona_postal']."')";
			}else{
				$query = "INSERT INTO `ubicacion`(`edificio`, `calle`, `urbanizacion`, `punto_referencia`, `parroquia_id`,`zona_postal`) 
						VALUES ('".$_POST['casa']."','".$_POST['calle']."','".$_POST['urbanizacion']."','".$_POST['p_referencia']."','".$_POST['parroquia_id']."','".$_POST['zona_postal']."')";	
			}
			$idub = $this->_main->insertar($query);
			
		}else{
			$idub = 'NULL';
		}
		/*print_r($_SESSION['numstlf']);
		var_dump($_POST);exit();*/
		$query = "INSERT INTO `proveedor`(`nombre`, `rif`, `razon_social`, `correo`, `pagina_web`, `status`, `ubicacion_id`, `empresa_id`,`procedencia_id`) 
		VALUES ('".$_POST['nombre']."','".$_POST['rif']."','".$_POST['razon_social']."','".$_POST['correo']."','".$_POST['pagina']."',0,$idub,$idt,'".$_POST['procede']."')";
		$idprov = $this->_main->insertar($query);
		$query = "INSERT INTO `persona`(`nombre`, `telefono`, `correo`, `tipo_persona_id`, `proveedor_id`) VALUES ('".$_POST['nombrecontact']."','".$_POST['numcontact']."','".$_POST['correocontact']."',234,$idprov)";
		$contacto = $this->_main->insertar($query);
		$query = "INSERT INTO `requisitos`(`ISLR`, `RIF`, `certificado_contratistas`, `Solvencia_laboral`, `Permiso_sanitario`, `proveedor_id`) VALUES ('".$_POST['islr']."','".$_POST['rifvigente']."','".$_POST['contratista']."','".$_POST['solvlaboral']."','".$_POST['persanitario']."',$idprov)";
		$permisos = $this->_main->insertar($query);
		if (isset($_SESSION['numstlf'])) {
			$telefonos = $_SESSION['numstlf'];
			for ($i=0; $i <count($telefonos) ; $i++) { 
				$query = "INSERT INTO `telefono`(`numero`, `codigo_id`) VALUES ('".$telefonos[$i]['numero']."','".$telefonos[$i]['codigo_id']."')";
				$numerost = $this->_main->insertar($query);
				$query = "INSERT INTO `proveedor_has_telefono`(`proveedor_id`, `telefono_id`) VALUES ($idprov,$numerost)";
				$tlfsxprov = $this->_main->insertar($query);
			}
		}
		if (isset($_SESSION['socios'])) {
			$socios = $_SESSION['socios'];
			for ($i=0; $i <count($socios) ; $i++) { 
				$query = "INSERT INTO `persona`(`nombre`, `telefono`, `correo`, `tipo_persona_id`, `proveedor_id`) VALUES ('".$socios[$i]['nombre']."','".$socios[$i]['telefono']."','".$socios[$i]['correo']."',233,$idprov)";
				$socios = $this->_main->insertar($query);
			}
		}
		if (isset($_SESSION['vendedores'])) {
			$vendedores = $_SESSION['vendedores'];
			for ($i=0; $i <count($vendedores) ; $i++) { 
				$query = "INSERT INTO `persona`(`nombre`, `cargo`,`telefono`, `correo`, `tipo_persona_id`, `proveedor_id`) VALUES ('".$vendedores[$i]['nombre']."','".$vendedores[$i]['cargo']."','".$vendedores[$i]['telefono']."','".$vendedores[$i]['correo']."',232,$idprov)";
				$vende = $this->_main->insertar($query);
			}
		}
		if (!empty($idprov)) {
			$proveedor['name'] = $_POST['nombre'];
			$proveedor['proceso'] = $_POST['tipoproceso'];
			echo json_encode($proveedor);
		}
	}

	function listing(){
		$this->_view->setJs(array('js/jquery-2.1.4.min'));
		$this->_view->setJs(array('js/bootstrap'));
		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
	    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
	    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
	    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
	    $this->_view->setJs(array('datatable/js/tabla'));
	    $this->_view->setJs(array('js/proveedores'));
	    $query = "SELECT * FROM proveedor";
	    $proveedores = $this->_main->select($query);
		$this->_view->render('listing');
	}

	public function datosprov($id){
		$query = "SELECT proveedor.id as idprov, proveedor.nombre as prov, rif, razon_social, correo, status, ubicacion_id, empresa_id, ubicacion.id as idub, edificio, calle, urbanizacion, nro_intercomunicador, punto_referencia, parroquia_id, parroq.nombre as parroquia, muni.id as municipio_id, muni.nombre as municipio, edo.id as estado_id, edo.nombre as estado, telefono.id as idtlf, telefono.numero, telefono.codigo_id, referencia.referencia as codigotlf
			FROM `proveedor`
			left join ubicacion on ubicacion_id = ubicacion.id 
			left join direccion as parroq on parroquia_id = parroq.id
			left join direccion as muni on muni.id = parroq.padre_id
			left join direccion as edo on edo.id = muni.padre_id
			left join proveedor_has_telefono on proveedor.id = proveedor_id
			left join telefono on telefono.id = telefono_id
			left join referencia on telefono.codigo_id = referencia.id
			where proveedor.id = $id";
		$data = $this->_main->select($query);
		echo json_encode($data);
	}

	public function datostlf($numero,$tipo,$codigo_id,$cod){
		//Session::destroy('numstlf');
		if (isset($_SESSION['numstlf'])) {
			$arreglo = $_SESSION['numstlf'];
			//print_r($arreglo); echo "<br>";
			$encontro=false;
    		$num=0;
    		for($i=0;$i<count($arreglo);$i++){
	          if($arreglo[$i]['numero']==$numero and $arreglo[$i]['codigo_id'] == $codigo_id){
	            $encontro=true;
	            $num=$i;
	          }else{
	          	$num++;
	          }
	        }
	        	if($encontro==true){
		          switch ($tipo) {
		            case '1':
		                $arreglo[$num]['id']= $num;
		                $arreglo[$num]['numero']= $numero;
		                $arreglo[$num]['codigo_id']= $codigo_id;
		                $arreglo[$num]['codigo']= $cod;
		                $_SESSION['numstlf']=$arreglo; 
		            break;
		            
		            default:
		            	unset($_SESSION['numstlf'][$num]);
		                $arreglo = array_values($_SESSION['numstlf']);
		                $_SESSION['numstlf']=$arreglo;
		            break;
		          }
		          
		        }else{
		        	if ($tipo == 1) {
			        	$arreglo = $_SESSION['numstlf'];
			        	$datosNuevos=array('id'=>$num,
			        						'numero'=>$numero,
			        						'codigo_id'=>$codigo_id,
			        						'codigo'=>$cod
		                );
		                  array_push($arreglo, $datosNuevos);
			          	$_SESSION['numstlf']=$arreglo;
		        	}
		        	
		        }
		}else{
			$n = 0;
			$arreglo[]=array('id'=>$n,
							'numero'=>$numero,
			        		'codigo_id'=>$codigo_id,
			        		'codigo'=>$cod
            );
			$_SESSION['numstlf'] = $arreglo;
		}
		
		echo json_encode($_SESSION['numstlf']);
			
	}

	public function datossocio($tipo=false,$nombre = false, $correo = false){
		if ($nombre != false and $correo != false) {
			$nombresocio = $nombre;
			$email = $correo;
		}else{
			$nombresocio = $_POST['nombresocio'];
			$email = $_POST['mailsocio'];
		}
		//var_dump($_POST);
		//Session::destroy('socios');
		if (isset($_SESSION['socios'])) {
			
			$arreglo = $_SESSION['socios'];
			//print_r($arreglo); echo "<br>";
			$encontro=false;
    		$num=0;
    		for($i=0;$i<count($arreglo);$i++){
	          if($arreglo[$i]['nombre']== $nombresocio and $arreglo[$i]['correo'] == $email){
	            $encontro=true;
	            $num=$i;
	          }else{
	          	$num++;
	          }
	        }
	        	if($encontro==true){
		          switch ($tipo) {
		            case 1:
		                $arreglo[$num]['id']= $num;
		                $arreglo[$num]['nombre']= $nombresocio;
		                $arreglo[$num]['telefono']=  $_POST['tlfsocio'];
		                $arreglo[$num]['correo']=  $email;
		                $_SESSION['socios']=$arreglo; 
		            break;
		            
		            default:
		            	unset($_SESSION['socios'][$num]);
		                $arreglo = array_values($_SESSION['socios']);
		                $_SESSION['socios']=$arreglo;
		            break;
		          }
		          
		        }else{
		        	if ($tipo == 1) {
			        	$arreglo = $_SESSION['socios'];
			        	$datosNuevos=array('id'=>$num,
			        						'nombre'=>$nombresocio,
			        						'telefono'=>$_POST['tlfsocio'],
			        						'correo'=>$email
		                );
		                  array_push($arreglo, $datosNuevos);
			          	$_SESSION['socios']=$arreglo;
		        	}
		        	
		        }
		}else{
			$n = 0;
			$arreglo[]=array('id'=>$n,
							'nombre'=>$nombresocio,
			        		'telefono'=>$_POST['tlfsocio'],
			        		'correo'=>$email
            );
			$_SESSION['socios'] = $arreglo;
		}
		
		echo json_encode($_SESSION['socios']);
			
	}

	public function datosvendedor($tipo=false,$nombre = false, $correo = false){
		//var_dump($_POST);
		if ($nombre != false and $correo != false) {
			$nombrevendedor = $nombre;
			$email = $correo;
		}else{
			$nombrevendedor = $_POST['nombrevendedor'];
			$email = $_POST['mailvendedor'];
		}
		//var_dump($_POST);
		//Session::destroy('vendedor');
		if (isset($_SESSION['vendedores'])) {
			
			$arreglo = $_SESSION['vendedores'];
			//print_r($arreglo); echo "<br>";
			$encontro=false;
    		$num=0;
    		for($i=0;$i<count($arreglo);$i++){
	          if($arreglo[$i]['nombre']== $nombrevendedor and $arreglo[$i]['correo'] == $email){
	            $encontro=true;
	            $num=$i;
	          }else{
	          	$num++;
	          }
	        }
	        	if($encontro==true){
		          switch ($tipo) {
		            case 1:
		                $arreglo[$num]['id']= $num;
		                $arreglo[$num]['nombre']= $nombrevendedor;
		                $arreglo[$num]['cargo']=  $_POST['cargovendedor'];
		                $arreglo[$num]['telefono']=  $_POST['tlfvendedor'];
		                $arreglo[$num]['correo']=  $email;
		                $_SESSION['vendedores']=$arreglo; 
		            break;
		            
		            default:
		            	unset($_SESSION['vendedores'][$num]);
		                $arreglo = array_values($_SESSION['vendedores']);
		                $_SESSION['vendedores']=$arreglo;
		            break;
		          }
		          
		        }else{
		        	if ($tipo == 1) {
			        	$arreglo = $_SESSION['vendedores'];
			        	$datosNuevos=array('id'=>$num,
			        						'nombre'=>$nombrevendedor,
			        						'cargo'=>$_POST['cargovendedor'],
			        						'telefono'=>$_POST['tlfvendedor'],
			        						'correo'=>$email
		                );
		                  array_push($arreglo, $datosNuevos);
			          	$_SESSION['vendedores']=$arreglo;
		        	}
		        	
		        }
		}else{
			$n = 0;
			$arreglo[]=array('id'=>$n,
							'nombre'=>$nombrevendedor,
							'cargo'=>$_POST['cargovendedor'],
			        		'telefono'=>$_POST['tlfvendedor'],
			        		'correo'=>$email
            );
			$_SESSION['vendedores'] = $arreglo;
		}
		
		echo json_encode($_SESSION['vendedores']);
			
	}

	public function updateprov($idprov,$idub){
		$query = "UPDATE `proveedor` SET `nombre`='".$_POST['nombre']."',`rif`='".$_POST['rif']."',`razon_social`='".$_POST['razon_social']."',`correo`='".$_POST['correo']."' 
		WHERE proveedor.id = $idprov";
		$updatedprov = $this->_main->modificar($query);
		if (!empty($_POST['parroquia_id'])) {
			if (isset($_POST['edificio'])) {
				$query = "UPDATE `ubicacion` SET `edificio`='".$_POST['edificio']."',`calle`='".$_POST['calle']."',`urbanizacion`='".$_POST['urbanizacion']."',`nro_intercomunicador`='".$_POST['intercomunicador']."',`punto_referencia`='".$_POST['p_referencia']."',`parroquia_id`='".$_POST['parroquia']."' WHERE ubicacion.id = $idub";
				$updatedubi = $this->_main->modificar($query);
			}else{
				$query = "UPDATE `ubicacion` SET `edificio`='".$_POST['casa']."',`calle`='".$_POST['calle']."',`urbanizacion`='".$_POST['urbanizacion']."',`nro_intercomunicador`='".$_POST['intercomunicador']."',`punto_referencia`='".$_POST['p_referencia']."',`parroquia_id`='".$_POST['parroquia']."' WHERE ubicacion.id = $idub";
				$updatedubi = $this->_main->modificar($query);
			}
		}
		
		$proveedor['name'] = $_POST['nombre'];
		$proveedor['proceso'] = $_POST['tipoproceso'];
		echo json_encode($proveedor);
	}

	public function mostrarnumeros(){
		$data = $_SESSION['numstlf'];
		$response = array("data"=>$data);
		//print_r($response);
		echo json_encode($response);
	}

	public function mostrarsocios(){
		$data = $_SESSION['socios'];
		$response = array("data"=>$data);
		//print_r($response);
		echo json_encode($response);
	}

	public function mostrarvendedores(){
		$data = $_SESSION['vendedores'];
		$response = array("data"=>$data);
		//print_r($response);
		echo json_encode($response);
	}

	public function mostrarnumerosprov($idprov){
		$query = "SELECT numero, codigo_id, referencia.referencia as codigo FROM telefono
		inner join proveedor_has_telefono as pht on telefono.id = pht.telefono_id
		inner join proveedor on pht.proveedor_id = proveedor.id
		inner join referencia on referencia.id = codigo_id
		where proveedor.id = $idprov";
		$data = $this->_main->select($query);
		echo json_encode($data);
	}

	public function vaciarsesion(){
		Session::destroy('numstlf');
		$data = true;
		echo json_encode($data);
	}

	public function updatetlfs($idprov){

		if (isset($_SESSION['numstlf'])) {	
			$numeros = $_SESSION['numstlf'];
			$query = "DELETE FROM `proveedor_has_telefono` WHERE proveedor_id = $idprov";
			$desasingado = $this->_main->eliminar($query);
			for ($i=0; $i <count($numeros) ; $i++) {
				$query = "DELETE FROM `telefono` WHERE numero = '".$numeros[$i]['numero']."' and codigo_id = '".$numeros[$i]['codigo_id']."'";
				$eliminado = $this->_main->eliminar($query);
				$query = "INSERT INTO `telefono`(`numero`, `codigo_id`) VALUES ('".$numeros[$i]['numero']."','".$numeros[$i]['codigo_id']."')";
				$numerost = $this->_main->insertar($query);
				$query = "INSERT INTO `proveedor_has_telefono`(`proveedor_id`, `telefono_id`) VALUES ($idprov,$numerost)";
				$updatetxp = $this->_main->insertar($query);
			}
			$this->datosprov($idprov);
		}else if (empty($_SESSION['numstlf'])) {
			$query = "DELETE FROM `proveedor_has_telefono` WHERE proveedor_id = $idprov";
			$desasingado = $this->_main->eliminar($query);
			$this->datosprov($idprov);
		}
		
		
	}

	public function consultar($idt,$status){
		if ($status == 2) {
			$st = 0;
		}else{
			$st = $status;
		}
		$query = "SELECT * FROM proveedor where status = $st and empresa_id = $idt order by id desc";
	    $proveedores = $this->_main->select($query);
	    $response = array("data"=>$proveedores);
		//print_r($response);
		echo json_encode($response);

	}

	public function cambiarstatus($idprov,$status){
		if ($status == 2) {
			$st = 0;
		}else{
			$st = $status;
		}
		$query = "UPDATE `proveedor` SET `status`=$st
		WHERE proveedor.id = $idprov";
		$updatedprov = $this->_main->modificar($query);
		$this->datosprov($idprov);
	}

	public function productosasignados($idprov){
		$query = "SELECT mercancia_id, proveedor_id, codigo_x_proveedor as codiprov, precio as precioprov, format(precio,4,'de_DE') as precioprovF, pm.status, proveedor.nombre as prov, rif, razon_social, proveedor.status as st, mercancia.codigo as codigom, mercancia.nombre as producto, marca, CONCAT(mercancia.nombre,' ',marca) as mercancia, precio_unitario, format(precio_unitario,4,'de_DE') as precioU, contenido_neto, formula_c, formula_p, formula_s, familia_id, sub_familia_id, ref.referencia as family, ref2.referencia as subfamily, unidad_medida.id as idums, unidad_presentacion.id as idump, unidad_compra.id as idumc, unidad_medida.abreviatura as avums, unidad_presentacion.abreviatura as avump, unidad_compra.abreviatura as avumc, tipo_mercancia_id  
			FROM `proveedor_has_mercancia` as pm
			inner join proveedor on proveedor.id = proveedor_id
			inner join mercancia on mercancia.id = mercancia_id
			inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
			inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
			left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
			inner join referencia as ref on ref.id = mercancia.familia_id
			left join referencia as ref2 on ref2.id = mercancia.sub_familia_id
			WHERE proveedor_id = $idprov and pm.status = 0 order by pm.id desc";
			$prodxprov = $this->_main->select($query);
		    $response = array("data"=>$prodxprov);
			//print_r($response);
			echo json_encode($response);
	}

	public function productosnoasignados($idprov,$idt){
		/*funcion para cargar los ingredientes que corresponden a la empresa pero unicamente los que no tiene asignados el proveedor seleccionado*/
    	$query = "SELECT DISTINCT mercancia.id as idpro, codigo, nombre as producto, marca, CONCAT(nombre,' ',marca) as mercancia, referencia.referencia as clasificacion, existencia, format(existencia,4,'de_DE') as stock, stock_min, format(stock_min,4,'de_DE') as stmin, unidad_medida.id as idums, unidad_presentacion.id as idump, unidad_compra.id as idumc, unidad_medida.abreviatura as avums, unidad_presentacion.abreviatura as avump, unidad_compra.abreviatura as avumc FROM `mercancia`
		inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
		inner join referencia on referencia.id = familia_id
		inner join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id
		inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id 
		left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id 
		where unidad_negocio_id = $idt and mercancia.id not in(SELECT mercancia_id 
		FROM proveedor_has_mercancia 
		where proveedor_id = $idprov)";
		$data = $this->_main->select($query);
		$response = array("data"=>$data);
    	//print_r($response);
    	echo json_encode($response);
	}

	public function asingados(){
		$query = "INSERT INTO `proveedor_has_mercancia`(`mercancia_id`, `proveedor_id`, `codigo_x_proveedor`, `precio`, `status`) VALUES ('".$_POST['idmer']."','".$_POST['idproveedor']."','".$_POST['codiprov']."','".$_POST['preciounit']."',0)";
		$pxm = $this->_main->insertar($query);
		$this->datosprov($_POST['idproveedor']);
	}

	public function desasignar($idprod,$idprov){
		$query = "DELETE FROM `proveedor_has_mercancia` WHERE mercancia_id = $idprod and proveedor_id = $idprov";
		$desasingado = $this->_main->eliminar($query);
		$this->datosprov($idprov);
	}

	public function editado($idprod,$idprov,$codigo=false,$precio=false){
		if ($codigo == 'false') {
			$cod = 'NULL';
		}else{
			$cod = '"'.$codigo.'"';
		}

		if ($precio == 'false') {
			$pre = '0.0000';
		}else{
			$pre = '"'.$precio.'"';
		}
			$query = "UPDATE `proveedor_has_mercancia` SET `codigo_x_proveedor`=$cod,`precio`=$pre WHERE  mercancia_id = $idprod and proveedor_id = $idprov";
			$edited = $this->_main->modificar($query);
		
		$this->datosprov($idprov);
	}
	
	
	
}


?>