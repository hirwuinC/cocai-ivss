<?php 

require('libs/fpdf.php');
class printer extends FPDF
{
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

        public function __construct(){
    
            parent::__construct();
            $this->_main = $this->loadModel('main');
            //$this->_compra = $this->loadModel('compra');
            //Session::accessRole(array('Super usuario','AdministradorB'));
        }

// Cargar los datos

        function Header()
        {
            $images = ROOT . 'public' . DS . 'img';
            $this->Ln(15);
            // Logo
            $this->Image($images.'/logo-EPOC-WEB.png',10,8,33);
            // Arial bold 15
            $this->SetFont('Arial','B',15);
            // Movernos a la derecha
            // Título
            $this->SetDrawColor(51,122,183);
            if (!isset($_GET["st1"]) and !isset($_GET["st2"]) and !isset($_GET["tipo"])){
                $this->Cell(0,10,'Orden de Compra',1,1,'C');
            }else{
                $this->Cell(0,10,'Solicitud de '.utf8_decode("requisición"),1,1,'C');
            }
            
            // Salto de línea
            $this->Ln(10);
        }
        
        // Pie de página
        function Footer()
        {
            // Posición: a 1,5 cm del final
            $this->SetY(-15);
            // Arial italic 8
            $this->SetFont('Arial','I',8);
            // Número de página
            $this->SetTextColor(51,122,183);
            $this->Cell(0,10,'Pagina '.$this->PageNo(),0,0,'C');
        }


    public function datosrepo($idr,$status1,$status2,$tipo,$f1=false,$f2=false){
            
            
            $query = "SELECT remision_id, reposicion_id, nt.unidad_negocio_id as idunt, status_id, unidad_negocio.codigo as codiudR, unidad_negocio.nombre as tiendaR, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, referencia.referencia as status, reposicion_mercancia.unidad_negocio_id as idurepo, remision.unidad_negocio_id as iduremi, udnrepo.nombre as tiendarepo, udnrepo.rif as rifrepo, udnrepo.razon_social as razon_srepo, udnrepo.correo as emailurepo, udnrepo.empresa_id as idempresaurepo, udnremi.nombre as tiendaremi, udnremi.rif as rifremi, udnremi.razon_social as razon_sremi, udnremi.correo as emailuremi, udnremi.empresa_id as idempresauremi, usuario.nombre as nombreremi, usuario.apellido as apellidoremi, user.nombre as nombrerepo, user.apellido as apellidorepo, remision.usuario_id as idusremi, reposicion_mercancia.usuario_id as idusrepo,  modelo.nombre as modelo, modelrepo.nombre as modelorepo, modelremi.nombre as modeloremi, num_remision, num_reposicion, remision.fecha as fecharemi, remision.hora as horaremi, reposicion_mercancia.fecha as fecharepo1, DATE_FORMAT(reposicion_mercancia.fecha, '%d-%m-%Y') as fecharepo, reposicion_mercancia.hora as horarepo, reposicion_mercancia.total
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
                WHERE reposicion_id = $idr order by reposicion_id";
            $data = $this->_main->select($query);
            return $data;

    }

