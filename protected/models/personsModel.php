<?php 

	class personsModel extends Model{
		
		protected $query;
		
		public function __construct(){
			parent::__construct();
		}
		public function __destruct(){
			;
		}

		public function insertPerson($persona){

			$this->query = "INSERT INTO personas
			(cedula  , nombre ,  apellido , sexo ,  fecha_nacimiento ,  telefono ,  correo)  VALUES 
			(:cedula , :nombre, :apellido, :sexo , :fecha_nacimiento , :telefono , :correo)   ";
		
			try {
				$this->_db->beginTransaction();
				$this->_db->prepare($this->query)->execute($persona);
				$this->_db->commit();
			}
			catch (Exception $e){
				$this->_db->rollBack();
				echo "Error :: ".$e->getMessage();
				exit();
			}
			
		}
		
		
		
		
		
		
		
		public function getPersons(){

		$query = "SELECT * FROM personas";
			
			$auxiliar = $this->_db->query($query);
				try {
				$this->_db->beginTransaction();
				$result= $auxiliar->fetchAll();
				$this->_db->commit();
				}
				catch (Exception $e){
					
					$this->_db-rollBack();
					echo "Error :: ".$e->getMessage();
					exit();
					
				}
				
				return $result;
			
		}

		public function getUnicaPersona($id){

		$query = "SELECT * FROM personas where id = $id";
			
			$auxiliar = $this->_db->query($query);
				try {
				$this->_db->beginTransaction();
				$result= $auxiliar->fetchAll();
				$this->_db->commit();
				}
				catch (Exception $e){
					
					$this->_db-rollBack();
					echo "Error :: ".$e->getMessage();
					exit();
					
				}
				
				return $result;
			
		}

		
		

		public function updatePerson($persona){
		$this->query = "UPDATE PERSONAS SET 
					cedula 		= :cedula,
					nombre 		= :nombre,
					apellido 	= :apellido,
					sexo 		= :sexo,
					fecha_nacimiento = :fecha_nacimiento,
					telefono 		= :telefono,
					correo 		= :correo
					where id = :id";

				
		
			try {
				$this->_db->beginTransaction();
				$this->_db->prepare($this->query)->execute($persona);
				$this->_db->commit();
			}
			catch (Exception $e){
				$this->_db->rollBack();
				echo "Error :: ".$e->getMessage();
				exit();
			}
			
		}
		


		public function deletePersons($id){
		$this->query = "DELETE  FROM personas where id = $id";

				
		
			try {
				$this->_db->beginTransaction();
				$this->_db->prepare($this->query)->execute();
				$this->_db->commit();
			}
			catch (Exception $e){
				$this->_db->rollBack();
				echo "Error :: ".$e->getMessage();
				exit();
			}
			
		}
		 
	


		public function getSexo(){

		$query = "SELECT * FROM sexo";
			
			$auxiliar = $this->_db->query($query);
				try {
				$this->_db->beginTransaction();
				$result= $auxiliar->fetchAll();
				$this->_db->commit();
				}
				catch (Exception $e){
					
					$this->_db-rollBack();
					echo "Error :: ".$e->getMessage();
					exit();
					
				}
				
				return $result;
			
		}

		








}?>