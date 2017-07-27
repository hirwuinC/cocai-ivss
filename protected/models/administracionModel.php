<?php
  
  class administracionModel extends Model {
    
    protected   $query;
    
    public function __construct() {
      parent::__construct();
    }
    
    public function __destruct() {
      ;
    }

    public function insertar($query, $tabla=false){
    	//var_dump($query);
    	//exit();
    	try {
				$this->_db->beginTransaction();
				$this->_db->prepare($query)->execute();
				$id =  $this->_db->lastinsertid($tabla);
				$this->_db->commit();
			}
			catch (Exception $e){
				$this->_db->rollBack();
				echo "Error :: ".$e->getMessage();
				exit();
			}
			return $id;

    }

    public function totalRegistros($query){
    	//echo $query;
    	$auxiliar = $this->_db->query($query);

				try {
				$this->_db->beginTransaction();
				$result= $auxiliar->fetchAll();
				$numFila = $auxiliar->rowCount();
				$this->_db->commit();
				}
				catch (Exception $e){
					
					$this->_db-rollBack();
					echo "Error :: ".$e->getMessage();
					exit();
					
				}
				    $result = $numFila;
				return $result;

    }

    public function listar($query){

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

    public function modificar($query){
    	//var_dump($query); 
    	try {
				$this->_db->beginTransaction();
				//$this->_db->prepare($query);
				$result=$this->_db->exec($query);
				$this->_db->commit();
				
			}
			catch (Exception $e){
				$this->_db->rollBack();
				echo "Error :: ".$e->getMessage();
				exit();
			}
		return $result;

    }

    public function eliminar($query){

    	try {
				$this->_db->beginTransaction();
				//$this->_db->prepare($query);
				$result=$this->_db->exec($query);
				$this->_db->commit();
			}
			catch (Exception $e){
				$this->_db->rollBack();
				echo "Error :: ".$e->getMessage();
				exit();
			}
		return $result;
    }


   /* public function productosSinUsar($codigoPadre){

			$string = " ";
			try {
			$this->_db->beginTransaction();
			$query = "SELECT nombre FROM combo where codigoPadre = ".$codigoPadre."";

			$auxiliar = $this->_db->query($query);
			$resultado = $auxiliar->fetchAll();
			for ($i=0; $i < count($resultado) ; $i++) { 
				 $aux[$i]= $resultado[$i]['nombre'];
				 $cadena = "and profesor_id != $aux[$i] ";
				 $string = $string.$cadena;
				
			}
		
		 $query = "SELECT DISTINCT producto.nombre as 'producto', grupo.nombre as 'grupo' FROM producto
				   where referencia.id = ".$carrera." and (materia_id != ".$materia." or materia_id is null) ".$string; 
			$auxiliar2 = $this->_db->query($query);	
			$result2= $auxiliar2->fetchAll();
				
			

				//Controller::Vardump($result2);

				$this->_db->commit();
				}
				catch (Exception $e){
					
					$this->_db-rollBack();
					echo "Error :: ".$e->getMessage();
					exit();
					
				}
				
				return $result2;
			
		} */
    
  
    
    
  }
?>