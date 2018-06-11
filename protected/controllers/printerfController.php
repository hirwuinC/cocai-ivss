<?php 

require('libs/fpdf.php');
class printerf extends FPDF
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
function LoadFact($id){
    $query = "SELECT factura.id as iddoc, num_factura as documento, mercancia.id as idmer, format(cantidad,4,'de_DE') as cantidad, cantidad as cant, unidad_medida_id as idum, abreviatura, precio_unitario_um as pup, format(precio_unitario_um,4,'de_DE') as precioUpro, format(precio_unitario_um*cantidad,4,'de_DE') as precioproT, devolucion, unidad_negocio_id, mercancia.codigo, mercancia.nombre, mercancia.marca, mercancia.contenido_neto, cantidadx, abreviatura, DATE_FORMAT(fecha_devolucion, '%d-%m-%Y') as fecha_devolucion, cantidadNC, format(cantidadNC,4,'de_DE') as cantnc, precioNC, format(precioNC,4,'de_DE') as montonc
            FROM `mercancia_has_factura` 
            inner join factura on factura.id = factura_id
            inner join mercancia on mercancia.id = mercancia_id
            inner join unidad_medida on unidad_medida.id = unidad_medida_id
            where factura.id = $id";
    $data = $this->_main->select($query);
    return $data;
}

function datosfactura($id){
    $query = "SELECT factura.id as iddoc, num_factura as documento, DATE_FORMAT(fecha_carga, '%d/%m/%Y') as fecha_carga, DATE_FORMAT(fecha_factura, '%d/%m/%Y') as fecha, porcentaje_impuesto as porcImp, format(impuesto_factura,4,'de_DE') as impuesto, impuesto_factura as impueston, porcentaje_descuento as porcdcto, 
format(factura.descuento,4,'de_DE') as descuento, factura.descuento as descuenton, format(total_factura-impuesto_factura+descuento,4,'de_DE') as total_documento, total_factura as subtotal, format(total_factura,4,'de_DE') as ttl, proveedor.id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.rif, proveedor.razon_social, telefono.numero, referencia.referencia as cod_tlf From factura
                inner join proveedor on proveedor.id = proveedor_id 
                inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
                left join proveedor_has_telefono as pht on pht.proveedor_id = proveedor.id 
                left join telefono on pht.telefono_id = telefono.id
                left join referencia on referencia.id = telefono.codigo_id
                where factura.id = $id";
    $fact = $this->_main->select($query);
    return $fact;
}

// Cargar los datos
function LoadOC($id){
    $query = "SELECT orden_compra.id as iddoc, num_orden as documento, mercancia.id as idmer, format(cantidad,4,'de_DE') as cantidad, cantidad as cant, unidad_medida_id as idum, abreviatura, precio_unitario_um as pup, format(precio_unitario_um,4,'de_DE') as precioUpro, format(precio_unitario_um*cantidad,4,'de_DE') as precioproT, unidad_negocio_id, mercancia.codigo, mercancia.nombre, mercancia.marca, mercancia.contenido_neto, cantidadx, abreviatura, status_id, referencia as status
            FROM `mercancia_has_oc` 
            inner join orden_compra on orden_compra.id = orden_compra_id
            inner join mercancia on mercancia.id = mercancia_id
            inner join unidad_medida on unidad_medida.id = unidad_medida_id
            inner join referencia on referencia.id = status_id
            where orden_compra.id = $id";
    $data = $this->_main->select($query);
    return $data;
}

