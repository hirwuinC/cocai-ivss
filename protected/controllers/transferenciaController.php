<?php 
	class transferenciaController extends Controller{
		
		
		protected $_sidebar_menu;
		private $_transferencia;
		
		public function __construct(){
	
			parent::__construct();
			$this->_main = $this->loadModel('main');
			$this->_compra = $this->loadModel('compra');
			//Session::accessRole(array('Super usuario','AdministradorB'));
		}

		function index($id=false,$tipo=false){
			$this->_view->setJs(array('js/jquery-1.12.4.min'));
    		$this->_view->setCss(array('datatable/css/bootstrap4.min'));
		    $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
		    $this->_view->setJs(array('datatable/js/datatable.b4.min'));
		    $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
		    $this->_view->setJs(array('datatable/js/tabla'));
		    $this->_view->setJs(array('js/transferencia'));
			$valores = $this->_main->datostienda($id);
			$this->_view->g = $valores;
      $this->_view->n = $tipo;
			$this->_view->render('indexT', 'transferencia', '','');
			// clase  metodo 	  vista    carpeta dentro de views 
		}

    function requisicion($id=false,$success = false){
        $this->_view->setJs(array('js/jquery-1.12.4'));
        $this->_view->setJs(array('js/remision'));
        $this->_view->setJs(array('js/carrito'));
        $this->_view->setCss(array('datatable/css/bootstrap4.min'));
        $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
        $this->_view->setJs(array('datatable/js/datatable.b4.min'));
        $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
        $this->_view->setJs(array('datatable/js/tabla'));
        Session::destroy('idtienda');
        Session::destroy('totalPagar');
          Session::destroy('carrito1');
        $_SESSION['idtienda'] = $id;
        $modelos = Session::modelo('idUsuario');
          $query = "SELECT unidad_negocio.id, unidad_negocio.nombre, empresa_id, modelo.nombre as modelo
          From unidad_negocio 
          left join modelo_has_submodelo on unidad_negocio.modelo_has_submodelo_id = modelo_has_submodelo.id
          left join modelo on modelo.id = modelo_has_submodelo.modelo_id
          where unidad_negocio.id = $id";
        $datosT = $this->_main->select($query);
        if ($datosT[0]['empresa_id'] == 0) {
          $cond = 'empresa_id = '.$id.'';
        }else{
          $cond = 'empresa_id ='.$datosT[0]['empresa_id'].'';
        }
        $query = "SELECT unidad_negocio.id, unidad_negocio.nombre, modelo.nombre as modelo from unidad_negocio 
        inner join modelo_has_submodelo  on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
        inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
        where $cond and unidad_negocio.id !=$id and desactivada = 0";
        $tiendas = $this->_main->select($query);

        
        $query = "SELECT unidad_negocio.id, unidad_negocio.nombre, modelo.id as idM, modelo.nombre as modelo, empresa_id From unidad_negocio left join modelo_has_submodelo on modelo_has_submodelo_id = modelo_has_submodelo.id left join modelo on modelo_id = modelo.id where unidad_negocio.id = '".$datosT[0]['empresa_id']."'";
        $empresa = $this->_main->select($query);
        $query = "SELECT nombre from mercancia";
        $products = $this->_main->select($query);
        $this->_view->prod = $products;
        $tiendas[0]['tiendaen'] = $datosT[0]['nombre'];
        $tiendas[0]['idempresa'] = $datosT[0]['empresa_id'];

        $this->_view->datos = $tiendas;
        $this->_view->datosT = $datosT;
        $this->_view->idu = $id;
        $this->_view->empresa = $empresa;
        if ($success == 'success') {
          $this->_view->_error = Controller::getBoxAlert(
                          'Solicitud enviada con exito', 
                          '',
                          'success');
              //$this->_view->render('remision', 'inventario', '','');

        }
          $this->_view->render('requisiciones', 'transferencia', '','');    
      }

      public function insertsolicitudr($tipo){
        $this->_view->setJs(array('js/carrito/'));    
        $this->_view->setCss(array('datatable/css/bootstrap4.min'));
        $this->_view->setjs(array('datatable/js/jquerydatatable.min'));
        $this->_view->setJs(array('datatable/js/datatable.b4.min'));
        $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
        $this->_view->setJs(array('datatable/js/tabla'));
        $iduser = Session::get('idUsuario');
        $query = "SELECT count(id) as cant from reposicion_mercancia";
        $cont = $this->_main->select($query);
        $num = date('ynj');
        $num_repo = $num.$cont[0]['cant']+1;
        $fecha = date('Y-m-d');
        $hora = date('g:i:s a');
        $idUsuario = Session::get('idUsuario');
        $idtienda = $_SESSION['idtienda'];

        if (isset($_SESSION['carrito1'])) {
          $orden=$_SESSION['carrito1'];
          $totalPagar=$_SESSION['totalPagar'];
          if ($orden[1]['tipo'] == 2) {
            $tipor = 'Solicitud de requisicion';
          }else{
            $tipor = 'Orden de compra enviada';
          }
          #echo $fecha.' '.$hora;exit(); 
          $query = "INSERT INTO reposicion_mercancia (`num_reposicion`, `fecha`, `hora`, `total`, `tipo_reposicion`, `unidad_negocio_id`, `usuario_id`) 
          VALUES ('".$num_repo."','".$fecha."','".$hora."','".$totalPagar."','".$tipor."','".$idtienda."','".$iduser."')";
            $idr = $this->_main->insertar($query);
            $query = "SELECT empresa_id, unidad_negocio.id as idU, unidad_negocio.nombre as udn, modelo.nombre as modelo From unidad_negocio
              left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
                left join modelo on modelo.id = modelo_has_submodelo.modelo_id where unidad_negocio.id = $idtienda";
            $idempresa = $this->_main->select($query);
          if ($orden[1]['tipo'] == 2) {
            //Controller::varDump($_POST);exit();
            
            $query = "SELECT * FROM notificacion_has_remision where reposicion_id = $idr and unidad_negocio_id = '".$orden[1]['idudn']."'";
            $comprobarnoti = $this->_main->select($query);
            if (empty($comprobarnoti)) {
              $query = "INSERT INTO notificacion_has_remision (`reposicion_id`, `unidad_negocio_id`, `status_id`) VALUES ($idr,'".$orden[1]['idudn']."',129)";
              $idn =$this->_main->insertar($query);
            }
            
            for ($i=1; $i < count($orden); $i++) { 
              $query = "INSERT INTO mercancia_has_reposicion(cantidad, precio, ingrediente_id, unidad_medida_id, proveedor_id, reposicion_id) 
              VALUES ('".$orden[$i]['cantidad']."','".$orden[$i]['precio']."','".$orden[$i]['id']."','".$orden[$i]['idumc']."',NULL,$idr)"; 
              $mhr = $this->_main->insertar($query);
            }
          }else{
            for ($i=1; $i < count($orden); $i++) { 
                   $query = "INSERT INTO mercancia_has_reposicion(cantidad, precio, ingrediente_id, unidad_medida_id, proveedor_id, reposicion_id) VALUES  
                  ('".$orden[$i]['cantidad']."','".$orden[$i]['precio']."','".$orden[$i]['id']."','".$orden[$i]['idumc']."','".$orden[1]['idproveedor']."',$idr)"; 
                  $mhr = $this->_main->insertar($query);
          }
          
              }
        
            if (isset($mhr)) {

              $this->_view->_totalP = $totalPagar;
              $this->_view->_pedido = $orden;
              $this->_view->_tienda = $idempresa;
              $this->_view->_idtienda = $idtienda;
              if ($tipo == 1) {
                $query = "SELECT correo FROM proveedor where id = '".$orden[1]['idproveedor']."'";
                $email = $this->_main->select($query);
                $query ="SELECT correo FROM unidad_negocio where id = '".$idtienda."'";
                $correot = $this->_main->select($query);
                if (isset($email)) {
                  $this->_compra->correo($orden,$totalPagar,$idempresa,$email,$correot,$tipo);
                }
                
                Session::destroy('carrito1');
                Session::destroy('totalPagar');
                $this->_view->render('ordencreada', 'transferencia', '');
              }else{
                $query = "SELECT correo FROM unidad_negocio where id = '".$orden[1]['idudn']."'";
                $email = $this->_main->select($query);
                $query ="SELECT correo FROM unidad_negocio where id = '".$idtienda."'";
                $correot = $this->_main->select($query);
                if (isset($email)) {
                  $this->_compra->correo($orden,$totalPagar,$idempresa,$email,$correot,$tipo);
                }
                Session::destroy('carrito1');
                Session::destroy('totalPagar');
                $this->_view->render('solicitudcreada', 'transferencia', '');
              }
              
            }else{
              if ($tipo == 1) {
                $this->_view->redirect('compra/ordenC/'.$idtienda);
              }else{
                $this->_view->render('requisicion', 'transferencia', '','');
              }
              
            }
        }else{
            if ($tipo == 1) {
                $this->_view->redirect('compra/ordenC/'.$idtienda);
              }else{
                $this->_view->redirect('transferencia/requisicion/'.$idtienda);
              }
        }
        
        
          #var_dump($orden); echo "</br><br>";
          #var_dump($totalPagar); echo "</br>";exit();    
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

      if ($status1 == 127 and $status2 == 201) {
        $condic2 = 'or status_id = 126 or status_id = 129';
      }else{
        $condic2 = '';
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
				WHERE $cond $condic and (status_id = $status1 or status_id = $status2 $condic2) order by reposicion_id";
			$data = $this->_main->select($query);
			$response = array("data"=>$data);
    		//print_r($response);
    		echo json_encode($response);

		}

		public function detallesremi($idr,$status,$idt){
      		$query = "SELECT distinct remision_id as idr, num_remision, notificacion_has_remision.unidad_negocio_id as idur, status_id as idstatusN, unidad_negocio.codigo as codigour, unidad_negocio.nombre as tiendar, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, fecha, hora, cantidad, format(cantidad,4,'de_DE') as cant, remision.descripcion, mercancia_has_unidad_negocio.mercancia_id, unidad_medida_consumo_id as idumpresentacion, unidad_medida_sistema_id as idumsist, unidad_medida_compra_id as idumcompra, udn.id as idue, udn.nombre as tiendae, udn.rif as rife, udn.razon_social as razon_se, udn.correo as emailue, udn.empresa_id as idempresaue, mercancia.id as idm, mercancia.codigo as codim, mercancia.codigo_anterior as coditcr, mercancia.nombre as producto, mercancia.marca as marca, contenido_neto, familia_id, ref.referencia as familia, usuario.nombre, usuario.apellido, ref2.referencia as tipo_u, modelo.nombre as modelo, refn.referencia as statusN,umpresentacion.abreviatura as abrevpres, umsistema.abreviatura as abrevsist, umcompra.abreviatura as abrevcompr, umsolicitud.id as idumsol, umsolicitud.abreviatura as abrevsol, mercancia_has_unidad_negocio.existencia, cantidad_recibida, format(cantidad_recibida,4,'de_DE') as cantr, mhudn2.existencia as existenciate,  mercancia_has_unidad_negocio.stock_max, mercancia_has_unidad_negocio.stock_min, format(mercancia_has_unidad_negocio.existencia,4,'de_DE') as stock, format(mercancia_has_unidad_negocio.stock_min,4,'de_DE') as stmin, format(mercancia_has_unidad_negocio.stock_max,4,'de_DE') as stmax, mhudn2.stock_max as stock_maxte, mhudn2.stock_max as stock_minte, format(mhudn2.existencia,4,'de_DE') as stockte, format(mhudn2.stock_max,4,'de_DE') as maxte, format(mhudn2.stock_min,4,'de_DE') as minte
          FROM notificacion_has_remision
          inner join referencia as refn on refn.id = notificacion_has_remision.status_id
          inner join unidad_negocio on notificacion_has_remision.unidad_negocio_id = unidad_negocio.id
          inner join remision on remision_id = remision.id
          inner join unidad_negocio as udn on remision.unidad_negocio_id = udn.id
          inner join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
          inner join modelo on modelo.id = modelo_has_submodelo.modelo_id
          inner join mercancia on mercancia.id = remision.mercancia_id
          inner join mercancia_has_unidad_negocio on remision.mercancia_id = mercancia_has_unidad_negocio.mercancia_id
          inner join mercancia_has_unidad_negocio as mhudn2 on mhudn2.unidad_negocio_id = udn.id and mercancia.id = mhudn2.mercancia_id
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
    		$query = "SELECT distinct reposicion_mercancia.id as idr, num_reposicion, notificacion_has_remision.unidad_negocio_id as idur, status_id as idstatusN, unidad_negocio.codigo as codigour, unidad_negocio.nombre as tiendar, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, fecha, hora, cantidad, format(cantidad,4,'de_DE') as cant, reposicion_mercancia.tipo_reposicion, mercancia_has_unidad_negocio.mercancia_id, unidad_medida_consumo_id as idumpresentacion, unidad_medida_sistema_id as idumsist, unidad_medida_compra_id as idumcompra, udn.id as idue, udn.nombre as tiendae, udn.rif as rife, udn.razon_social as razon_se, udn.correo as emailue, udn.empresa_id as idempresaue, mercancia.id as idm, mercancia.codigo as codim, mercancia.codigo_anterior as coditcr, mercancia.nombre as producto, mercancia.marca as marca, contenido_neto, familia_id, ref.referencia as familia, usuario.nombre, usuario.apellido, ref2.referencia as tipo_u, modelo.nombre as modelo, refn.referencia as statusN,umpresentacion.abreviatura as abrevpres, umsistema.abreviatura as abrevsist, umcompra.abreviatura as abrevcompr, umsolicitud.id as idumsol, umsolicitud.abreviatura as abrevsol, mercancia_has_unidad_negocio.existencia, cantidad_recibida, format(cantidad_recibida,4,'de_DE') as cantr, mhudn2.existencia as existenciate,  mercancia_has_unidad_negocio.stock_max, mercancia_has_unidad_negocio.stock_min, format(mercancia_has_unidad_negocio.existencia,4,'de_DE') as stock, format(mercancia_has_unidad_negocio.stock_min,4,'de_DE') as stmin, format(mercancia_has_unidad_negocio.stock_max,4,'de_DE') as stmax, mhudn2.stock_max as stock_maxte, mhudn2.stock_max as stock_minte, format(mhudn2.existencia,4,'de_DE') as stockte, format(mhudn2.stock_max,4,'de_DE') as maxte, format(mhudn2.stock_min,4,'de_DE') as minte
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
          left join mercancia_has_unidad_negocio as mhudn2 on mhudn2.unidad_negocio_id = udn.id and mercancia.id = mhudn2.mercancia_id
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

      public function validarproductosrequisicion($idr,$idt){
        $query = "SELECT mercancia.id as idm FROM mercancia_has_reposicion
        inner join mercancia on ingrediente_id = mercancia.id
        where reposicion_id = $idr";
        $datarm = $this->_main->select($query);
        for ($i=0; $i <count($datarm) ; $i++) { 
          $query = "SELECT DISTINCT mercancia.id as idm, mercancia.nombre, marca from mercancia_has_unidad_negocio 
          inner join mercancia on mercancia.id = mercancia_id
          where mercancia.id = '".$datarm[$i]['idm']."' and mercancia.id not in(SELECT mercancia_id FROM mercancia_has_unidad_negocio where unidad_negocio_id = $idt)";
          $datos = $this->_main->select($query);
        }
        $query = "SELECT unidad_negocio.id, unidad_negocio.nombre as tienda, num_reposicion FROM unidad_negocio
        inner join notificacion_has_remision as nt on nt.unidad_negocio_id = unidad_negocio.id
        inner join reposicion_mercancia as repo on repo.id = nt.reposicion_id
         where nt.reposicion_id = $idr";
         $datost = $this->_main->select($query);
        if (!isset($datos)) {
          $data = 0;
        }else{
          if (empty($datos[0])) {
            $data = 0;
          }else{
            $data = $datos;
            $data[0]['tiendant'] = $datost[0]['tienda'];
            $data[0]['num_reposicion'] = $datost[0]['num_reposicion'];
          }
          
        }
        echo json_encode($data);
      }

      public function validarcantidades($idm,$idt,$cant,$idum){
        $query = "SELECT existencia, stock_min, unidad_medida_sistema_id as idums, contenido_neto, formula_c FROM mercancia_has_unidad_negocio 
        inner join mercancia on mercancia.id = mercancia_id where unidad_negocio_id = $idt and mercancia_id = $idm";
        $stock = $this->_main->select($query);
        if ($idum != $stock[0]['idums']) {
          $conversion = Controller::formula($idum,false,$cant,$stock[0]['contenido_neto'],$stock[0]['formula_c']);
        }else{
          $conversion = $cant;
        }
        $resta = $stock[0]['existencia']-$conversion;
        if ($resta<0) {
          $data = 1;
        }else if ($resta < $stock[0]['stock_min'] and $resta > 0) {
          $data = 2;
        }else if ($resta == 0) {
          $data = 3;
        }else{
          $data = 4;
        }
        echo json_encode($data);
      }

    	public function procesarRemision($idr,$idt,$idm,$idum){
    		//var_dump($_POST); exit();
			  $cant = $_POST['cantenv'];
    		$fechaenv = date('Y-m-d');
    		$newstatus = 127;
        $accion = "Modificado";
        $motivo = 176;
        $tipoM = 132;
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
        $query = "SELECT * from remision where id = $idr";
        $datosr = $this->_main->select($query);
    		$query = "UPDATE `remision` SET `cantidad_recibida` = '".$cant."' WHERE remision.id = $idr";
    		$remi = $this->_main->modificar($query);
    		$stockrestante = $stock[0]['existencia']-$conversion;
    		if ($stockrestante>0) {
    			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $stockrestante where unidad_negocio_id = $idt and mercancia_id = $idm";
    			$updatedstock = $this->_main->modificar($query);
    		}
        //$this->_main->log($idm,$idt,$accion);
        //$this->_main->kardex($conversion,$motivo,$tipoM,$idm,$idt,$idum,$datosr[0]['descripcion']);

    		$query = "UPDATE notificacion_has_remision set fecha_enviada = '".$fechaenv."', status_id = $newstatus where remision_id = $idr";
    		$updatenoti = $this->_main->modificar($query);
    		echo json_encode($conversion);

    	}

    	public function procesarreposicion($idr,$idt){
    		$fechaenv = date('Y-m-d');
    		$newstatus = 201;
        $accion = "Modificado";
        $motivo = 175;
        $tipoM = 132;
    		$i = 0;
        $query = "SELECT * from reposicion_mercancia where id = $idr";
        $datosr = $this->_main->select($query);
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
    			if ($stockrestante>=0) {
	    			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $stockrestante where unidad_negocio_id = $idt and mercancia_id = $selected";
	    			$updatedstock = $this->_main->modificar($query);
    			}
          $this->_main->log($selected,$idt,$accion);
          $this->_main->kardex($conversion[$i],$motivo,$tipoM,$selected,$idt,$idum[$i],$datosr[0]['tipo_reposicion']);
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
        $accion = "Modificado";
        $motivo = 124;
        $tipoM = 131;
        $query = "SELECT * from remision where id = $idr";
        $datosr = $this->_main->select($query);
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
        //$this->_main->log($idm,$idt,$accion);
        //$this->_main->kardex($conversion,$motivo,$tipoM,$idm,$idt,$idum,$datosr[0]['descripcion']);

    		$query = "UPDATE notificacion_has_remision set fecha_recibida = '".$fecharecib."', status_id = $newstatus where remision_id = $idr";
    		$updatenoti = $this->_main->modificar($query);
    		echo json_encode($conversion);

    	}

    	public function recibirReposicion($idr,$idt){
    		$i = 0;
	    	$fecharecib = date('Y-m-d');
    		$newstatus = 134;
        $accion = "Modificado";
        $motivo = 123;
        $tipoM = 132;
        $query = "SELECT * from reposicion_mercancia where id = $idr";
        $datosr = $this->_main->select($query);
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
	    			$query = "UPDATE mercancia_has_unidad_negocio set existencia = $stockrestante where unidad_negocio_id = $idt and mercancia_id = $selected";
	    			$updatedstock = $this->_main->modificar($query);
          $this->_main->log($selected,$idt,$accion);
          $this->_main->kardex($conversion[$i],$motivo,$tipoM,$selected,$idt,$idum[$i],$datosr[0]['tipo_reposicion']);
    			$i++;
	    	}
	    	$query = "UPDATE notificacion_has_remision set fecha_recibida = '".$fecharecib."', status_id = $newstatus where reposicion_id = $idr";
    		$updatenoti = $this->_main->modificar($query);
    		echo json_encode($conversion);
    	}

      public function contarteansferencias($idt){
        $query = "SELECT COUNT(reposicion_id) as xenviar FROM notificacion_has_remision where status_id = 129 and unidad_negocio_id = $idt";
        $xenviar = $this->_main->select($query);
        $query = "SELECT COUNT(reposicion_id) as xrecibir FROM notificacion_has_remision
        inner join reposicion_mercancia as repo on repo.id = reposicion_id
        where status_id = 201 and repo.unidad_negocio_id = $idt";
        $xrecibir = $this->_main->select($query);
        $data[0]['xenviar'] = $xenviar[0]['xenviar'];
        $data[0]['xrecibir'] = $xrecibir[0]['xrecibir'];
        echo json_encode($data);
      }

      public function anularrequisiciones($idr){
        $query = "UPDATE `notificacion_has_remision` SET `status_id`=202 WHERE reposicion_id = $idr";
        $anulado = $this->_main->modificar($query);
        $query = "SELECT num_reposicion from reposicion_mercancia where id = $idr";
        $repoanulada = $this->_main->select($query);
        echo json_encode($repoanulada);
      }

      public function consultarcanceladas($idt,$status,$f1,$f2){
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
        WHERE reposicion_mercancia.fecha BETWEEN '".$f1."' and '".$f2."' and status_id = $status and (nt.unidad_negocio_id = $idt or reposicion_mercancia.unidad_negocio_id = $idt)";
      $data = $this->_main->select($query);
      $response = array("data"=>$data);
        //print_r($response);
        echo json_encode($response);
      }

    	

	}
?>