    public function detallesrepo($idr,$status,$idt){
            $query = "SELECT distinct reposicion_mercancia.id as idr, num_reposicion, notificacion_has_remision.unidad_negocio_id as idur, status_id as idstatusN, unidad_negocio.codigo as codigour, unidad_negocio.nombre as tiendar, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, fecha, hora, cantidad, format(cantidad,4,'de_DE') as cant, reposicion_mercancia.tipo_reposicion,  unidad_medida_consumo_id as idumpresentacion, unidad_medida_sistema_id as idumsist, unidad_medida_compra_id as idumcompra, udn.id as idue, udn.nombre as tiendae, udn.rif as rife, udn.razon_social as razon_se, udn.correo as emailue, udn.empresa_id as idempresaue, mercancia.id as idm, mercancia.codigo as codim, mercancia.codigo_anterior as coditcr, mercancia.nombre as producto, mercancia.marca as marca, contenido_neto, familia_id, ref.referencia as familia, usuario.nombre, usuario.apellido, ref2.referencia as tipo_u, modelo.nombre as modelo, refn.referencia as statusN,umpresentacion.abreviatura as abrevpres, umsistema.abreviatura as abrevsist, umcompra.abreviatura as abrevcompr, umsolicitud.id as idumsol, umsolicitud.abreviatura as abrevsol,  cantidad_recibida, format(cantidad_recibida,4,'de_DE') as cantr
            FROM reposicion_mercancia
            left join notificacion_has_remision on notificacion_has_remision.reposicion_id = reposicion_mercancia.id
            left join referencia as refn on refn.id = notificacion_has_remision.status_id
            left join unidad_negocio on notificacion_has_remision.unidad_negocio_id = unidad_negocio.id
            left join mercancia_has_reposicion on mercancia_has_reposicion.reposicion_id = reposicion_mercancia.id
            left join unidad_negocio as udn on reposicion_mercancia.unidad_negocio_id = udn.id
            left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id
            left join modelo on modelo.id = modelo_has_submodelo.modelo_id
            left join mercancia on mercancia.id = mercancia_has_reposicion.ingrediente_id
            left join referencia as ref on mercancia.familia_id = ref.id
            left join usuario on reposicion_mercancia.usuario_id = usuario.id
            left join referencia as ref2 on ref2.id = usuario.tipo_usuario_id
            left join unidad_medida as umpresentacion on unidad_medida_consumo_id = umpresentacion.id
            left join unidad_medida as umsistema on unidad_medida_sistema_id = umsistema.id
            left join unidad_medida as umcompra on unidad_medida_compra_id = umcompra.id
            left join unidad_medida as umsolicitud on mercancia_has_reposicion.unidad_medida_id = umsolicitud.id
            where notificacion_has_remision.reposicion_id = $idr and notificacion_has_remision.unidad_negocio_id = $idt
            and notificacion_has_remision.status_id=$status";
            $data = $this->_main->select($query);
            return $data;
        }

        public function consultasOC($idt){
            $query = "SELECT reposicion_mercancia.id as idrepo, num_reposicion, fecha as fecharepo1, DATE_FORMAT(fecha, '%d-%m-%Y') as fecharepo, hora as horarepo, total, format(total,4,'de_DE') as ttl, tipo_reposicion, unidad_negocio_id, usuario_id, usuario, usuario.nombre, apellido, codigo, unidad_negocio.nombre as tienda, rif as rifrepo, razon_social as razon_srepo, empresa_id, correo, pais_id From reposicion_mercancia 
            inner join usuario on usuario.id = usuario_id
            inner join unidad_negocio on unidad_negocio_id = unidad_negocio.id
            where unidad_negocio_id = $idt and tipo_reposicion = 'Orden de compra enviada' order by reposicion_mercancia.id desc";
            $data = $this->_main->select($query);
            for ($i=0; $i <count($data) ; $i++) {
                $query = "SELECT proveedor.nombre as prove, correo From proveedor 
            inner join mercancia_has_reposicion on mercancia_has_reposicion.proveedor_id = proveedor.id
            where reposicion_id = '".$data[$i]['idrepo']."'";
            $proveedor[] = $this->_main->select($query);
            
            $data[$i]['nombreproveedor'] = $proveedor[$i][0]['prove'];
            $data[$i]['email'] = $proveedor[$i][0]['correo'];
            }
            
            return $data;
        }

