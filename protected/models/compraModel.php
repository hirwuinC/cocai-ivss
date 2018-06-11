<?php 

  class compraModel extends Model{

    protected $query;

    public function __construct(){

      parent::__construct();

    }

    public function __destruct(){

    }

    public function cabeceras($correot){
    $cabeceras = 0;
		$cabeceras = 'MIME-Version: 1.0' . "\r\n";
		$cabeceras .= 'Content-type: text/html; charset=utf-8' . "\r\n";
		$cabeceras .= "X-Priority: 3\n";
		$cabeceras .= "X-MSMail-Priority: Normal\n";
		$cabeceras .= "X-Mailer: php\n";
    if (!is_null($correot[0]['correo'])) {
      $correotienda = $correot[0]['correo'];
    }else{
      $correotienda = 'soporte@hdjgr.com';
    }
		$cabeceras .= 'FROM: '.$correotienda.' ' . "\r\n";
		$cabeceras .= 'BCC: soporte@hdjgr.com' . "\r\n";
		$cabeceras .= 'BCC: '.$correotienda.' ' . "\r\n";
		return $cabeceras;
    }

    public function correo($orden,$totalPagar,$datost,$email,$correot,$tipo){
      $moneda = $_SESSION['monedatienda'];
      $para  = $email[0]['correo'];
      if (!is_null($para)) {
      if ($tipo == 1) {
        $titulo  = 'Orden de compra enviada  por : '.$datost[0]['udn'];
        $parte1 = '<html>'.
                  'La presente tiene como finalidad confirmar la orden de compra realizada a '. $email[0]['proveedor']."<br>";
      }else{
        $titulo = 'Requisicion de mercancia enviada por : '.$datost[0]['udn'];
        $parte1 = '<html>'.
                  'La presente tiene como finalidad confirmar la solicitud de requisicion a '.$orden[1]['tiendar']."<br>";
      }
        
        $parte2 = 'La cual consta de los siguientes productos: <br>'.
                  '<table style="border: 1px solid #000;">'.
                      '<caption style="border: 1px solid #000; background: #337ab7; color: white">Pedido</caption>'.
                      '<thead>'.
                      '<tr style="background: #337ab7; color: white;">'.
                      '<th style="border: solid 1px; width:25%;">Producto</th>'.
                      '<th style="border: solid 1px; width:25%;">Cantidad</th>'.
                      '<th style="border: solid 1px; width:25%;">Precio Unitario</th>'.
                      '</tr>'.
                      '</thead>'.
                      '<tbody>';
          for ($i=0; $i <count($orden) ; $i++) {
            if ($tipo == 1) {
              $unidadc = $orden[$i]['abreviatura'];
            }else{
              $unidadc = $orden[$i]['unidadc'];
            }
            $parte3 = '<tr>'.
              '<td style="border: solid 1px">'.$orden[$i]['nombre'].'</td>'.
              '<td style="border: solid 1px">'.$orden[$i]['cantidad'].' '.$unidadc.'</td>'.
              '<td style="border: solid 1px; text-align: right;">'.$orden[$i]['precio'].' '.$moneda.'</td>'.
            '</tr>';
          }
          $parte4 = '</tbody>'.
                '<tfooter>'.
                '<tr>'.
                '<th colspan="3" style="text-align: right">Total: '.$totalPagar.' '.$moneda.'</th>'.
                '</tr>'.
                '</tfooter>'.
                '</table><br>'.
                'Gracias.'.
                    '</html>';
                    
                  
          $mensaje = $parte1.$parte2.$parte3.$parte4;
          $cabeceras = $this->cabeceras($correot);
          /*echo $titulo."<br>";
          echo $para."<br>";
          echo $mensaje."<br>";exit();*/
          mail($para, $titulo, $mensaje, $cabeceras);
      }
     
          return true;
    
    }

    

  }

?>
