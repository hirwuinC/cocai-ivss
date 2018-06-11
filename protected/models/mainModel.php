<?php   class mainModel extends Model{    protected $query;    public function __construct(){      parent::__construct();    }    public function __destruct(){      ;    }   public function Gets($tabla = false, $item = false, $valor = false, $modelo = false){       $idu = Session::get('idUsuario');      switch ($tabla) {        case 'referencia':         if ($item == 'padre_id') {            $query = "SELECT DISTINCT ref.id, ref.referencia             from referencia             inner join referencia as ref on ref.padre_id = referencia.id            inner join mercancia on mercancia.familia_id = ref.id            inner join mercancia_has_unidad_negocio as mhun on mhun.mercancia_id = mercancia.id            where ref.padre_id = '".$valor."' ORDER BY ref.referencia";          }else if($item == 'sub_modelo' or $item == 'motivo'){              $query = "SELECT ref.id, ref.referencia from referencia inner join referencia as ref on ref.padre_id = referencia.id where ref.padre_id = '".$valor."' and ref.referencia not in ('TP','CK','MF','FP','RB','PL','OH','Sin asignar')";          } else{            $query = "SELECT ref.id, ref.referencia from referencia  inner join referencia ref on ref.padre_id = referencia.id where referencia.referencia = '".$item."' ";          }            /*$query = "SELECT referencia.id, ref.id, referencia.referencia, ref.referencia from referencia inner join referencia as ref on ref.padre_id = referencia.id where ref.padre_id = '".$valor."'";*/          break;        case 'unidad_negocio':           //echo $item;            if ($item == 'modelo_id') {              $query="SELECT unidad_negocio.id, unidad_negocio.nombreC, unidad_negocio.codigo, unidad_negocio.numero_autorizacion, referencia.referencia as division, ref.referencia as modelo from unidad_negocio inner join referencia on unidad_negocio.division_id = referencia.id LEFT join referencia as ref on unidad_negocio.modelo_id = ref.id where unidad_negocio.".$item." = '".$valor."'";            }else if($item == 'division_id'){             // echo "full services funciona";              $query = "SELECT unidad_negocio.id, unidad_negocio.nombreC, unidad_negocio.codigo,  unidad_negocio.numero_autorizacion, referencia.referencia as division, ref.referencia as modelo from unidad_negocio               inner join referencia on unidad_negocio.division_id = referencia.id              LEFT join referencia as ref on unidad_negocio.modelo_id = ref.id              where unidad_negocio.".$item." = '".$valor."'";               }                    break;        case 'direccion':          if ($item == 'estado') {            $query = "SELECT distinct direccion.id, direccion.nombre FROM `direccion` inner join referencia on referencia_id = referencia.id inner join direccion as dir on dir.padre_id = direccion.id inner join direccion as dir2 on dir2.padre_id = dir.id  where referencia = '".$item."' ";          }else if ($item == 'parroquia') {            $query = "SELECT direccion.id, nombre FROM `direccion` inner join referencia on referencia_id = referencia.id where referencia = '".$item."' and direccion.padre_id = ".$valor." ";          }else if ($item == 'municipio') {            $query = "SELECT distinct direccion.id, direccion.nombre FROM `direccion` inner join referencia on referencia_id = referencia.id inner join direccion as dir on dir.padre_id = direccion.id  where referencia = 'municipio' and direccion.padre_id = ".$valor."";          }else{            $query = "SELECT direccion.id, nombre FROM `direccion` inner join referencia on referencia_id = referencia.id where referencia = '".$item."'and direccion.padre_id = ".$valor." ";          }        break;        case 'grupo':          if ($item == 'grupo') {            $query = "SELECT grupo.id, grupo.nombre as grupo from grupo            LEFT join modelo_has_grupo on grupo.id = grupo_id            LEFT join modelo_has_submodelo on modelo_has_grupo.modelo_id = modelo_has_submodelo.sub_modelo_id            where modelo_has_submodelo.modelo_id = '".$valor."' and grupo.familia_id = '".$modelo."'";          }        break;        case 'producto':           $query = "SELECT id, nombre, codigo FROM `producto` WHERE grupo_id = $valor";          break;        case 'unidad_medida':          if ($modelo == '30') {            $query = "SELECT * from unidad_medida where unidad_medida.abreviatura is not null and unidad not in('Fardo(s)','Guacal(es)','Saco(s)','caja(s)','Guacal(es)','Botella(s)','Lata(s)','Resma(s)','Docena(s)','Frasco(s)','Cuenta(s)','Bandeja(s)','cuñete(s)','Barra(s)','Bulto(s)','Bovina(s)','Paquete(s)')";          }          else if ($item == 'unidad_medida_sis') {            $query = "SELECT * from unidad_medida where unidad_medida.abreviatura is not null and padre_id = $modelo  and unidad not in('Fardo','Guacal','Saco','caja','Fardo','Guacal','Botella','Lata','Resma','Docena','Frasco','Cuenta','Bandeja','cuñete','Barra','Bulto','Bovina','Paquete')";          }else if ($modelo == 99) {            $query = "SELECT * from unidad_medida where unidad_medida.abreviatura is not null and unidad not in('Fardo(s)','Guacal(es)','Saco(s)','caja(s)','Guacal(es)','Botella(s)','Lata(s)','Resma(s)','Docena(s)','Frasco(s)','Cuenta(s)','Bandeja(s)','cuñete(s)','Barra(s)','Bulto(s)','Bovina(s)','Paquete(s)')";          }else{            $query = "SELECT * from unidad_medida where unidad_medida.abreviatura is not null";          }                  break;        case 'modelo':          if ($item == 'modelo_id') {            $query = "SELECT DISTINCT(modelo.id) as id,modelo.nombre as nombre FROM `usuario`         left join usuario_has_unidad_negocio on usuario_has_unidad_negocio.usuario_id = usuario.id         left join unidad_negocio on unidad_negocio.id = usuario_has_unidad_negocio.unidad_negocio_id         left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id         left join modelo on modelo.id = modelo_has_submodelo.modelo_id        inner join referencia on usuario.tipo_usuario_id = referencia.id        WHERE usuario.id = $idu and modelo.padre_id = 4 or modelo.padre_id = 5";          }                  break;        case 'mercancia':            if ($item == 'products') {              $query = "SELECT mercancia.id, CONCAT(mercancia.nombre,' ',mercancia.marca) as mercancia                 FROM mercancia                 inner join mercancia_has_unidad_negocio as mhun on mercancia.id = mhun.mercancia_id                inner join unidad_negocio on mhun.unidad_negocio_id = unidad_negocio.id                where unidad_negocio_id = $valor";            }else if ($item == 'semiterminados') {              $query = "SELECT mercancia.id, CONCAT(mercancia.nombre,' ', mercancia.marca) as semiterminado                 FROM `mercancia`                 inner join mercancia_has_unidad_negocio as mhun on mhun.mercancia_id = mercancia.id                inner join referencia on referencia.id = familia_id                where mhun.unidad_negocio_id = '".$valor."' and referencia.referencia = 'Semi terminados' and receta_id is not null";            }else{              $query = "SELECT id, nombre from mercancia";            }        break;        case 'proveedor':            if ($valor != false and $modelo != 999999) {            $query = "SELECT proveedor.id, nombre from proveedor              inner join proveedor_has_mercancia on proveedor.id = proveedor_id              where empresa_id = '".$valor."' and mercancia_id = '".$modelo."' order by nombre";            }else if($valor != false and $modelo == 999999) {               $query = "SELECT id, nombre from proveedor where empresa_id = '".$valor."' order by nombre";            }else{              $query = "SELECT id, nombre from proveedor";            }                    break;                default:           $query = "SELECT * FROM ".$tabla." where ".$item." = '".$valor."'";          break;      }                  $auxiliar = $this->_db->query($query);        try {        $this->_db->beginTransaction();        $result= $auxiliar->fetchAll();        $this->_db->commit();        }        catch (Exception $e){                    $this->_db-rollBack();          echo "Error :: ".$e->getMessage();          exit();                  }      //  echo $result[1][1];        return $result;                }    public function select($query){            $auxiliar = $this->_db->query($query);        try {        $this->_db->beginTransaction();        $result= $auxiliar->fetchAll();        $this->_db->commit();        }        catch (Exception $e){                    $this->_db-rollBack();          echo "Error :: ".$e->getMessage();          exit();                  }                return $result;          }    public function insertar($query, $tabla=false){      //var_dump($query);      //exit();      try {        $this->_db->beginTransaction();        $this->_db->prepare($query)->execute();        $id =  $this->_db->lastinsertid($tabla);        $this->_db->commit();      }      catch (Exception $e){        $this->_db->rollBack();        echo "Error :: ".$e->getMessage();        exit();      }      return $id;    }    public function totalRegistros($query){      //echo $query;      $auxiliar = $this->_db->query($query);        try {        $this->_db->beginTransaction();        $result= $auxiliar->fetchAll();        $numFila = $auxiliar->rowCount();        $this->_db->commit();        }        catch (Exception $e){                    $this->_db-rollBack();          echo "Error :: ".$e->getMessage();          exit();                  }            $result = $numFila;        return $result;    }    public function modificar($query){      //var_dump($query);       try {        $this->_db->beginTransaction();        //$this->_db->prepare($query);        $result=$this->_db->exec($query);        $this->_db->commit();              }      catch (Exception $e){        $this->_db->rollBack();        echo "Error :: ".$e->getMessage();        exit();      }    return $result;    }    public function eliminar($query){      try {        $this->_db->beginTransaction();        $this->_db->prepare($query)->execute();        $this->_db->commit();      }      catch (Exception $e){        $this->_db->rollBack();        echo "Error :: ".$e->getMessage();        exit();      }      return true;          }    function simplificarDatos($valores,$indice=false){        $indi=0;        #print_r($valores); echo "<br><br>"; #exit();        for($i=0; $i < count($valores); $i++) {          $dato[$i] = $valores[$i][$indice];         }        #print_r($dato); exit();        $result=array_unique($dato);        if(is_array($result)) {           foreach($result as $key => $val) {             $resultado[$indi] = is_array($val) ? $val[$key] : $val;             $indi=$indi+1;           }        }        #print_r($resultado); exit();        return $resultado;    }    function conversor($c1=false,$c2=false,$c3=false,$iduc=false,$idup,$idus,$idm){      if ($c1!=false) {        $query = "SELECT cantidad_presentacion as cant_pre, contenido_neto FROM mercancia where mercancia.id = $idm";        $datosp = $this->select($query);        $cantidadcompra = $datosp[0]['cant_pre']*$c1;        $conversionC = $cantidadcompra*$datosp[0]['contenido_neto'];      }else{        $conversionC = 0;      }      if ($c2!=false and $idup!=$idus and $datosp[0]['contenido_neto']!=0.0000) {          $conversionP = $c2*$datosp[0]['contenido_neto'];      }else if ($c2!=false and $idup!=$idus and $datosp[0]['contenido_neto']==0.0000) {          if ($idup!=26) {            $conversionP = $c2*1000;          }else{            $conversionP = $c2*100;          }      }else if ($c2!=false and $idup==$idus) {          $conversionP = $c2*1;      }else{          $conversionP =0;      }      if ($c3!=false) {        $conversionS = $c3;      }else{        $conversionS = 0;      }      $totalConversion = $conversionC+$conversionP+$conversionS;      return $totalConversion;    }      function log($idP,$idT,$accion){        #echo $idP.' '.$idT.' '.$accion;          $referencia='Producto';          $fecha = date ('Y-m-d');          $hora = date ('h:i:s');          $user =Session::modelo('idUsuario'); #print_r($user); exit();          $query = "SELECT CONCAT(nombre,' ',marca) as ingrediente FROM `mercancia` WHERE id = $idP";          $producto = $this->select($query); #print_r($producto); echo "<br>"; exit();          $query = "INSERT INTO `log`(`fecha`, `hora`, `referencia`, `nombre`, `accion`, `usuario` , `unidad_negocio_id`) VALUES ('".$fecha."','".$hora."','".$referencia."','".$producto[0]['ingrediente']."','".$accion."','".$user[0]['name'].' '.$user[0]['apellido']."' , $idT)";           $this->insertar($query);      }      function kardex($cantidad,$motivo,$tipoM,$idP,$idT,$unidad,$descripcion=false,$fecha=false,$rev=false){        if ($fecha == false) {          $fecha = date ('Y-m-d');        }else{          $fecha = $fecha;        }        if ($rev == false) {          $reversado = 0;        }else{          $reversado = 1;        }        $mystring = $cantidad;        $findme   = ',';        $pos = strpos($mystring, $findme);        if ($pos != false) {          $p1 = str_replace(".","",$cantidad);                  $canti = str_replace(",",".",$p1);        }else{          $canti = $cantidad;        }          $hora = date ('h:i:s');          $user =Session::modelo('idUsuario'); #echo $idUser; exit();          $query = "SELECT nombre, existencia FROM `mercancia`           inner join mercancia_has_unidad_negocio as mhun on mhun.mercancia_id = mercancia.id  WHERE mercancia.id = $idP and mhun.unidad_negocio_id = $idT";          $producto = $this->select($query); //print_r($pro); echo "<br>";            if ($motivo == 173 or $motivo == 174) {              $cant = $canti;          }else{            if ($tipoM == 131) {              $cant = $producto[0]['existencia']+$canti;            }else{              $cant = $producto[0]['existencia']-$canti;            }          }                    $query = "INSERT INTO `kardex`(`fecha`, `hora`, `cantidad`, `existencia`, `descripcion`, `tipo_movimiento_id`, `mercancia_id`, `unidad_negocio_id`, `usuario_id`, `unidad_medida_id`, `motivo_id`, `reversado`) VALUES ('".$fecha."','".$hora."',".$canti.",".$cant.",'".$descripcion."','".$tipoM."',".$idP.",".$idT.",".$user[0]['id'].",$unidad,'".$motivo."', '".$reversado."')";        $producto = $this->insertar($query);        return true;      }      function ingredientesexplosion($info,$idt,$cantidad){      //echo($info)."<br>";      //echo($idt)."<br>";      //echo($cantidad)."<br>";        for ($i=0; $i <count($info) ; $i++) {           $query = "SELECT mercancia.id as idi, mercancia.codigo as codigi, mercancia.contenido_neto, mhudn.existencia, ixr.cantidad, ixr.unidad_medida_id, unidad_medida.abreviatura, CONCAT(mercancia.nombre, ' ', mercancia.marca) as ingrediente, producto.id as idprod, producto.nombre as producto, format(mercancia.precio_unitario,2,'de_DE') as costo, mercancia.precio_unitario as precioU, receta.id as idreceta, mercancia.receta_id as recetaing, receta.nombre as receta, unidad_sistema.id as 'idUMS',unidad_sistema.unidad as 'unidadS', unidad_sistema.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', formula_c, formula_p, formula_s, cantidad_presentacion            FROM `ingrediente_has_receta` as ixr        inner join receta on receta.id = ixr.receta_id        inner join unidad_medida on unidad_medida.id = ixr.unidad_medida_id        inner join mercancia on mercancia.id = ixr.ingrediente_id        left join receta as sub on sub.id = mercancia.receta_id         inner join mercancia_has_unidad_negocio as mhudn on mhudn.mercancia_id = mercancia.id        inner join unidad_negocio on mhudn.unidad_negocio_id = unidad_negocio.id        inner join producto on receta.id = producto.receta_id        inner join unidad_medida as unidad_sistema on unidad_sistema.id = mercancia.unidad_medida_sistema_id        inner join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id         left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id        WHERE producto.codigo = '".$info."' and unidad_negocio.id = $idt ";          $ingredientes = $this->select($query);          //echo "ingredientes:"; print_r($ingredientes); echo "<br>";            for ($j=0; $j <=count($ingredientes) ; $j++) {            if (isset($ingredientes[$j]['idi'])) {              $cant = $cantidad*$ingredientes[$j]['cantidad'];              //echo $ingredientes[$j]['idi'];              $nuevo[] = array('iding'=>$ingredientes[$j]['idi'],                                     'codigoing' =>$ingredientes[$j]['codigi'],                                     'cantidad'=>$cant,                                     'abreviatura'=>$ingredientes[$j]['abreviatura'],                                     'ingredientes'=>$ingredientes[$j]['ingrediente'],                                     'unidad_medida_id'=>$ingredientes[$j]['unidad_medida_id'],                                     'costo'=>$ingredientes[$j]['costo'],                                     'idreceta'=>$ingredientes[$j]['idreceta'],                                     'recetaing'=>$ingredientes[$j]['recetaing'],                                     'contenido_neto'=>$ingredientes[$j]['contenido_neto'],                                     'formula_c'=>$ingredientes[$j]['formula_c'],                                   'idpadre'=>$ingredientes[$j]['idprod'],                                     'padre'=>$ingredientes[$j]['producto']);            }                             }        }        if (isset($nuevo)) {          //print_r($nuevo);          return $nuevo;        }else{          return false;        }                  }    function datostienda($tienda){      $query = "SELECT unidad_negocio.id as 'idT', unidad_negocio.nombre as 'tienda', mercancia.id as 'idP', mercancia.codigo, mercancia.nombre as 'producto', mercancia.marca, mc.descripcion, format(mc.existencia,4,'de_DE') as stock, mc.existencia, mercancia.contenido_neto, format(mc.stock_min,4,'de_DE') as stockm, mc.stock_min, format(mc.stock_max,4,'de_DE') as stockm2, mc.stock_max, mc.status, mercancia.precio_unitario, format(mercancia.precio_unitario,4,'de_DE') as costom,  unidad_medida.id as 'idUMS',unidad_medida.unidad as 'unidadS', unidad_medida.abreviatura as 'abreviaturaS', unidad_presentacion.id as 'idUMP',unidad_presentacion.unidad as 'unidadP', unidad_presentacion.abreviatura as 'abreviaturaP',unidad_compra.id as 'idUMC',unidad_compra.unidad as 'unidadC', unidad_compra.abreviatura as 'abreviaturaC', ref.referencia as 'familia', submodelo.nombre as 'subM', model.nombre as modelo, model.id as idm, mercancia.tipo_inventario_id, empresa_id       FROM `unidad_negocio`       LEFT join mercancia_has_unidad_negocio as mc on mc.unidad_negocio_id = unidad_negocio.id       LEFT join mercancia on mercancia.id = mc.mercancia_id       LEFT join unidad_medida on unidad_medida.id = mercancia.unidad_medida_sistema_id      LEFT join unidad_medida as unidad_presentacion on unidad_presentacion.id = mercancia.unidad_medida_consumo_id       left join unidad_medida as unidad_compra on unidad_compra.id = mercancia.unidad_medida_compra_id       LEFT join referencia as ref on ref.id = mercancia.familia_id       left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id       left join modelo as model on model.id = modelo_has_submodelo.modelo_id      left join modelo as submodelo on submodelo.id = modelo_has_submodelo.sub_modelo_id      WHERE unidad_negocio.id = $tienda ORDER BY mc.status = 1";       $valores = $this->select($query); #print_r($valores);      return $valores;    }   /* public function productosSinUsar($codigoPadre){      $string = " ";      try {      $this->_db->beginTransaction();      $query = "SELECT nombre FROM combo where codigoPadre = ".$codigoPadre."";      $auxiliar = $this->_db->query($query);      $resultado = $auxiliar->fetchAll();      for ($i=0; $i < count($resultado) ; $i++) {          $aux[$i]= $resultado[$i]['nombre'];         $cadena = "and profesor_id != $aux[$i] ";         $string = $string.$cadena;              }         $query = "SELECT DISTINCT producto.nombre as 'producto', grupo.nombre as 'grupo' FROM producto           where referencia.id = ".$carrera." and (materia_id != ".$materia." or materia_id is null) ".$string;       $auxiliar2 = $this->_db->query($query);       $result2= $auxiliar2->fetchAll();                      //Controller::Vardump($result2);        $this->_db->commit();        }        catch (Exception $e){                    $this->_db-rollBack();          echo "Error :: ".$e->getMessage();          exit();                  }                return $result2;          } */    public function contarrequisiciones($privilegios){               /*SELECT reposicion_id, remision_id, remision.unidad_negocio_id as udnremi, status_id, remision.fecha as fecharemi, remision.hora as horaremi, descripcion, cantidad, rm.unidad_negocio_id as udnrepo, rm.fecha as fecharepo, rm.hora as horarepo, total, tipo_reposicionFROM notificacion_has_remision                          left join remision on remision_id = remision.id                    left join reposicion_mercancia as rm on rm.id = notificacion_has_remision.reposicion_id                         where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 order by notificacion_has_remision.status_id, remision.fecha, rm.fecha asc*/               $modelos = Session::modelo('idUsuario');               switch ($privilegios) {                    case 'e':                         $query = "SELECT remision_id, reposicion_id, nt.unidad_negocio_id as idunt, status_id, unidad_negocio.codigo as codiudR, unidad_negocio.nombre as tiendaR, unidad_negocio.rif as rifr, unidad_negocio.razon_social as razon_sr, unidad_negocio.correo as emailur, unidad_negocio.empresa_id as idempresaur, referencia.referencia as status, reposicion_mercancia.unidad_negocio_id as idurepo, remision.unidad_negocio_id as iduremi, udnrepo.nombre as tiendarepo, udnrepo.rif as rifrepo, udnrepo.razon_social as razon_srepo, udnrepo.correo as emailurepo, udnrepo.empresa_id as idempresaurepo, udnremi.nombre as tiendaremi, udnremi.rif as rifremi, udnremi.razon_social as razon_sremi, udnremi.correo as emailuremi, udnremi.empresa_id as idempresauremi, usuario.nombre as nombreremi, usuario.apellido as apellidoremi, user.nombre as nombrerepo, user.apellido as apellidorepo, remision.usuario_id as idusremi, reposicion_mercancia.usuario_id as idusrepo,  modelo.nombre as modelo, modelrepo.nombre as modelorepo, modelremi.nombre as modeloremi, num_remision, num_reposicion, remision.fecha as fecharemi, remision.hora as horaremi, reposicion_mercancia.fecha as fecharepo, reposicion_mercancia.hora as horarepo, reposicion_mercancia.total                    FROM `notificacion_has_remision`as nt                     LEFT JOIN remision on remision_id = remision.id                     LEFT JOIN reposicion_mercancia on reposicion_mercancia.id = reposicion_id                     INNER JOIN unidad_negocio on unidad_negocio.id = nt.unidad_negocio_id                     LEFT JOIN unidad_negocio as udnrepo on udnrepo.id = reposicion_mercancia.unidad_negocio_id                     LEFT JOIN unidad_negocio as udnremi on udnremi.id = remision.unidad_negocio_id                     INNER JOIN referencia on referencia.id = status_id                    left JOIN usuario on usuario.id = remision.usuario_id                    left JOIN usuario as user on user.id = reposicion_mercancia.usuario_id                    LEFT JOIN modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id                    LEFT JOIN modelo on modelo.id = modelo_has_submodelo.modelo_id                    LEFT JOIN modelo_has_submodelo as mhsrepo on mhsrepo.id = udnrepo.modelo_has_submodelo_id                    LEFT JOIN modelo as modelrepo on modelrepo.id = modelo_has_submodelo.modelo_id                    LEFT JOIN modelo_has_submodelo as mhsremi on mhsremi.id = udnremi.modelo_has_submodelo_id                    LEFT JOIN modelo as modelremi on modelremi.id = modelo_has_submodelo.modelo_id                         where nt.status_id = 126 or nt.status_id = 127 or nt.status_id = 128 or nt.status_id = 129 or nt.status_id = 201 order by nt.status_id, remision.fecha, reposicion_mercancia.fecha asc";                         $data = $this->select($query);                         $cantidad = count($data);                         return $cantidad;                    break;                                        case 't':                                                  for ($i=0; $i < count($modelos); $i++) {                              $udn[$i] = $modelos[$i]['idUd'];                         $query = "SELECT reposicion_id, remision_id, remision.unidad_negocio_id as udnremi, status_id, remision.fecha as fecharemi, remision.hora as horaremi, descripcion, cantidad, rm.unidad_negocio_id as udnrepo, notificacion_has_remision.unidad_negocio_id as udnr, rm.fecha as fecharepo, rm.hora as horarepo, total, tipo_reposicion                         FROM notificacion_has_remision                          left join remision on remision_id = remision.id                    left join reposicion_mercancia as rm on rm.id = notificacion_has_remision.reposicion_id                         where notificacion_has_remision.status_id = 126 or notificacion_has_remision.status_id = 127 or notificacion_has_remision.status_id = 128 or notificacion_has_remision.status_id = 129 or notificacion_has_remision.status_id = 201 order by notificacion_has_remision.status_id, remision.fecha, rm.fecha asc";                              $datos = $this->select($query);                              //echo count($datos)."<br>";                                                                 for ($j=0; $j <count($datos) ; $j++) {                                         //echo $datos[$j][2]."<br>";                                        if ($datos[$j][2] == $udn[$i]) {                                             $data[] = $datos[$j];                                        }                                   }//print_r($data);                                                            }                         $cantidad = count($data);                         return $cantidad;                    break;                         }                  }      }?>