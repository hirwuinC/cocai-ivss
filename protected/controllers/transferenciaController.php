<?php 
	class transferenciaController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_transferencia;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			//$this->_transferencia = $this->loadModel('transferencia');
			//Session::accessRole(array('Super usuario','AdministradorB'));
		}

		function index($id=false){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $this->_view->setJs(array('js/transferencia'));
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
			$this->_view->render('indexT', 'transferencia', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

		public function notificacion($idt,$status1,$status2,$tipo,$f1=false,$f2=false){
			if ($tipo == 1) {
				$cond = 'nt.unidad_negocio_id = '.$idt.'';
			}else{
				$cond = '(reposicion_mercancia.unidad_negocio_id = '.$idt.' or remision.unidad_negocio_id = '.$idt.')';
			}
			if ($f1 != false) {
				$condic = 'and (remision.fecha BETWEEN '."'".$f1."'".' and '."'".$f2."'".' or reposicion_mercancia.fecha BETWEEN '."'".$f1."'".' and '."'".$f2."'".')';
			}else{
				$condic = '';
			}
			
			$query = "SELECT remision_id, reposicion_id, nt.unidad_negocio_id as idunt, status_id, unidad_negocio.codigo as codiudR, unidad_negocio.nombre as tiendaR, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, referencia.referencia as status, reposicion_mercancia.unidad_negocio_id as idurepo, remision.unidad_negocio_id as iduremi, udnrepo.nombre as tiendarepo, udnrepo.rif as rifrepo, udnrepo.razon_social as razon_srepo, udnrepo.correo as emailurepo, udnrepo.empresa_id as idempresaurepo, udnremi.nombre as tiendaremi, udnremi.rif as rifremi, udnremi.razon_social as razon_sremi, udnremi.correo as emailuremi, udnremi.empresa_id as idempresauremi, usuario.nombre as nombreremi, usuario.apellido as apellidoremi, user.nombre as nombrerepo, user.apellido as apellidorepo, remision.usuario_id as idusremi, reposicion_mercancia.usuario_id as idusrepo,  modelo.nombre as modelo, modelrepo.nombre as modelorepo, modelremi.nombre as modeloremi, num_remision, num_reposicion, remision.fecha as fecharemi, remision.hora as horaremi, reposicion_mercancia.fecha as fecharepo, reposicion_mercancia.hora as horarepo, reposicion_mercancia.total
				FROM `notificacion_has_remision`as nt 
				LEFT JOIN remision on remision_id = remision.id 
				LEFT JOIN reposicion_mercancia on reposicion_mercancia.id = reposicion_id 
				INNER JOIN unidad_negocio on unidad_negocio.id = nt.unidad_negocio_id 
				LEFT JOIN unidad_negocio as udnrepo on udnrepo.id = reposicion_mercancia.unidad_negocio_id 
				LEFT JOIN unidad_negocio as udnremi on udnremi.id = remision.unidad_negocio_id 
				INNER JOIN referencia on referencia.id = status_id
				left JOIN usuario on usuario.id = remision.usuario_id
				left JOIN usuario as user on user.id = reposicion_mercancia.usuario_id
				LEFT JOIN modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      			LEFT JOIN modelo on modelo.id = modelo_has_submodelo.modelo_id
      			LEFT JOIN modelo_has_submodelo as mhsrepo on mhsrepo.id = udnrepo.modelo_has_submodelo_id
      			LEFT JOIN modelo as modelrepo on modelrepo.id = modelo_has_submodelo.modelo_id
      			LEFT JOIN modelo_has_submodelo as mhsremi on mhsremi.id = udnremi.modelo_has_submodelo_id
      			LEFT JOIN modelo as modelremi on modelremi.id = modelo_has_submodelo.modelo_id
				WHERE $cond $condic and (status_id = $status1 or status_id = $status2)";
			$data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}

		public function detallesremi($idr,$status,$idt){
      		$query = "SELECT distinct remision_id as idr, num_remision, notificacion_has_remision.unidad_negocio_id as idur, status_id as idstatusN, unidad_negocio.codigo as codigour, unidad_negocio.nombre as tiendar, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, fecha, hora, cantidad, remision.descripcion, mercancia_has_unidad_negocio.mercancia_id, unidad_medida_consumo_id as idumpresentacion, unidad_medida_sistema_id as idumsist, unidad_medida_compra_id as idumcompra, udn.id as idue, udn.nombre as tiendae, udn.rif as rife, udn.razon_social as razon_se, udn.correo as emailue, udn.empresa_id as idempresaue, mercancia.id as idm, mercancia.codigo as codim, mercancia.codigo_anterior as coditcr, mercancia.nombre as producto, mercancia.marca as marca, contenido_neto, familia_id, ref.referencia as familia, usuario.nombre, usuario.apellido, ref2.referencia as tipo_u, modelo.nombre as modelo, refn.referencia as statusN,umpresentacion.abreviatura as abrevpres, umsistema.abreviatura as abrevsist, umcompra.abreviatura as abrevcompr, stock_max, stock_min, umsolicitud.id as idumsol, umsolicitud.abreviatura as abrevsol, existencia, cantidad_recibida
			FROM notificacion_has_remision
      		inner join referencia as refn on refn.id = notificacion_has_remision.status_id
      		inner join unidad_negocio on notificacion_has_remision.unidad_negocio_id = unidad_negocio.id
      		inner join remision on remision_id = remision.id
      		inner join unidad_negocio as udn on remision.unidad_negocio_id = udn.id
      		inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
      		inner join mercancia on mercancia.id = remision.mercancia_id
      		inner join mercancia_has_unidad_negocio on mercancia.id = mercancia_has_unidad_negocio.mercancia_id
      		inner join referencia as ref on mercancia.familia_id = ref.id
      		inner join usuario on remision.usuario_id = usuario.id
      		inner join referencia as ref2 on ref2.id = usuario.tipo_usuario_id
      		inner join unidad_medida as umpresentacion on unidad_medida_consumo_id = umpresentacion.id
      		inner join unidad_medida as umsistema on unidad_medida_sistema_id = umsistema.id
            left join unidad_medida as umcompra on unidad_medida_compra_id = umcompra.id
            inner join unidad_medida as umsolicitud on remision.unidad_medida_id = umsolicitud.id
      		where notificacion_has_remision.remision_id = $idr and notificacion_has_remision.unidad_negocio_id = $idt
      		and notificacion_has_remision.status_id=$status group by unidad_negocio.id";
      		$data = $this->_main->select($query);
      		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);


    	}

    	public function detallesrepo($idr,$status,$idt){
    		$query = "SELECT distinct reposicion_mercancia.id as idr, num_reposicion, notificacion_has_remision.unidad_negocio_id as idur, status_id as idstatusN, unidad_negocio.codigo as codigour, unidad_negocio.nombre as tiendar, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, fecha, hora, cantidad, reposicion_mercancia.tipo_reposicion, mercancia_has_unidad_negocio.mercancia_id, unidad_medida_consumo_id as idumpresentacion, unidad_medida_sistema_id as idumsist, unidad_medida_compra_id as idumcompra, udn.id as idue, udn.nombre as tiendae, udn.rif as rife, udn.razon_social as razon_se, udn.correo as emailue, udn.empresa_id as idempresaue, mercancia.id as idm, mercancia.codigo as codim, mercancia.codigo_anterior as coditcr, mercancia.nombre as producto, mercancia.marca as marca, contenido_neto, familia_id, ref.referencia as familia, usuario.nombre, usuario.apellido, ref2.referencia as tipo_u, modelo.nombre as modelo, refn.referencia as statusN,umpresentacion.abreviatura as abrevpres, umsistema.abreviatura as abrevsist, umcompra.abreviatura as abrevcompr, stock_max, stock_min, umsolicitud.id as idumsol, umsolicitud.abreviatura as abrevsol, existencia, cantidad_recibida
			FROM reposicion_mercancia
            left join notificacion_has_remision on notificacion_has_remision.reposicion_id = reposicion_mercancia.id
      		left join referencia as refn on refn.id = notificacion_has_remision.status_id
      		left join unidad_negocio on notificacion_has_remision.unidad_negocio_id = unidad_negocio.id
            left join mercancia_has_reposicion on mercancia_has_reposicion.reposicion_id = reposicion_mercancia.id
      		left join unidad_negocio as udn on reposicion_mercancia.unidad_negocio_id = udn.id
      		left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
      		left join modelo on modelo.id = modelo_has_submodelo.modelo_id
      		left join mercancia on mercancia.id = mercancia_has_reposicion.ingrediente_id
      		left join mercancia_has_unidad_negocio on mercancia.id = mercancia_has_unidad_negocio.mercancia_id
      		left join referencia as ref on mercancia.familia_id = ref.id
      		left join usuario on reposicion_mercancia.usuario_id = usuario.id
      		left join referencia as ref2 on ref2.id = usuario.tipo_usuario_id
      		left join unidad_medida as umpresentacion on unidad_medida_consumo_id = umpresentacion.id
      		left join unidad_medida as umsistema on unidad_medida_sistema_id = umsistema.id
            left join unidad_medida as umcompra on unidad_medida_compra_id = umcompra.id
            left join unidad_medida as umsolicitud on mercancia_has_reposicion.unidad_medida_id = umsolicitud.id
      		where notificacion_has_remision.reposicion_id = $idr and notificacion_has_remision.unidad_negocio_id = $idt
      		and notificacion_has_remision.status_id=$status and mercancia_has_unidad_negocio.unidad_negocio_id = $idt";
      		$data = $this->_main->select($query);
      		$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);
    	}

    	public function procesarRemision($idr,$idt,$idm,$idum){
    		//var_dump($_POST); exit();
			$cant = $_POST['cantenv'];
    		$fechaenv = date('Y-m-d');
    		$newstatus = 127;
    		$query = "SELECT existencia, stock_min, stock_max, mercancia.id as idpro, codigo, nombre as producto, marca, CONCAT(nombre,' ',marca) as mercancia, unidad_medida_sistema_id as idums, formula_c, contenido_neto 
    		FROM `mercancia`
			inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
    		where unidad_negocio_id = $idt and mercancia_id = $idm";
    		$stock = $this->_main->select($query);
    		if ($idum != $stock[0]['idums']) {
    			$conversion = Controller::formula($idum,false,$cant,$stock[0]['contenido_neto'],$stock[0]['formula_c']);
    		}else{
    			$conversion = $cant;
    		}
    		$query = "UPDATE `remision` SET `cantidad_recibida` = '".$cant."' WHERE remision.id = $idr";
    		$remi = $this->_main->modificar($query);
    		$stockrestante = $stock[0]['existencia']-$conversion;
    		if ($stockrestante>0) {
    			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $stockrestante where unidad_negocio_id = $idt and mercancia_id = $idm";
    			$updatedstock = $this->_main->modificar($query);
    		}

    		$query = "UPDATE notificacion_has_remision set fecha_enviada = '".$fechaenv."', status_id = $newstatus where remision_id = $idr";
    		$updatenoti = $this->_main->modificar($query);
    		echo json_encode($conversion);

    	}

    	public function procesarreposicion($idr,$idt){
    		$fechaenv = date('Y-m-d');
    		$newstatus = 201;
    		$i = 0;
    		foreach($_POST['idmer'] as $selected){
	    		$cantenv = $_POST['cantenv'];
	    		$idum = $_POST['idume'];
		    	$query = "SELECT existencia, stock_min, stock_max, mercancia.id as idpro, codigo, nombre as producto, marca, CONCAT(nombre,' ',marca) as mercancia, unidad_medida_sistema_id as idums, formula_c, contenido_neto 
	    		FROM `mercancia`
				inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
	    		where unidad_negocio_id = $idt and mercancia_id = $selected";
	    		$stock[] = $this->_main->select($query);
	    		if ($idum[$i] != $stock[$i][0]['idums']) {
	    			$conversion[] = Controller::formula($idum[$i],false,$cantenv[$i],$stock[$i][0]['contenido_neto'],$stock[$i][0]['formula_c']);
	    		}else{
	    			$conversion[] = $cantenv[$i];
	    		}
	    		$query = "UPDATE `mercancia_has_reposicion` SET `cantidad_recibida` = '".$cantenv[$i]."' WHERE reposicion_id = $idr and ingrediente_id = $selected";
    			$repo = $this->_main->modificar($query);
    			$stockrestante = $stock[$i][0]['existencia']-$conversion[$i];
    			if ($stockrestante>0) {
	    			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $stockrestante where unidad_negocio_id = $idt and mercancia_id = $selected";
	    			$updatedstock = $this->_main->modificar($query);
    			}
    			$i++;
	        }
	        $query = "UPDATE notificacion_has_remision set fecha_enviada = '".$fechaenv."', status_id = $newstatus where reposicion_id = $idr";
    		$updatenoti = $this->_main->modificar($query);
    		echo json_encode($conversion);
    	}

    	public function recibirRemision($idr,$idt,$idm,$idum){
    		//var_dump($_POST); exit();
			$cant = $_POST['cantenv'];
    		$fecharecib = date('Y-m-d');
    		$newstatus = 128;
    		$query = "SELECT existencia, stock_min, stock_max, mercancia.id as idpro, codigo, nombre as producto, marca, CONCAT(nombre,' ',marca) as mercancia, unidad_medida_sistema_id as idums, formula_c, contenido_neto 
    		FROM `mercancia`
			inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
    		where unidad_negocio_id = $idt and mercancia_id = $idm";
    		$stock = $this->_main->select($query);
    		if ($idum != $stock[0]['idums']) {
    			$conversion = Controller::formula($idum,false,$cant,$stock[0]['contenido_neto'],$stock[0]['formula_c']);
    		}else{
    			$conversion = $cant;
    		}
    		$stockrestante = $stock[0]['existencia']+$conversion;
    		if ($stockrestante>0) {
    			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $stockrestante where unidad_negocio_id = $idt and mercancia_id = $idm";
    			$updatedstock = $this->_main->modificar($query);
    		}

    		$query = "UPDATE notificacion_has_remision set fecha_recibida = '".$fecharecib."', status_id = $newstatus where remision_id = $idr";
    		$updatenoti = $this->_main->modificar($query);
    		echo json_encode($conversion);

    	}

    	public function recibirReposicion($idr,$idt){
    		$i = 0;
	    	$fecharecib = date('Y-m-d');
    		$newstatus = 134;
    		foreach($_POST['idmer'] as $selected){
	    		$cantenv = $_POST['cantenv'];
	    		$idum = $_POST['idume'];
	    		$query = "SELECT existencia, stock_min, stock_max, mercancia.id as idpro, codigo, nombre as producto, marca, CONCAT(nombre,' ',marca) as mercancia, unidad_medida_sistema_id as idums, formula_c, contenido_neto 
	    		FROM `mercancia`
				inner join mercancia_has_unidad_negocio on mercancia_id = mercancia.id
	    		where unidad_negocio_id = $idt and mercancia_id = $selected";
	    		$stock[] = $this->_main->select($query);
	    		if ($idum[$i] != $stock[$i][0]['idums']) {
	    			$conversion[] = Controller::formula($idum[$i],false,$cantenv[$i],$stock[$i][0]['contenido_neto'],$stock[$i][0]['formula_c']);
	    		}else{
	    			$conversion[] = $cantenv[$i];
	    		}
	    		$stockrestante = $stock[$i][0]['existencia']+$conversion[$i];
	    		if ($stockrestante>0) {
	    			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $stockrestante where unidad_negocio_id = $idt and mercancia_id = $selected";
	    			$updatedstock = $this->_main->modificar($query);
    			}
    			$i++;
	    	}
	    	$query = "UPDATE notificacion_has_remision set fecha_recibida = '".$fecharecib."', status_id = $newstatus where reposicion_id = $idr";
    		$updatenoti = $this->_main->modificar($query);
    		echo json_encode($conversion);
    	}


    	

	}
?>