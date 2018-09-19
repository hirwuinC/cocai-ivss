<?php 

require('libs/fpdf.php');
class printer2 extends FPDF
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
            $this->Image($images.'/LOGO-COCAI.png',10,8,33);
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


        public function datosp($idU, $fci, $fcf, $tipom, $motivo, $prod){
        $query = "SELECT empresa_id From unidad_negocio where unidad_negocio.id = $idU";
            $empresa = $this->_main->select($query);
            //print_r($empresa);
            if (!is_null($empresa[0][0])) {
                 $cadena = "and kardex.unidad_negocio_id = ".$idU;
            }else{
                 $cadena = "and (unidad_negocio.empresa_id = ".$idU." or unidad_negocio.id = ".$idU.")";
            }

            if ($prod != 'false' and $tipom == 'false' and $motivo == 'false') {
                $condicion = "and kardex.mercancia_id = $prod";
            }else if ($prod != 'false' and $motivo == 'false' and $tipom != 'false') {
                $condicion = "and kardex.mercancia_id = $prod and tipo_movimiento_id = $tipom";
            }else if ($prod != 'false' and $tipom != 'false' and $motivo != 'false') {
                $condicion = "and kardex.mercancia_id = $prod and tipo_movimiento_id = $tipom and motivo_id = $motivo";
            }else if ($prod == 'false' and $motivo == 'false' and $tipom != 'false') {
                $condicion = "and tipo_movimiento_id = $tipom";
            }else if ($prod == 'false' and $tipom != 'false' and $motivo != 'false') {
                $condicion = "and tipo_movimiento_id = $tipom and motivo_id = $motivo";
            }else{
                $condicion = "";
            }
        $query="SELECT SUM(CASE tipo_movimiento_id WHEN 131 THEN kardex.cantidad END) as entradas, SUM(CASE tipo_movimiento_id WHEN 132 THEN kardex.cantidad END) as salidas 
                    FROM `kardex` 
                    inner join referencia on referencia.id = tipo_movimiento_id 
                    inner join mercancia on mercancia.id = kardex.mercancia_id 
                    inner join usuario on usuario.id = kardex.usuario_id 
                    inner join unidad_medida on unidad_medida.id = kardex.unidad_medida_id 
                    inner join referencia as ref on ref.id = kardex.motivo_id 
                    inner join referencia as ref1 on ref1.id = mercancia.familia_id 
                    inner join unidad_negocio on kardex.unidad_negocio_id = unidad_negocio.id
                WHERE fecha BETWEEN '".$fci."' and '".$fcf."' $cadena $condicion";
            $sumatorias = $this->_main->select($query);
            
            $query="SELECT DISTINCT fecha, DATE_FORMAT(hora, '%r') as hora, cantidad as cant, format(kardex.cantidad,4,'de_DE') as cantidad, kardex.descripcion, tipo_movimiento_id as idtm, ref3.referencia as tipo, kardex.mercancia_id as idmer, usuario_id as idUs, unidad_medida_id as idum, motivo_id as idmot, referencia.referencia as tipomov, mercancia.codigo, CONCAT(mercancia.nombre, ' ', mercancia.marca) As mercancia, CONCAT(usuario.nombre, ' ', usuario.apellido) As Nombre, unidad_medida.unidad, ref.referencia as motivo, ref1.referencia as familia, unidad_negocio.id as idt, lower(unidad_negocio.nombre) as tienda, kardex.existencia, format(kardex.existencia,4,'de_DE') as stock, unidad_medida.abreviatura, ref2.referencia as grupo
                    FROM `kardex` 
                    inner join referencia on referencia.id = tipo_movimiento_id 
                    inner join mercancia on mercancia.id = kardex.mercancia_id 
                    inner join usuario on usuario.id = kardex.usuario_id 
                    inner join unidad_medida on unidad_medida.id = kardex.unidad_medida_id 
                    inner join referencia as ref on ref.id = kardex.motivo_id 
                    inner join referencia as ref1 on ref1.id = mercancia.familia_id 
                    inner join referencia as ref2 on ref2.id = ref1.padre_id 
                    inner join referencia as ref3 on ref3.id = tipo_movimiento_id
                    inner join unidad_negocio on kardex.unidad_negocio_id = unidad_negocio.id
                WHERE fecha BETWEEN '".$fci."' and '".$fcf."' $cadena $condicion";
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
    $w = array(20, 50, 15, 15, 15, 30,20,25);
    for($i=0;$i<count($header);$i++)
    $this->Cell($w[$i],7,$header[$i],1,0,'C',true);
    $this->Ln();
    // Restauración de colores y fuentes
    $this->SetFillColor(224,235,255);
    $this->SetTextColor(0);
    $this->SetFont('Arial','',7);
    // Datos
    $fill = false;

    foreach($data as $row)
    {
        $this->Cell($w[0],6,$row['codigo'],'LR',0,'L',$fill);
        $this->Cell($w[1],6,strtoupper($row['mercancia']),'LR',0,'L',$fill);
        $this->Cell($w[2],6,$row['grupo'],'LR',0,'L',$fill);
        $this->Cell($w[3],6,$row['fecha'],'LR',0,'L',$fill);
        $this->Cell($w[4],6,$row['tipo'],'LR',0,'L',$fill);
        $this->Cell($w[5],6,$row['motivo'],'LR',0,'L',$fill);
        $this->Cell($w[6],6,$row['cantidad'],'LR',0,'L',$fill);
        $this->Cell($w[7],6,$row['existencia'],'LR',0,'L',$fill);
        //$this->Cell($w[2],6,$row['usuario'],'LR',0,'L',$fill);    
        $this->Ln();
        $fill = !$fill;
    }
    // Línea de cierre
    $this->Cell(array_sum($w),2,'','T',1);
}
}