        public function detallesOC($idr){
            $query = "SELECT distinct reposicion_mercancia.id as idr, num_reposicion, fecha, hora, cantidad, format(cantidad,4,'de_DE') as cant, reposicion_mercancia.tipo_reposicion, unidad_medida_consumo_id as idumpresentacion, unidad_medida_sistema_id as idumsist, unidad_medida_compra_id as idumcompra, udn.id as idue, udn.nombre as tiendae, udn.rif as rife, udn.razon_social as razon_se, udn.correo as emailue, udn.empresa_id as idempresaue, mercancia.id as idm, mercancia.codigo as codim, mercancia.codigo_anterior as coditcr, mercancia.nombre as producto, mercancia.marca as marca, contenido_neto, familia_id, ref.referencia as familia, modelo.nombre as modelo, umpresentacion.abreviatura as abrevpres, umsistema.abreviatura as abrevsist, umcompra.abreviatura as abrevcompr, umsolicitud.id as idumsol, umsolicitud.abreviatura as abrevsol,  cantidad_recibida, format(cantidad_recibida,4,'de_DE') as cantr, mercancia_has_unidad_negocio.existencia, mercancia_has_unidad_negocio.stock_max, mercancia_has_unidad_negocio.stock_min, format(mercancia_has_unidad_negocio.existencia,4,'de_DE') as stock, format(mercancia_has_unidad_negocio.stock_min,4,'de_DE') as stmin, format(mercancia_has_unidad_negocio.stock_max,4,'de_DE') as stmax, precio, format(precio,4,'de_DE') as precioUnit
            FROM reposicion_mercancia
            left join mercancia_has_reposicion on mercancia_has_reposicion.reposicion_id = reposicion_mercancia.id
            left join unidad_negocio as udn on reposicion_mercancia.unidad_negocio_id = udn.id
            left join modelo_has_submodelo on modelo_has_submodelo.id = udn.modelo_has_submodelo_id
            left join modelo on modelo.id = modelo_has_submodelo.modelo_id
            left join mercancia on mercancia.id = mercancia_has_reposicion.ingrediente_id
            left join mercancia_has_unidad_negocio on mercancia.id = mercancia_has_unidad_negocio.mercancia_id and udn.id = mercancia_has_unidad_negocio.unidad_negocio_id
            left join referencia as ref on mercancia.familia_id = ref.id
            left join unidad_medida as umpresentacion on unidad_medida_consumo_id = umpresentacion.id
            left join unidad_medida as umsistema on unidad_medida_sistema_id = umsistema.id
            left join unidad_medida as umcompra on unidad_medida_compra_id = umcompra.id
            left join unidad_medida as umsolicitud on mercancia_has_reposicion.unidad_medida_id = umsolicitud.id
            where reposicion_mercancia.id = $idr";
            $data = $this->_main->select($query);
            return $data;
        }


// Tabla coloreada
function FancyTable($header, $data)
{
    $moneda = $_SESSION['monedatienda'];
    // Colores, ancho de línea y fuente en negrita
    $this->SetFillColor(51,122,182);
    $this->SetTextColor(255,255,255);
    $this->SetDrawColor(0,0,0);
    $this->SetLineWidth(.3);
    $this->SetFont('','B');
    // Cabecera
    $w = array(38, 38, 38, 38, 38);
    for($i=0;$i<count($header);$i++)
    $this->Cell($w[$i],7,$header[$i],1,0,'C',true);
    $this->Ln();
    // Restauración de colores y fuentes
    $this->SetFillColor(224,235,255);
    $this->SetTextColor(0);
    $this->SetFont('Arial','',8);
    // Datos
    $fill = false;
    foreach($data as $row)
    {
        $this->Cell($w[0],6,$row['codim'],'LR',0,'L',$fill);
        $this->Cell($w[1],6,$row['producto'],'LR',0,'L',$fill);
        $this->Cell($w[2],6,$row['marca'],'LR',0,'R',$fill);
        $this->Cell($w[3],6,$row['cantidad'].' '.$row['abrevsol'],'LR',0,'R',$fill);
        if (!isset($row['statusN'])) {
            $this->Cell($w[3],6,$row['precioUnit'].' '. $moneda,'LR',0,'R',$fill);
        }else{
            $this->Cell($w[3],6,$row['cantidad_recibida'].' '. $row['abrevsol'],'LR',0,'R',$fill);
        }
        
        $this->Ln();
        $fill = !$fill;
    }
    // Línea de cierre
    $this->Cell(array_sum($w),2,'','T',1);
}
}
$idr = $_GET["r"];
if (isset($_GET["st1"]) and isset($_GET["st2"]) and isset($_GET["tipo"])){
    $st1 = $_GET["st1"];
    $st2 = $_GET["st2"];
    $tipo = $_GET["tipo"];
}

if (isset($_GET["idti"])) {
    $ti = $_GET["idti"];
}


if (isset($_GET["f1"]) and isset($_GET["f1"])) {
    $f1 = $_GET["f1"];
    $f2 = $_GET["f2"];
}else{
    $f1 = false;
    $f2 = false;
}


$moneda = $_SESSION['monedatienda'];
$pdf = new printer();
// Títulos de las columnas
if (!isset($_GET["st1"]) and !isset($_GET["st2"]) and !isset($_GET["tipo"])){
    $header = array('Codigo', 'Producto', 'Marca', 'Cant.', 'Precio Uni.');
}else{
    $header = array('Codigo', 'Producto', 'Marca', 'Cant.', 'Cant. Env.');
}

