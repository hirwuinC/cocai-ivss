<?php
	
	class loginModel extends Model {
		
		protected 	$query;
		
		public function __construct() {
			parent::__construct();
		}
		
		public function __destruct() {
			;
		}
		
		public function getUser($pass) {
			//echo $pass."<br>";
			$data = $this->_db->query("SELECT usuario.id, usuario.usuario, usuario.nombre, usuario.apellido, usuario.clave, referencia.id as 'idTipoU', referencia.referencia as 'tipoU' FROM usuario 
									   INNER JOIN referencia on referencia. id = usuario.tipo_usuario_id
                                       WHERE clave = '".$pass."'");
			return $data->fetch();
		}
		
		
		
	}
?>