if (isset($_GET["fci"])) {
    $fci = $_GET["fci"];
}else{
    $fci = 'false';
}
if (isset($_GET["fcf"])) {
    $fcf = $_GET["fcf"];
}else{
    $fcf = 'false';
}
if (isset($_GET["tip"])) {
    $tip = $_GET["tip"];
}else{
    $tip = 'false';
}
if (isset($_GET["mot"])) {
    $mot = $_GET["mot"];
}else{
    $mot = 'false';
}
if (isset($_GET["prd"])) {
    $prd = $_GET["prd"];
}else{
    $prd = 'false';
}
$idU = $_GET["t"];
$hoy = date('d/m/Y');
$fechaexport = date('ymdhi');

$moneda = $_SESSION['monedatienda'];
$pdf = new printer2();
// Títulos de las columnas
    $header = array('Codigo', 'Producto', 'Grupo','Fecha', 'Tipo', 'Motivo', 'Cantidad', 'Existencia');
// Carga de datos
    $detalles = $pdf->datosp($idU, $fci, $fcf, $tip, $mot, $prd);
    //print_r($detalles);

$pdf->AddPage();
$pdf->SetFont('Arial','B',15);
            // Movernos a la derecha
            // Título
            $pdf->SetDrawColor(51,122,183);
            $pdf->Cell(0,10,utf8_decode("Movimientos de Kardex"),1,1,'C');
$pdf->SetFont('Arial','',12);
$pdf->Cell(0,10,$detalles[0]['tienda']." - ",0,0,'L');


$pdf->SetFont('Arial','',11);
$pdf->Cell(0,8,'Exportado el: '.$hoy,0,1,'R');
$pdf->SetFont('Arial','',12);
$pdf->Ln();
$pdf->Ln();
$pdf->Cell(0,5,'Lista de productos',0,1,'C');
/*$pdf->BasicTable($header,$data);
$pdf->AddPage();
$pdf->ImprovedTable($header,$data);
$pdf->AddPage();*/
$pdf->FancyTable($header,$detalles);
$pdf->SetFont('Arial','',11);
$pdf->Output('Movimientos del kardex_'.$detalles[0]['tienda']."  ".$fechaexport.'.pdf','I');

?>