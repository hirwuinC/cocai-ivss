<?php 

require('libs/fpdf.php');
class factura extends FPDF
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
function LoadData($idf)
{
    
    $query = "SELECT factura.id as idF, num_factura, mercancia.id as idmer, format(cantidad,4,'de_DE') as cantidad, cantidad as cant, unidad_medida_id as idum, abreviatura, precio_unitario_um as pup, format(cantidad,4,'de_DE') as precioUpro, format(precio_unitario_um*cantidad,4,'de_DE') as precioproT, devolucion, unidad_negocio_id, mercancia.codigo, mercancia.nombre, mercancia.marca, mercancia.contenido_neto, cantidadx, abreviatura 
            FROM `mercancia_has_factura` 
            inner join factura on factura.id = factura_id
            inner join mercancia on mercancia.id = mercancia_id
            inner join unidad_medida on unidad_medida.id = unidad_medida_id
            where factura.id = $idf and devolucion = 0";
    $data = $this->_main->select($query);
    return $data;
}

function datosfactura($idf){
    $query = "SELECT factura.id as idF, num_factura, DATE_FORMAT(fecha_carga, '%d/%m/%Y') as fecha_carga, DATE_FORMAT(fecha_factura, '%d/%m/%Y') as fecha_factura, porcentaje_impuesto as porcImp, format(impuesto_factura,4,'de_DE') as impuesto, impuesto_factura as impueston, format(total_factura,4,'de_DE') as total_factura, total_factura as subtotal, format(impuesto_factura + total_factura,4,'de_DE') as ttl, proveedor.id as idprov, unidad_negocio_id as idudn, unidad_negocio.nombre as tienda, proveedor.nombre as nombreprov, proveedor.rif, proveedor.razon_social, telefono.numero, referencia.referencia as cod_tlf From factura
                inner join proveedor on proveedor.id = proveedor_id 
                inner join unidad_negocio on unidad_negocio.id = unidad_negocio_id
                left join proveedor_has_telefono as pht on pht.proveedor_id = proveedor.id 
                left join telefono on pht.telefono_id = telefono.id
                left join referencia on referencia.id = telefono.codigo_id
                where factura.id = $idf";
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
    $w = array(32, 32, 32, 32, 32, 32);
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
        $this->Cell($w[1],6,$row['nombre'],'LR',0,'L',$fill);
        $this->Cell($w[2],6,$row['marca'],'LR',0,'R',$fill);
        $this->Cell($w[3],6,$row['cantidad'].' '.$row['abreviatura'],'LR',0,'R',$fill);
        $this->Cell($w[3],6,$row['precioUpro'].' '. $moneda,'LR',0,'R',$fill);
        $this->Cell($w[3],6,$row['precioproT'].' '. $moneda,'LR',0,'R',$fill);
        $this->Ln();
        $fill = !$fill;
    }
    // Línea de cierre
    $this->Cell(array_sum($w),2,'','T',1);
}
}
$idf = $_GET["f"];
$moneda = $_SESSION['monedatienda'];
$pdf = new factura();
// Títulos de las columnas
$header = array('Codigo', 'Producto', 'Marca', 'Cant.', 'P. Unitario', 'P. Total');
// Carga de datos
$data = $pdf->LoadData($idf);
$factu = $pdf->datosfactura($idf);
$pdf->SetFont('Arial','',14);
$pdf->AddPage();
$pdf->Cell(0,3,'Datos del proveedor',0,0,'L');
$pdf->Cell(0,3,'Factura #:'.$factu[0]['num_factura'],0,1,'R');
$pdf->SetFont('Arial','',12);
$pdf->Cell(0,10,$factu[0]['nombreprov'],0,0,'L');
$pdf->SetFont('Arial','',11);
$pdf->Cell(0,8,'Fecha: '.$factu[0]['fecha_factura'],0,1,'R');
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
$pdf->Cell(0,5,'Sub total: '.$factu[0]['total_factura'].' '.$moneda,0,1,'R');
$pdf->Cell(0,5,'Impuesto('.$factu[0]['porcImp'].'%): '.$factu[0]['impuesto'].' '.$moneda,0,1,'R');
$pdf->Cell(0,5,'Total: '.$factu[0]['ttl'].' '.$moneda,0,1,'R');
$pdf->Output('factura_'.$factu[0]['num_factura'].'.pdf','I');
?>