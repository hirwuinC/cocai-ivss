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
		$cabeceras .= 'FROM: '.$correot[0]['correo'].' ' . "\r\n";
		$cabeceras .= 'BCC: soporte@hdjgr.com' . "\r\n";
		$cabeceras .= 'BCC: '.$correot[0]['correo'].' ' . "\r\n";
		return $cabeceras;
    }

    public function correo($orden,$totalPagar,$datost,$email,$correot){
      $moneda = $_SESSION['monedatienda'];
      $para  = $email[0]['correo'];
      $titulo  = 'Orden de compra enviada a : '.$orden[1]['proveedor'];
          $parte1   = '<html>'.
          				'La presente tiene como finalidad confirmar la orden de compra de los siguientes productos: <br>'.
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
          	$parte2 = '<tr>'.
          		'<td style="border: solid 1px">'.$orden[$i]['nombre'].'</td>'.
          		'<td style="border: solid 1px">'.$orden[$i]['cantidad'].' '.$orden[$i]['unidadc'].'</td>'.
          		'<td style="border: solid 1px; text-align: right;">'.$orden[$i]['precio'].' '.$moneda.'</td>'.
          	'</tr>';
          }
          $parte3 = '</tbody>'.
          			'<tfooter>'.
          			'<tr>'.
          			'<th colspan="3" style="text-align: right">Total: '.$totalPagar.' '.$moneda.'</th>'.
          			'</tr>'.
          			'</tfooter>'.
          			'</table><br>'.
          			'Gracias por sus servicios.'.
                    '</html>';
          					
          				
          $mensaje = $parte1.$parte2.$parte3;
          $cabeceras = $this->cabeceras($correot);
          mail($para, $titulo, $mensaje, $cabeceras);
          return true;
    
    }

    

  }

?>
