<?php 
	class recetaController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_receta;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			
		//Objeto donde almacenamos todas las funciones de PersonsModel.php

			$this->_sidebar_menu =array(
					array(
				'id' => 'insert_new',
				'title' => 'Nueva receta',
				'link' => BASE_URL . 'persons' . DS . 'insert'
						)
			);

			//Session::accessRole(array('Super usuario','AdministradorB'));
		}
		
		function index(){
			$this->_view->render('recetario', 'receta', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		function indexr($id){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setJs(array('js/recetario'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
			$query = "SELECT unidad_negocio.id as idU, unidad_negocio.nombre as udn, modelo.nombre as modelo, modelo.id as idm, empresa_id From unidad_negocio
    		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $id";
    		$mo = $this->_main->select($query);
    		$this->_view->model = $mo;
    		$this->_view->render('recetario', 'inventario', '',''); 
		}

		public function autocompletarp($modelo){
			$query = "SELECT producto.id, producto.nombre as value from producto
			inner join producto_has_unidad_negocio on producto.id = producto_has_unidad_negocio.producto_id
			inner join unidad_negocio on unidad_negocio.id = producto_has_unidad_negocio.unidad_negocio_id
			inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
			where modelo_has_submodelo.modelo_id = $modelo group by producto.nombre";
    		$data = $this->_main->select($query);
    		echo json_encode($data);
		}

		public function idpro($producto){
			$name = str_replace("@"," ",$producto);
			$query = "SELECT id, nombre from producto where producto.nombre like '%".$name."%'";
    		$data = $this->_main->select($query);
    		echo json_encode($data);
		}

		public function nombrepro($producto, $ingrediente){
			if ($producto !=999999) {
				$query = "SELECT producto.id as idpr, producto.nombre as producto, receta.id as idre, receta.nombre as receta, receta_id, producto.precioVta_A as pvp, format(precioVta_A,4,'de_DE') as precioU from producto
			left join receta on receta_id = receta.id 
			where producto.id = $producto";
    		$data = $this->_main->select($query);
			}else{
				$query = "SELECT mercancia.id as idpr, mercancia.nombre as producto, marca, receta.id as idre, receta.nombre as receta, mercancia.receta_id from mercancia
			left join ingrediente_has_receta on ingrediente_id = mercancia.id
			left join receta on mercancia.receta_id = receta.id 
			where mercancia.id = $ingrediente";
    		$data = $this->_main->select($query);
			}
    		echo json_encode($data);
		}

        public function updatepvp($precio,$producto,$receid,$costor){
            $mystring = $precio;
            $findme   = ',';
            $pos = strpos($mystring, $findme);
            if ($pos != false) {
                $p1 = str_replace(".","",$precio);
                $pvp = str_replace(",",".",$p1);
            }else{
                $pvp = $precio;
            }
            $query = "UPDATE `producto` SET `precioVta_A`= $pvp WHERE producto.id = $producto";
            $idp = $this->_main->modificar($query);

            $data = $this->nombreproducto($producto);

            echo json_encode($data);
        }

        public function updatecosto($producto,$ingrediente,$totalcosto,$porcentajec){
            if ($producto != 999999) {
                $query = "UPDATE `producto` SET `costo` = $totalcosto, `porcentaje_costo`= $porcentajec WHERE producto.id = $producto";
                $data = $this->_main->modificar($query);
            }else{
                $query = "UPDATE `mercancia` SET `precio_unitario` = $totalcosto WHERE mercancia.id = $ingrediente";
                $data = $this->_main->modificar($query);
            }
            echo json_encode($data);
        }

		public function nombreing($ingrediente){
			$query = "SELECT mercancia.id as idm, mercancia.nombre as producto, marca, receta.id as idre from mercancia
left join ingrediente_has_receta on ingrediente_id = mercancia.id
			left join receta on ingrediente_has_receta.receta_id = receta.id 
			where mercancia.id = $ingrediente";
    		$this->_main->select($query);
            $data = true;
    		echo json_encode($data);
		}

		public function consultarpro($modelo){
			$query = "SELECT DISTINCT(producto.id) as idpro, producto.codigo as codip, producto.nombre as producto, costo, format(costo,4,'de_DE') as costom, porcentaje_costo, format(porcentaje_costo,2,'de_DE') as porcentajec, format(precioVta_A,4,'de_DE') as pvpam, precioVta_A as pvpa, format(precioVta_A,4,'de_DE') as pvp, precioVta_B as pvpb, receta_id as idr FROM `producto`
inner join producto_has_unidad_negocio on producto_has_unidad_negocio.producto_id = producto.id
inner join unidad_negocio on unidad_negocio.id = producto_has_unidad_negocio.unidad_negocio_id
inner join modelo_has_submodelo on unidad_negocio.modelo_has_submodelo_id = modelo_has_submodelo.id
WHERE modelo_has_submodelo.modelo_id = $modelo";
    		$data = $this->_main->select($query);
    		for ($i=0; $i < count($data); $i++) { 
    			if ($data[$i]['idr'] != null) {
    				$idreceta[$i] = 'Si';
    				$icono[$i] = 'fa-eye';
    				$ver[$i] = 'Editar';
    				$titulo[$i] = 'Ver receta de';
    			}else{
    				$idreceta[$i] = 'No';
    				$icono[$i] = 'fa-plus-square-o';
    				$ver[$i] = 'Asignar';
    				$titulo[$i] = 'Agregar receta para';
    			}
    			$data[$i]['idrec'] = $idreceta[$i];
    			$data[$i]['icon'] = $icono[$i];
    			$data[$i]['ver'] = $ver[$i];
    			$data[$i]['titulo'] = $titulo[$i];
    		}
    		
    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

		public function consultasp($idp,$idreceta){
			if ($idp != 999999) {
				//echo "if<br>"; 
				$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, format(ixr.cantidad,4,'de_DE') as cantidad, abreviatura, CONCAT(mercancia.nombre, ' ', mercancia.marca) As ingrediente, producto.id as idprod, producto.nombre as producto, format(mercancia.precio_unitario,4,'de_DE') as costo, mercancia.precio_unitario as precioU, receta.id as idreceta, mercancia.receta_id, receta.nombre as receta  FROM `ingrediente_has_receta` as ixr
			inner join receta on receta.id = ixr.receta_id
			inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
			inner join mercancia on mercancia.id = ixr.ingrediente_id
			inner join producto on receta.id = producto.receta_id
			WHERE producto.id = $idp";
    		$data = $this->_main->select($query);
			}else{
				//echo "else<br>"; 
				$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, format(ixr.cantidad,4,'de_DE') as cantidad, abreviatura, mercancia.nombre as producto, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, format(mercancia.precio_unitario,4,'de_DE') as costo, mercancia.precio_unitario as precioU, ixr.receta_id as idreceta, mercancia.receta_id, receta.nombre as receta  
					FROM `mercancia`
					inner join ingrediente_has_receta as ixr on mercancia.id = ixr.ingrediente_id
					inner join receta on receta.id = ixr.receta_id
                    inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
					WHERE ixr.receta_id = $idreceta";
		    		$data = $this->_main->select($query);
			}
			
    		/*for ($i=0; $i < count($data); $i++) { 
    			$total[] = $data[$i]['cantidad'] * $data[$i]['precioU'];
    		}
    		$data[0]['total'] = $total;*/
    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
		}

        public function costototal($idp,$idreceta){
            if ($idp != 999999) {
                $query = "SELECT SUM(mercancia.precio_unitario) as costototal, format(SUM(mercancia.precio_unitario),4,'de_DE') as costot, receta.id as idreceta, receta.nombre as receta, precioVta_A as pvp  
FROM `ingrediente_has_receta` as ixr
            inner join receta on receta.id = ixr.receta_id
            inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id
            inner join mercancia on mercancia.id = ixr.ingrediente_id
            inner join producto on receta.id = producto.receta_id
            WHERE producto.id = $idp";
            $data = $this->_main->select($query);
            }else{
                $query = "SELECT SUM(mercancia.precio_unitario) as costototal, format(SUM(mercancia.precio_unitario),4,'de_DE') as costot, receta.id as idreceta, receta.nombre as receta 
                    FROM `mercancia`
                    inner join ingrediente_has_receta as ixr on mercancia.id = ixr.ingrediente_id
                    inner join receta on receta.id = ixr.receta_id
                    WHERE ixr.receta_id = $idreceta";
                    $data = $this->_main->select($query);

            }
            echo json_encode($data);

        }

		public function insertIngrediente($idpro,$idrec,$idmer,$cantxing,$unidad){
				$query = "SELECT * from ingrediente_has_receta where ingrediente_id = $idmer and receta_id = $idrec";
				$info = $this->_main->select($query);
				if (!empty($info)) {
					$data = 'duplicado';
				}else{
				$query = "INSERT INTO `ingrediente_has_receta`(`ingrediente_id`, `receta_id`, `cantidad`, `unidad_medida_id`) 
					VALUES ($idmer, $idrec, $cantxing, $unidad)";
					$idD = $this->_main->insertar($query);
					$data = $idpro;
				}
				echo json_encode($data);	

		}

        public function updateIngrediente($idpro,$idrec,$idmer,$cantxing){      
                $query = "UPDATE `ingrediente_has_receta` SET `cantidad`=$cantxing where ingrediente_id = $idmer and receta_id = $idrec";
                    $this->_main->insertar($query);
                    $data = $idpro;
                echo json_encode($data);    
        }

		public function eliminarIngrediente($producto,$idmer,$idreceta){
				$query = "DELETE FROM `ingrediente_has_receta` where ingrediente_id = $idmer and receta_id = $idreceta";
				$idD = $this->_main->eliminar($query);
				$data[0]['producto'] = $producto;
				$data[0]['ingrediente'] = $idmer;
				echo json_encode($data);
		}

		

		public function loadingredientes($idm){
		$query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, unidad_medida_compra_id as umcid, unidad_medida_consumo_id as umpid, unidad_medida_sistema_id as umsid, umc.abreviatura as abumc, ump.abreviatura as abump, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) As ingrediente, mercancia.precio_unitario as precioU  FROM `mercancia`
			left join unidad_medida as umc on umc.id = mercancia.unidad_medida_compra_id
            inner join unidad_medida as ump on ump.id = mercancia.unidad_medida_consumo_id
            inner join unidad_medida as ums on ums.id = mercancia.unidad_medida_sistema_id
            inner join mercancia_has_unidad_negocio as mudn on mudn.mercancia_id = mercancia.id
            inner join unidad_negocio on unidad_negocio.id = mudn.unidad_negocio_id
            inner join modelo_has_submodelo as mhsm on mhsm.id = unidad_negocio.modelo_has_submodelo_id
            inner join modelo on mhsm.modelo_id = modelo.id
            where modelo.id = $idm";
            $data = $this->_main->select($query);

    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}


		public function ingredientesreceta($idm){
		$query = "SELECT DISTINCT(mercancia.codigo) as codigi, mercancia.id as idi , unidad_medida_compra_id as umcid, unidad_medida_consumo_id as umpid, unidad_medida_sistema_id as umsid, umc.abreviatura as abumc, ump.abreviatura as abump, ums.abreviatura as abums, mercancia.nombre as mercancia, mercancia.marca as marca, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, mercancia.precio_unitario as costo, format(mercancia.precio_unitario,4,'de_DE') as precioU, mercancia.contenido_neto, CONCAT(contenido_neto,' ',ums.abreviatura) as contenido, mercancia.receta_id as idr, familia_id, referencia.referencia as familia FROM `mercancia`
            inner join referencia on referencia.id = mercancia.familia_id
			left join unidad_medida as umc on umc.id = mercancia.unidad_medida_compra_id
            inner join unidad_medida as ump on ump.id = mercancia.unidad_medida_consumo_id
            inner join unidad_medida as ums on ums.id = mercancia.unidad_medida_sistema_id
            inner join mercancia_has_unidad_negocio as mudn on mudn.mercancia_id = mercancia.id
            inner join unidad_negocio on unidad_negocio.id = mudn.unidad_negocio_id
            inner join modelo_has_submodelo as mhsm on mhsm.id = unidad_negocio.modelo_has_submodelo_id
            inner join modelo on mhsm.modelo_id = modelo.id
            where modelo.id = $idm and familia_id = 135";
            $data = $this->_main->select($query);
            for ($i=0; $i < count($data); $i++) { 
    			if ($data[$i]['idr'] != null) {
    				$idreceta[$i] = 'Si';
    				$icono[$i] = 'fa-eye';
    				$ver[$i] = 'Editar';
    				$titulo[$i] = 'Ver receta de';
    			}else{
    				$idreceta[$i] = 'No';
    				$icono[$i] = 'fa-plus-square-o';
    				$ver[$i] = 'Asignar';
    				$titulo[$i] = 'Agregar receta para';
    			}
    			$data[$i]['idrec'] = $idreceta[$i];
    			$data[$i]['icon'] = $icono[$i];
    			$data[$i]['ver'] = $ver[$i];
    			$data[$i]['titulo'] = $titulo[$i];
    		}

    		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}

		public function mercancia($idingrediente){
    		$query = "SELECT mercancia.id, mercancia.nombre, mercancia.marca, contenido_neto, unidad_medida.abreviatura as US, unidad_medida.unidad as unidadS, um.abreviatura as UP, um.unidad as unidadP, um2.abreviatura as UC, um2.unidad as unidadC, unidad_medida_sistema_id as idUS, unidad_medida_consumo_id as idUP, unidad_medida_compra_id as idUC from mercancia
    		inner join unidad_medida on unidad_medida_sistema_id = unidad_medida.id
    		inner join unidad_medida as um on um.id = unidad_medida_consumo_id
    		left join unidad_medida as um2 on um2.id = unidad_medida_compra_id
    		where mercancia.id = $idingrediente group by US,UP,UC";
    		$conte = $this->_main->select($query);
    		echo json_encode($conte);

    	}

    	function nombreproducto($producto){
			$query = "SELECT producto.id as idpr, producto.nombre as producto, receta.id as idre from producto
			left join receta on receta_id = receta.id 
			where producto.id = $producto";
    		$data = $this->_main->select($query);
    		return $data;
		}

		function nombreingrediente($iding){
			$query = "SELECT mercancia.id, mercancia.nombre, mercancia.marca, contenido_neto, unidad_medida.abreviatura as US, unidad_medida.unidad as unidadS, um.abreviatura as UP, um.unidad as unidadP, um2.abreviatura as UC, um2.unidad as unidadC, unidad_medida_sistema_id as idUS, unidad_medida_consumo_id as idUP, unidad_medida_compra_id as idUC from mercancia
    		inner join unidad_medida on unidad_medida_sistema_id = unidad_medida.id
    		inner join unidad_medida as um on um.id = unidad_medida_consumo_id
    		left join unidad_medida as um2 on um2.id = unidad_medida_compra_id
    		where mercancia.id = $iding";
    		$data = $this->_main->select($query);
    		return $data;
		}

		public function crearreceta($idpro,$idmodelo,$ingrediente,$rendimiento,$umr){
    		$mystring = $rendimiento;
            $findme   = ',';
            $pos = strpos($mystring, $findme);
            if ($pos != false) {
                $p1 = str_replace(".","",$rendimiento);
                $rendi = str_replace(",",".",$p1);
            }else{
                $rendi = $rendimiento;
            }
    		
    		if ($ingrediente == 999999) {
    			$datosp = $this->nombreproducto($idpro);
    			$query = "INSERT INTO `receta`(`nombre`,`rendimiento`,`unidad_medida_id`) VALUES ('".$datosp[0]['producto']."',$rendi,$umr)";
    			$idr = $this->_main->insertar($query);
    			$query = "UPDATE `producto` SET `receta_id`='".$idr."' WHERE producto.id = $idpro";
    			$this->_main->modificar($query);
    		}else{
    			$datosp = $this->nombreingrediente($ingrediente);
    			$query = "INSERT INTO `receta`(`nombre`,`rendimiento`,`unidad_medida_id`) VALUES ('".$datosp[0]['nombre'].' '.$datosp[0]['marca']."',$rendi,$umr)";
    			$idr = $this->_main->insertar($query);
    			$query = "UPDATE `mercancia` SET `receta_id`='".$idr."' WHERE mercancia.id = $ingrediente";
    			$this->_main->modificar($query);
    		}
    		$query = "INSERT INTO `modelo_has_receta`(`modelo_id`, `receta_id`) VALUES ('".$idmodelo."','".$idr."')";
    		$idrm = $this->_main->insertar($query);
    		
    		echo json_encode($idr);

    	}



}
?>