// Carga de datos
if (isset($st1) and isset($st2)) {
    $data = $pdf->datosrepo($idr,$st1,$st2,$tipo,$f1,$f2);
    $detalles = $pdf->detallesrepo($idr,$st2,$data[0]['idunt']);
}else{
    $data = $pdf->consultasOC($ti);
    $detalles = $pdf->detallesOC($idr);
}


if (isset($data[0]['status_id']) and $data[0]['status_id'] == 201) {
    $st = utf8_decode("Requisición").' enviada al solicitante';
}
if (isset($data[0]['status_id']) and $data[0]['status_id'] == 129) {
    $st = utf8_decode("Requisición").' pendiente';
}
if (isset($data[0]['status_id']) and $data[0]['status_id'] == 202) {
    $st = utf8_decode("Requisición").' cancelada';
}
if (isset($data[0]['status_id']) and $data[0]['status_id'] == 134) {
    $st = utf8_decode("Requisición").' completada';
}
if (!isset($data[0]['status_id'])) {
    $st = 'Orden de compra enviada';
}
$pdf->SetFont('Arial','',14);
$pdf->AddPage();
$pdf->Cell(0,3,'Datos de la unidad solicitante',0,0,'L');
if (!isset($data[0]['status_id'])) {
    $pdf->Cell(0,3,utf8_decode("Orden de compra").' #: '.$data[0]['num_reposicion'],0,1,'R');
}else{
    $pdf->Cell(0,3,utf8_decode("Requisición").' #: '.$data[0]['num_reposicion'],0,1,'R');
}

$pdf->SetFont('Arial','',12);
$pdf->Cell(0,10,$detalles[0]['tiendae'],0,0,'L');


$pdf->SetFont('Arial','',11);
$pdf->Cell(0,8,'Fecha de la solicitud: '.$data[0]['fecharepo'],0,1,'R');
$pdf->Cell(0,5,'Rif / Ruc: '.$data[0]['rifrepo'],0,1,'L');
$pdf->Cell(0,5,'Razon social: '.$data[0]['razon_srepo'],0,1,'L');
$pdf->SetFont('Arial','',12);
$pdf->Ln();
$pdf->Ln();
$pdf->Cell(0,5,'Detalles de la solicitud',0,1,'C');
/*$pdf->BasicTable($header,$data);
$pdf->AddPage();
$pdf->ImprovedTable($header,$data);
$pdf->AddPage();*/
$pdf->FancyTable($header,$detalles);
$pdf->SetFont('Arial','',11);
if (!isset($data[0]['status_id'])) {
    $pdf->Cell(0,5,'Precio Total: '.$data[0]['ttl'].' '.$moneda,0,1,'R');
    $pdf->Ln();
    $pdf->Ln();
    $pdf->Cell(0,5,'Receptor de la solicitud: '.$data[0]['nombreproveedor'],0,1,'L');
}else{
    $pdf->Ln();
    $pdf->Ln();


    $pdf->Cell(0,5,'Receptor de la solicitud: '.$detalles[0]['tiendar'],0,1,'L');
    
    $pdf->Cell(38,5,'Status de la solicitud: ',0,0,'L');
}

if (isset($data[0]['status_id']) and $data[0]['status_id'] == 201) {
    $pdf->SetTextColor(51,122,183);
}
if (isset($data[0]['status_id']) and $data[0]['status_id'] == 129) {
    $pdf->SetTextColor(255,100,100);
}
if (isset($data[0]['status_id']) and $data[0]['status_id'] == 202) {
    $pdf->SetTextColor(255,0,0);
}
if (isset($data[0]['status_id']) and $data[0]['status_id'] == 134) {
    $pdf->SetTextColor(66, 244, 185);
}
$pdf->Cell(0,5,$st,0,1,'L');
if (!isset($data[0]['status_id'])) {
    $pdf->Output('Orden_de_compra_#'.$data[0]['num_reposicion'].'.pdf','I');
}else{
    $pdf->Output('Solicitud_de_requisicion_#'.$data[0]['num_reposicion'].'.pdf','I');
}

?>