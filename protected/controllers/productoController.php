<?php 
    class productoController extends Controller{
        
        
        protected $_sidebar_menu;
        private $_producto;
        
        public function __construct(){
    
            parent::__construct();
            $this->_admin = $this->loadModel('administracion');
        //Objeto donde almacenamos todas las funciones de PersonsModel.php

            $this->_sidebar_menu =array(
                    array(
                'id' => 'insert_new',
                'title' => 'Nueva Persona',
                'link' => BASE_URL . 'persons' . DS . 'insert'
                        )
                                        );
           // Session::accessRole(array('Super usuario','AdministradorB'));
        }
        
        function index(){
            
            $this->_view->render('index', 'producto', '','');
            // clase  metodo      vista    carpeta dentro de views 
        }

        function inicio($subM,$modelo, $error=false){
            $this->_view->setJs(array('js/prod'));
            $this->_view->setCss(array('datatable/css/dataTables.bootstrap'));
            $this->_view->setCss(array('datatable/css/responsive.bootstrap'));
            $this->_view->setjs(array('datatable/js/jquery.dataTables.min'));
            $this->_view->setJs(array('datatable/js/dataTables.bootstrap.min'));
            $this->_view->setJs(array('datatable/js/tabla'));
            Session::time();
            $query = "SELECT producto.id as 'idP', producto.codigo, producto.codigo_tcr, producto.nombre, producto.costo, producto.precioVta_A, producto.precioVta_B, producto.producto_Inactivo, producto.Ocultar, producto.dia_disponible_id, producto.tipo_producto_id, producto.tipo_manejo_id, producto.grupo_id, producto.sub_modelo_id, producto.tipo, grupo.id as 'idG', grupo.nombre as 'grupo', referencia.referencia as dia_Disponible,
                ref1.referencia as tipo_producto, ref2.referencia as tipo_manejo, ref4.referencia as submodelo,
                ref5.referencia as 'modelo', ref5.id as 'idmodelo', ref6.referencia as 'division', ref6.id as 'idDivision'
                FROM producto 
                left join grupo on grupo.id = producto.grupo_id
                left join referencia on referencia.id = producto.dia_disponible_id
                left join referencia as ref1 on ref1.id = producto.tipo_producto_id
                left join referencia as ref2 on ref2.id = producto.tipo_manejo_id  
                left join referencia as ref4 on ref4.id = producto.sub_modelo_id
                LEFT JOIN referencia as ref5 on ref5.id = ref4.padre_id
                LEFT JOIN referencia as ref6 on ref6.id = ref5.padre_id
                WHERE sub_modelo_id = $subM and producto.grupo_id IS NOT NULL and producto.sub_modelo_id IS NOT NULL ORDER BY producto.producto_Inactivo = 1";  
                $valores = $this->_admin->listar($query);
                $cantidad= count($valores);
                if ($cantidad > 0) {
                    if ($error == 'true') {
                        $this->_view->_error = Controller::getBoxAlert(
                        'Este sub-modelo no tiene script de actualizacion, genere uno y intente nuevamente por favor', 
                        '',
                        'danger');
                    }
                    $this->_view->pro = $valores;
                    $this->_view->render('inicio', 'producto', '','');
                }else{
                    $query = "SELECT referencia.id as 'sub_modelo_id' ,referencia.referencia as 'submodelo', ref1.id as 'idmodelo', ref1.referencia as 'modelo' FROM `referencia` INNER JOIN referencia as ref1 on ref1.id = referencia.padre_id WHERE referencia.id = $subM"; 
                    $valores = $this->_admin->listar($query);
                    $valores[0]['codigo'] = 'vacio'; 
                    #print_r($valores);
                    $this->_view->pro = $valores;
                    $this->_view->render('inicio', 'producto', '','');
                }
        }

        function insert(){
            if ($_SERVER['REQUEST_METHOD']=='POST') {       
            //Guardamos en un arreglo  lo que recibimos via POST de la vista
                //print_r($_POST); echo "<br>"; exit();
                if ($_POST['costo'] == 0) {
                    $costo = '00,0';
                }else{
                    $costo = $_POST['costo'];
                }
                if ($_POST['precioVta_B'] == 0) {
                    $PVPB = '00,0';
                }else{
                    $PVPB = $_POST['precioVta_B'];
                }
                $accion='Creado'; 
                $query = "INSERT INTO `producto`(`codigo`, `codigo_tcr`, `nombre`, `costo`, `precioVta_A`, `precioVta_B`, `producto_Inactivo`, `ocultar`, `tipo`, `dia_disponible_id`, `tipo_producto_id`, `tipo_manejo_id`, `grupo_id`, `sub_modelo_id`)VALUES('".$_POST['codigo']."','".$_POST['codigo_tcr']."','".$_POST['nombre']."','".$costo."','".$_POST['precioVta_A']."','".$PVPB."',".$_POST['producto_Inactivo'].",".$_POST['ocultar'].",".$_POST['tipo'].",".$_POST['dia_disponible_id'].",".$_POST['tipo_producto_id'].",".$_POST['tipo_manejo_id'].",".$_POST['grupo_id'].",".$_POST['sub_modelo'].")";
                $idP =$this->_admin->insertar($query);
                $this->log($idP,$_POST['modelo'],$_POST['sub_modelo'],$accion);
                $this->_view->redirect('producto/inicio/'.$_POST['sub_modelo'].'/'.$_POST['modelo'].'/'.'');
            }else{ 
                $this->_view->redirect('producto/inicio/'.$_POST['sub_modelo'].'/'.$_POST['modelo'].'/'.'');
            }
        }

        function update(){
            if ($_SERVER['REQUEST_METHOD']=='POST') {
                //print_r($_POST); echo"<br>"; 
                if ($_POST['producto_Inactivo'] == 'Activo') {
                    $pI= 0;
                }else{
                    $pI=1;
                }
                if ($_POST['ocultar'] == 'No') {
                    $o= 0;
                }else{
                    $o=1;
                }   
                $accion='Modificado'; 
                $this->log($_POST['idP'],$_POST['idm'],$_POST['idsm'],$accion);
                $query = "UPDATE `producto` SET `codigo`='".$_POST['codigo']."',`codigo_tcr`='".$_POST['codigo_tcr']."',`nombre`='".$_POST['nombre']."',`costo`='".$_POST['costo']."',`precioVta_A`='".$_POST['precioVta_A']."',`precioVta_B`='".$_POST['precioVta_B']."',`producto_Inactivo`=".$pI.",`ocultar`=".$o.",`dia_disponible_id`=".$_POST['dia_disponible_id'].",`tipo_producto_id`=".$_POST['tipo_producto_id'].",`tipo_manejo_id`=".$_POST['tipo_manejo_id']." WHERE `id`= ".$_POST['idP']."";
                $this->_admin->modificar($query);
                $this->_view->redirect('producto/inicio/'.$_POST['idsm'].'/'.$_POST['idm'].'/'.'');

            }else{
                $this->_view->redirect('producto/inicio/'.$_POST['idsm'].'/'.$_POST['idm'].'/'.'');

            }
        }

        function delete($idsm, $idm, $idp){
            //echo $idm.' '.$idsm; exit();
            $accion = 'Eliminado'; 
            $this->log($idp,$idm,$idsm,$accion);
            $query ="DELETE FROM `producto` WHERE id = $idp";
            $resultado = $this->_admin->eliminar($query);
            if (!empty($resultado)) {
                $js = true;
                echo json_encode($js);
            }else{
                $js = false;
                echo json_encode($js);
            }   
        }

        function insertCombo($tipo, $cantidad, $nombre, $codigoPadre, $subm){
            $accion = 'Creado';
            if ($tipo == 'G') {
                $query = "SELECT nombre FROM `grupo` WHERE id = '".$nombre."'";
                $nameG =$this->_admin->listar($query);
                $name = $nameG[0][0];
            }else{
                $query = "SELECT nombre FROM `producto` WHERE id = '".$nombre."'";
                $nameP =$this->_admin->listar($query);
                $name = $nameP[0][0];
            }
            $query = "INSERT INTO `combo`(`codigo_padre`, `codigo`, `nombre`, `cantidad`,`submodelo_id`) VALUES ('".$codigoPadre."','".$tipo."','".$name."','".$cantidad."','".$subm."')";
            $idC = $this->_admin->insertar($query);
            $this->logCombo($idC, $subm, $accion);
            $query = "SELECT * FROM `combo` WHERE codigo_padre = '".$codigoPadre."'";
            $data =$this->_admin->listar($query);
            #$query = "SELECT nombre as 'nombreP' FROM `producto` WHERE codigo= '".$codigoPadre."'";
            #$namePro =$this->_admin->listar($query); //echo $namePro[0][0]."<br>";
            echo json_encode($data);
        }

        function cargarTablaCombo($idCombo){
            #$query = "SELECT nombre as 'nombreP' FROM `producto` WHERE codigo= '".$idCombo."'";
            #$namePro =$this->_admin->listar($query); //echo $namePro[0][0]."<br>";
            $query = "SELECT * FROM `combo` WHERE codigo_padre = '".$idCombo."'";
            $data =$this->_admin->listar($query);
            //$data[0][0] = $namePro[0][0];
            echo json_encode($data);
        }

        function eliminarCombo($id, $codigoPadre, $idsm){
            $accion = 'Eliminado';
            $this->logCombo($id, $idsm, $accion);
            $query = "DELETE FROM `combo` WHERE id = $id";
            $idC =$this->_admin->insertar($query);
            $query = "SELECT * FROM `combo` WHERE codigo_padre = '".$codigoPadre."'";
            $data =$this->_admin->listar($query);
            #$query = "SELECT nombre as 'nombreP' FROM `producto` WHERE codigo= '".$codigoPadre."'";
            #$namePro =$this->_admin->listar($query); //echo $namePro[0][0]."<br>";
            echo json_encode($data);
        }

        function codigoP($idM, $idSM){
            $query = "SELECT * FROM producto where sub_modelo_id = $idSM";
            $data = $this->_admin->totalRegistros($query);
            $query = "SELECT * FROM `sigla` where sub_modelo_id = $idM";
            $modelo = $this->_admin->listar($query);
            $query = "SELECT * FROM `sigla` where sub_modelo_id = $idSM";
            $subModelo = $this->_admin->listar($query);
            $codigo[0]= $data + 1;
            $codigo[1]= $modelo[0][1];
            $codigo[2]= $subModelo[0][1]; 
            echo json_encode($codigo);
        }

        function validarCod($code, $subM){
            $query = "SELECT codigo FROM producto where sub_modelo_id = $subM and codigo = '".$code."'";
            $resultado = $this->_admin->listar($query);
            if (!empty($resultado)) {
                $codigo = true;
            }else{
                $codigo = false;
            }
            echo json_encode($codigo);

        }

        function validarNombre($name, $idsm){
            $nombre=str_replace ( ':' , ' ' , $name);
            $query = "SELECT * FROM producto INNER JOIN referencia on referencia.id = producto.sub_modelo_id INNER JOIN referencia as ref1 on ref1.id = referencia.padre_id where producto.nombre = '".$nombre."' and producto.sub_modelo_id = $idsm";
            $resultado = $this->_admin->listar($query);
            if (!empty($resultado)) {
                $nom= true;
            }else{
                $nom = false;
            }
            echo json_encode($nom);

        }

     function txt($idSM,$idM,$idD){

        $query = "SELECT producto.id as 'idP', producto.codigo, producto.codigo_tcr, producto.nombre, producto.costo, producto.precioVta_A, producto.precioVta_B, producto.producto_Inactivo, producto.Ocultar, producto.dia_disponible_id, producto.tipo_producto_id, producto.tipo_manejo_id, producto.grupo_id, producto.sub_modelo_id, grupo.id as 'idG', grupo.nombre as 'grupo', referencia.referencia as dia_Disponible,
                ref1.referencia as tipo_producto, ref2.referencia as tipo_manejo, ref4.referencia as submodelo,
                ref5.referencia as 'modelo', ref5.id as 'idmodelo', ref6.referencia as 'division', ref6.id as 'idDivision'
                FROM producto 
                left join grupo on grupo.id = producto.grupo_id
                left join referencia on referencia.id = producto.dia_disponible_id
                left join referencia as ref1 on ref1.id = producto.tipo_producto_id
                left join referencia as ref2 on ref2.id = producto.tipo_manejo_id  
                left join referencia as ref4 on ref4.id = producto.sub_modelo_id
                LEFT JOIN referencia as ref5 on ref5.id = ref4.padre_id
                LEFT JOIN referencia as ref6 on ref6.id = ref5.padre_id
                WHERE sub_modelo_id = '".$idSM."'";

        $data = $this->_admin->listar($query);
        $query = "SELECT * FROM `sigla` where sub_modelo_id = $idD";
        $division = $this->_admin->listar($query);
        $query = "SELECT * FROM `sigla` where sub_modelo_id = $idM";
        $modelo = $this->_admin->listar($query);
        $query = "SELECT * FROM `sigla` where sub_modelo_id = $idSM";
        $subModelo = $this->_admin->listar($query);
        $query = "SELECT * FROM `grupo` where submodelo_id = $idSM";
        $grupos = $this->_admin->listar($query);
        $query = "SELECT * FROM `combo` where submodelo_id = $idSM";
        $combos = $this->_admin->listar($query);
        //print_r($division); echo "<br>"; print_r($modelo); echo "<br>"; print_r($subModelo); //exit();
        $ruta = 'public/comunicaciones/';
            for ($l=0; $l < count($subModelo); $l++) { 
                $directorio = 'public/comunicaciones/'.$division[0][1].$modelo[0][1].$subModelo[$l][1].'.txt';
                $directorio1 = 'public/comunicaciones/'.$division[0][1].$modelo[0][1].$subModelo[$l][1].'-T.txt';
                $directorio2 = 'public/comunicaciones/'.$division[0][1].$modelo[0][1].$subModelo[$l][1].'-C.txt';
                $name= $division[0][1].$modelo[0][1].$subModelo[$l][1];
                $archivo=fopen($directorio,"w") or die("Problemas en la creacion");
                $archivo1=fopen($directorio1,"w") or die("Problemas en la creacion");
                $archivo2=fopen($directorio2,"w") or die("Problemas en la creacion");
                if (!empty($archivo) and !empty($archivo1) and !empty($archivo2)) {
                    for($i=0; $i<count($data); $i++){
                    fputs($archivo,$data[$i][1].';'.$data[$i][15].';'.$data[$i][3].';'.$data[$i][4].';'.$data[$i][5].';'.$data[$i][6].';'.$data[$i][16].';'.$data[$i][17].';'.$data[$i][7].';'.$data[$i][8].';'.$data[$i][18].chr(13).chr(10));          
                    }
                    for ($j=0; $j < count($grupos); $j++) { 
                        fputs($archivo1,$grupos[$j]['ordenNum'].';'.$grupos[$j]['codigo'].';'.$grupos[$j]['nombre'].';'.$grupos[$j]['recetaInactiva'].';'.$grupos[$j]['subGrupo'].';'.$grupos[$j]['imagenProducto'].chr(13).chr(10));          

                    }
                    for ($f=0; $f < count($combos); $f++) { 
                        fputs($archivo2,$combos[$f]['codigo_padre'].';'.$combos[$f]['codigo'].';'.$combos[$f]['nombre'].';'.$combos[$f]['cantidad'].chr(13).chr(10));          

                    }
                    fclose($archivo);
                    fclose($archivo1);
                    fclose($archivo2);
                    //
                }else{
                    
                }
            }
            if (file_exists($directorio)) {
                $this->logActualizacion($idM,$idSM);
                $this->correo($data[0]['modelo'],$data[0]['submodelo']);
                $result = true;
                echo json_encode($result);
            } else {
                $result = false;
                echo json_encode($result);
            }
                
                
    }

    public function correo($modelo, $subModelo){

        $mail = 'soporte@hdjgr.com.ve';
        $asunto  = 'Actualizacion de precios del modelo '.$modelo.' sub-modelo '.$subModelo.'';
        $mensaje = 
        'Por medio de la presente se notifica que el dia de hoy se ha realizado una actualizacion de precios para las unidades perteneciente al modelo '.$modelo.', submodelo '.$subModelo.'.';
        $cabeceras = 'MIME-Version: 1.0' . "\r\n";
        $cabeceras .= 'Content-type: text/html; charset=utf-8' . "\r\n";
        $cabeceras .= 'FROM: soporte@hdjgr.com.ve ' . "\r\n";
        mail($mail, $asunto, $mensaje, $cabecera);
       
    }

    public function descarga($smd1,$md,$dv){

        $query = "SELECT * FROM `sigla` where sub_modelo_id = $dv";
        $division = $this->_admin->listar($query); #echo $division[0][1]; 
        $query = "SELECT * FROM `sigla` where sub_modelo_id = $md";
        $modelo = $this->_admin->listar($query); #echo $modelo[0][1]; 
        $query = "SELECT * FROM `sigla` where sub_modelo_id = $smd1";
        $subModelo = $this->_admin->listar($query); #echo $subModelo[0][1];
        $nameInventario = $division[0][1].$modelo[0][1].$subModelo[0][1].'.txt';
        $nameGrupo = $division[0][1].$modelo[0][1].$subModelo[0][1].'-T.txt'; 
        $nameCombo = $division[0][1].$modelo[0][1].$subModelo[0][1].'-C.txt';  
        $directorioI = 'public/comunicaciones/'.$nameInventario;
        $directorioG = 'public/comunicaciones/'.$nameGrupo;
        $directorioC= 'public/comunicaciones/'.$nameCombo;
        $zip = new ZipArchive();
        $filename = $division[0][1].$modelo[0][1].$subModelo[0][1].'.zip';
        $zip->open($filename,ZipArchive::CREATE);
        if(file_exists($directorioI)) {
            $zip->addFile('public/comunicaciones/'.$nameInventario);
            $zip->addFile('public/comunicaciones/'.$nameGrupo);
            $zip->addFile('public/comunicaciones/'.$nameCombo);
            $zip->close();
            header('Content-Type: application/force-download');
            header('Content-Disposition: attachment; filename='.$filename);
            header('Content-Transfer-Encoding: binary');
            header('Content-Length: '.filesize($filename));
            readfile($filename);
            unlink($filename);
        }else {
            $error = 'true';
            $this->_view->redirect('producto/inicio/'.$smd1.'/'.$md.'/'.$error);  
        } 
        
    }

    public function modalUpdate($id){
        $query = "SELECT producto.id, producto.nombre, producto.producto_Inactivo, producto.ocultar, producto.dia_disponible_id, producto.tipo_producto_id, producto.tipo_manejo_id, producto.codigo_tcr, referencia.referencia as 'dia disponible', ref1.referencia as 'tipo producto', ref2.referencia as 'tipo manejo', producto.codigo, producto.costo, producto.precioVta_A, producto.precioVta_B FROM `producto` 
                INNER JOIN referencia on referencia.id = producto.dia_disponible_id
                INNER JOIN referencia as ref1 on ref1.id = producto.tipo_producto_id
                INNER JOIN referencia as ref2 on ref2.id = producto.tipo_manejo_id
                where producto.id = ".$id."";
        $producto = $this->_admin->listar($query);
        $query = "SELECT id, referencia FROM `referencia` where padre_id = 53";
        $dias = $this->_admin->listar($query);
        $query = "SELECT id, referencia FROM `referencia` where padre_id = 62";
        $tipoP = $this->_admin->listar($query);
        $query = "SELECT id, referencia FROM `referencia` where padre_id = 66";
        $tipoM = $this->_admin->listar($query);
        $data = array('dias' => $dias,
                      'tipoP' => $tipoP,
                      'tipoM' => $tipoM,
                      'producto' => $producto
                      ); 
        echo json_encode($data);
    }

    function nombreProAlert($id){
        $query = "SELECT producto.id, producto.nombre, referencia.referencia as 'submodelo', referencia.id as 'id-submodelo' FROM `producto` 
        INNER JOIN grupo on grupo.id = producto.grupo_id 
        INNER JOIN referencia on referencia.id = grupo.submodelo_id 
        where producto.id = $id";
        $data = $this->_admin->listar($query);
        echo json_encode($data);
    }

    function log($idp,$idm,$idsm,$accion){
        $fecha = date ('Y-m-d');
        $hora = date ('h:i:s');
        $idUser =Session::modelo('idUsuario');
        $query = "SELECT codigo, nombre FROM `producto` WHERE id = $idp";
        $pro = $this->_admin->listar($query); //print_r($pro); echo "<br>";
        $query = "SELECT nombre, apellido FROM `usuario` WHERE id = ".$idUser[0][0]."";
        $user = $this->_admin->listar($query); #print_r($user); echo "<br>";
        $query = "SELECT referencia FROM `referencia` WHERE id = $idm";
        $model = $this->_admin->listar($query); #print_r($model); echo "<br>";
        $query = "SELECT referencia FROM `referencia` WHERE id = $idsm";
        $sM = $this->_admin->listar($query); #print_r($sM); echo "<br>"; 
        $query = "INSERT INTO `log`(`fecha`, `hora`, `referencia`, `nombre`,`accion`, `modelo`, `sub_modelo`, `usuario`, `submodelo_id`) VALUES ('".$fecha."','".$hora."','".$pro[0]['codigo']."','".$pro[0]['nombre']."','".$accion."','".$model[0]['referencia']."','".$sM[0]['referencia']."','".$user[0]['nombre'].' '.$user[0]['apellido']."', $idsm)"; 
        $this->_admin->insertar($query);
    }

    function logCombo($id, $idsm, $accion){
        $fecha = date ('Y-m-d');
        $hora = date ('h:i:s');
        $idUser =Session::modelo('idUsuario');
        $query = "SELECT nombre, apellido FROM `usuario` WHERE id = ".$idUser[0][0]."";
        $user = $this->_admin->listar($query);
        $query = "SELECT * FROM `combo` WHERE id = $id";
        $combo = $this->_admin->listar($query);
        $query = "INSERT INTO `log`(`fecha`, `hora`, `referencia`, `nombre`,`accion`, `usuario`, `submodelo_id`) VALUES ('".$fecha."','".$hora."','".$combo[0]['codigo_padre']."','".$combo[0]['nombre']."','".$accion."','".$user[0]['nombre'].' '.$user[0]['apellido']."', $idsm)"; 
        $this->_admin->insertar($query);
    }

    function logActualizacion($idM,$idSM){
        $fecha = date ('Y-m-d');
        $hora = date ('h:i:s');
        $accion = 'Actualizacion'; 
        $idUser =Session::modelo('idUsuario');
        $query = "SELECT nombre, apellido FROM `usuario` WHERE id = ".$idUser[0][0]."";
        $user = $this->_admin->listar($query);
        $query = "SELECT referencia FROM `referencia` WHERE id = $idM";
        $model = $this->_admin->listar($query); #print_r($model); echo "<br>";
        $query = "SELECT referencia FROM `referencia` WHERE id = $idSM";
        $sM = $this->_admin->listar($query); #print_r($sM); echo "<br>"; 
        $query = "INSERT INTO `log`(`fecha`, `hora`, `accion`, `modelo`, `sub_modelo`, `usuario`, `submodelo_id`) VALUES ('".$fecha."','".$hora."','".$accion."','".$model[0]['referencia']."','".$sM[0]['referencia']."','".$user[0]['nombre'].' '.$user[0]['apellido']."', $idSM)"; 
        $this->_admin->insertar($query);
    }

        
}?>
