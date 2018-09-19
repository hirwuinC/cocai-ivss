<?php 

  class usuarioModel extends Model{

    protected $query;

    public function __construct(){

      parent::__construct();
    }

    public function __destruct(){

    }

    public function listusers($tiendas){
    	//print_r($tiendas);
    	$iduserlogued = Session::get('idUsuario');
    	for ($i=0; $i <count($tiendas) ; $i++) { 
    		$query = "SELECT DISTINCT(usuario.id) nombre,apellido from usuario inner join usuario_has_unidad_negocio on usuario.id = usuario_id where unidad_negocio_id = '".$tiendas[$i]['id']."'";
    		$data = $this->listing($query);
    	}
    	
    	return $data;
    }

    public function listing($query){
      
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

    

  }

?>
