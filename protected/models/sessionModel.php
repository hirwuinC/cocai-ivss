<?php

	class sessionModel extends Model {
	
		protected $_query;
	
		public function __construct() {
			parent::__construct();
		}
	
		public function __destruct() {
			;
		}
	
		public function getRole($id) {
				//echo $id;
			$this->_query = "SELECT usuario_has_modelo.usuario_id, referencia.id as 'idmodelo', referencia.referencia as 'modelo', ref1.id as 'idsubmodelo', ref1.referencia as 'sub-modelo',usuario.nombre, usuario.apellido FROM `usuario_has_modelo` INNER JOIN referencia on referencia.id = usuario_has_modelo.modelo_id INNER JOIN referencia as ref1 on ref1.padre_id = referencia.id 
inner join usuario on usuario.id = usuario_has_modelo.usuario_id WHERE usuario_has_modelo.usuario_id = $id and ref1.referencia NOT in ('Sin asignar')";
			
			$roles = $this->_db->query($this->_query);
				
			try {
				$this->_db->beginTransaction();
				$result = $roles->fetchAll();
				$this->_db->commit();
			}
			catch (Exception $e) {
				$this->_db->rollBack();
				echo "Error :: ".$e->getMessage();
				exit();
			}
				
			return $result;
		}
	}
	?>