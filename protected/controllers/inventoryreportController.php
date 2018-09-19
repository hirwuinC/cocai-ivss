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


        public function datosp($id,$gr=false, $cla=false, $subf=false){
            if ($gr!='false') {
                $cgr = "and ref.padre_id = '".$gr."'";
                $_SESSION['grup'] = $gr;
            }else{
                $cgr = ' ';
                $_SESSION['grup'] = 0;
            }
            if ($cla!='false' and $cla != false) {
                $cfa = "and familia_id = '".$cla."'";
                $_SESSION['fam'] = $cla;
            }else{
                $cfa = ' ';
                $_SESSION['fam'] = 0;
            }
            if ($subf!='false' and $subf != false) {
                $csf = "and sub_familia_id = '".$subf."'";
                $_SESSION['subfam'] = $subf;
            }else{
                $csf = ' ';
                $_SESSION['subfam'] = 0;
            }
            $query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, mc.descripcion, format(mc.existencia,2,'de_DE') as stock, mc.existencia, mercancia.contenido_neto, format(mc.stock_min,2,'de_DE') as stockm, mc.stock_min, format(mc.stock_max,2,'de_DE') as stockm2, mc.stock_max, mc.status, unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia', submodelo.nombre as 'subM', model.nombre as modelo, model.id as idm, tipo_inventario_id, empresa_id, ref1.referencia as subfamilia, tipo_mercancia_id as tipo_ingrediente, cantidad_presentacion ,ref4.referencia as grupo
        FROM `unidad_negocio` 
        LEFT join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id 
        LEFT join mercancia on mercancia.id = mc.mercancia_id 
        LEFT join unidad_medida on unidad_medida.id = um_sistema_id
        LEFT join unidad_medida as unidad_presentacion on unidad_presentacion.id = um_despacho_id 
        left join unidad_medida as unidad_compra on unidad_compra.id = um_recepcion_id 
        LEFT join referencia as ref on ref.id = mercancia.familia_id 
        left join referencia as ref1 on ref1.id = mercancia.sub_familia_id
        left join referencia as ref4 on ref4.id = ref.padre_id
        left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id 
        left join modelo as model on model.id = modelo_has_submodelo.modelo_id
        left join modelo as submodelo on submodelo.id = modelo_has_submodelo.sub_modelo_id
        WHERE unidad_negocio.id = $id $cgr $cfa $csf order by ref4.referencia, ref.referencia, ref1.referencia "; 
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
    $w = array(20, 85, 15, 25, 25, 25);
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
        $this->Cell($w[0],6,$row['codigo'],'1',0,'L',$fill);
        $this->Cell($w[1],6,$row['producto'].' '.$row['marca'],'1',0,'L',$fill);
        $this->Cell($w[2],6,$row['grupo'],'1',0,'L',$fill);
        $this->Cell($w[3],6,$row['stockm'].' '.$row['abreviaturaS'],'1',0,'R',$fill);
        $this->Cell($w[4],6,$row['stockm2'].' '.$row['abreviaturaS'],'1',0,'R',$fill);
        $this->Cell($w[5],6,$row['stock'].' '.$row['abreviaturaS'],'1',0,'R',$fill);

        
        $this->Ln();
        $fill = !$fill;
    }
    // Línea de cierre
    $this->Cell(array_sum($w),2,'','T',1);
}
}
$idt = $_GET["t"];
if (isset($_GET["g"])) {
    $gr = $_GET["g"];
}else{
    $gr = 'false';
}
if (isset($_GET["f"])) {
    $fam = $_GET["f"];
}else{
    $fam = 'false';
}
if (isset($_GET["sf"])) {
    $subf = $_GET["sf"];
}else{
    $subf = 'false';
}
$hoy = date('d/m/Y');
$fechaexport = date('ymdhi');

$moneda = $_SESSION['monedatienda'];
$pdf = new printer();
// Títulos de las columnas
    $header = array('Codigo', 'Producto', 'Grupo','Stock min', 'Stock max', 'Existencia');
// Carga de datos
    $detalles = $pdf->datosp($idt,$gr,$fam,$subf);

$pdf->AddPage();
$pdf->SetFont('Arial','B',15);
            // Movernos a la derecha
            // Título
            $pdf->SetDrawColor(51,122,183);
            $pdf->Cell(0,10,utf8_decode("Productos de inventario"),1,1,'C');
$pdf->SetFont('Arial','',12);
$pdf->Cell(0,10,$detalles[0]['tienda']." - Domingo Luciani",0,0,'L');


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
$pdf->Output('Productos de inventario_'.$detalles[0]['tienda']." Domingo luciani ".$fechaexport.'.pdf','I');

?>