function datosOC($id){
    $query = "SELECT orden_compra.id as iddoc, num_orden as documento, DATE_FORMAT(fecha, '%d/%m/%Y') as fecha, porcentaje_impuesto as porcImp, format(orden_compra.impuesto,4,'de_DE') as impuesto, orden_compra.impuesto as impueston, porcentaje_descuento as porcdcto, 
format(orden_compra.descuento,4,'de_DE') as descuento, orden_compra.descuento as descuenton, format(total_orden-orden_compra.impuesto+descuento,4,'de_DE') as total_documento, total_orden as subtotal, format(total_orden,4,'de_DE') as ttl, proveedor.id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.rif, proveedor.razon_social, telefono.numero, referencia.referencia as cod_tlf From orden_compra
                inner join proveedor on proveedor.id = proveedor_id 
                inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
                left join proveedor_has_telefono as pht on pht.proveedor_id = proveedor.id 
                left join telefono on pht.telefono_id = telefono.id
                left join referencia on referencia.id = telefono.codigo_id
                where orden_compra.id = $id";
    $fact = $this->_main->select($query);
    return $fact;
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
    if (isset($_GET["f"])) {
        $w = array(32, 32, 32, 32, 32, 32);
    }else{
        $w = array(38, 38, 38, 38, 38);
    }
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
        $this->Cell($w[0],6,$row['codigo'],'LR',0,'L',$fill);
        $this->Cell($w[1],6,$row['nombre'].' '.$row['marca'],'LR',0,'L',$fill);
        $this->Cell($w[3],6,$row['cantidad'].' '.$row['abreviatura'],'LR',0,'R',$fill);
        $this->Cell($w[3],6,$row['precioUpro'].' '. $moneda,'LR',0,'R',$fill);
        $this->Cell($w[3],6,$row['precioproT'].' '. $moneda,'LR',0,'R',$fill);
        if (isset($_GET["f"])) {
            if ($row['devolucion'] == 1) {
                $this->Cell($w[3],6,$row['cantnc'].' '. $moneda,'LR',0,'R',$fill);
            }else{
                $this->Cell($w[3],6,'N/A','LR',0,'R',$fill);
            }
        }
        
        $this->Ln();
        $fill = !$fill;
    }
    // Línea de cierre
    $this->Cell(array_sum($w),2,'','T',1);
}
}
if (isset($_GET["f"])) {
    $id = $_GET["f"];
}else if (isset($_GET["o"])) {
   $id = $_GET["o"];
}

$moneda = $_SESSION['monedatienda'];
$pdf = new printerf();
// Títulos de las columnas

// Carga de datos
if (isset($_GET["f"])) {
    $header = array('Codigo', 'Producto', 'Cant.', 'P. Unitario', 'P. Total', 'Dev.');
    $data = $pdf->LoadFact($id);
    $factu = $pdf->datosfactura($id);
}else{
    $header = array('Codigo', 'Producto', 'Cant.', 'P. Unitario', 'P. Total');
    $data = $pdf->LoadOC($id);
    $factu = $pdf->datosOC($id);
}

$pdf->SetFont('Arial','',14);
$pdf->AddPage();
$pdf->Cell(0,3,'Datos del proveedor',0,0,'L');
if (isset($_GET["f"])) {
    $pdf->Cell(0,3,'Factura #:'.$factu[0]['documento'],0,1,'R');
}else{
    $pdf->Cell(0,3,'Orden de compra #:'.$factu[0]['documento'],0,1,'R');
}
$pdf->SetFont('Arial','',12);
$pdf->Cell(0,10,$factu[0]['nombreprov'],0,0,'L');
$pdf->SetFont('Arial','',11);
$pdf->Cell(0,8,'Fecha: '.$factu[0]['fecha'],0,1,'R');
$pdf->Cell(0,5,'Rif / Ruc :'.$factu[0]['rif'],0,1,'L');
$pdf->Cell(0,5,'Razon social :'.$factu[0]['razon_social'],0,1,'L');
$pdf->Cell(0,10,'Telefono :'.$factu[0]['cod_tlf'].' '.$factu[0]['numero'],0,1,'L');
$pdf->SetFont('Arial','',12);
$pdf->Ln();
$pdf->Ln();
$pdf->Cell(0,5,'Detalles de la compra'.$factu[0]['razon_social'],0,1,'C');
/*$pdf->BasicTable($header,$data);
$pdf->AddPage();
$pdf->ImprovedTable($header,$data);
$pdf->AddPage();*/
$pdf->FancyTable($header,$data);
$pdf->SetFont('Arial','',10);
$pdf->Cell(0,5,'Sub total: '.$factu[0]['total_documento'].' '.$moneda,0,1,'R');
$pdf->Cell(0,5,'Impuesto('.$factu[0]['porcImp'].'%): '.$factu[0]['impuesto'].' '.$moneda,0,1,'R');
$pdf->Cell(0,5,'Descuento('.$factu[0]['porcdcto'].'%): '.$factu[0]['descuento'].' '.$moneda,0,1,'R');
$pdf->Cell(0,5,'Total: '.$factu[0]['ttl'].' '.$moneda,0,1,'R');
if (isset($_GET["f"])) {
    $pdf->Output('factura_'.$factu[0]['documento'].'.pdf','I');
}else{
    $pdf->Output('Orden_Compra'.$factu[0]['documento'].'.pdf','I');
}
?>