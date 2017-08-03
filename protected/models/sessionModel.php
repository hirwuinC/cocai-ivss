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
			$this->_query = "SELECT usuario.id, usuario.nombre as 'name', usuario.apellido, unidad_negocio.id as 'idUd', unidad_negocio.codigo, unidad_negocio.nombre as 'tienda', modelo.id as 'idM', modelo.nombre as 'modelo' FROM `usuario` left join usuario_has_unidad_negocio on usuario_has_unidad_negocio.usuario_id = usuario.id left join unidad_negocio on unidad_negocio.id = usuario_has_unidad_negocio.unidad_negocio_id left join modelo_has_submodelo on modelo_has_submodelo.id = unidad_negocio.modelo_has_submodelo_id left join modelo on modelo.id = modelo_has_submodelo.modelo_id WHERE usuario.id = $id";
			
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