<?php   class mainModel extends Model{    protected $query;    public function __construct(){      parent::__construct();    }    public function __destruct(){      ;    }   public function Gets($tabla = false, $item = false, $valor = false, $modelo = false){             switch ($tabla) {        case 'referencia':         if ($item == 'padre_id') {            $query = "SELECT ref.id, ref.referencia from referencia inner join referencia as ref on ref.padre_id = referencia.id where ref.padre_id = '".$valor."' ORDER BY ref.referencia";          }else if($item == 'sub_modelo'){              $query = "SELECT ref.id, ref.referencia from referencia inner join referencia as ref on ref.padre_id = referencia.id where ref.padre_id = '".$valor."' and ref.referencia not in ('TP','CK','MF','FP','RB','PL','OH','Sin asignar')";          } else{            $query = "SELECT ref.id, ref.referencia from referencia  inner join referencia ref on ref.padre_id = referencia.id where referencia.referencia = '".$item."' ";          }            /*$query = "SELECT referencia.id, ref.id, referencia.referencia, ref.referencia from referencia inner join referencia as ref on ref.padre_id = referencia.id where ref.padre_id = '".$valor."'";*/          break;        case 'unidad_negocio':           //echo $item;            if ($item == 'modelo_id') {              $query="SELECT unidad_negocio.id, unidad_negocio.nombreC, unidad_negocio.codigo, unidad_negocio.numero_autorizacion, referencia.referencia as division, ref.referencia as modelo from unidad_negocio inner join referencia on unidad_negocio.division_id = referencia.id LEFT join referencia as ref on unidad_negocio.modelo_id = ref.id where unidad_negocio.".$item." = '".$valor."'";            }else if($item == 'division_id'){             // echo "full services funciona";              $query = "SELECT unidad_negocio.id, unidad_negocio.nombreC, unidad_negocio.codigo,  unidad_negocio.numero_autorizacion, referencia.referencia as division, ref.referencia as modelo from unidad_negocio               inner join referencia on unidad_negocio.division_id = referencia.id              LEFT join referencia as ref on unidad_negocio.modelo_id = ref.id              where unidad_negocio.".$item." = '".$valor."'";               }                    break;        case 'grupo':                    if ($item == 'familia' || $item == 'familias' or $item == 'familia2' or $item == 'familia1') {            //echo "string <br>";            $query = "SELECT * FROM grupo where padre_id = 1";          }else if($item == 'grupo1' || $item == 'grupos' || $item == 'grupo'){            $query = "SELECT * FROM grupo where submodelo_id = $modelo";          }else if($valor = false){            $query = "SELECT * FROM grupo";          }        break;        case 'producto':           $query = "SELECT id, nombre, codigo FROM `producto` WHERE grupo_id = $valor";          break;                default:           $query = "SELECT * FROM ".$tabla." where ".$item." = '".$valor."'";          break;      }                  $auxiliar = $this->_db->query($query);        try {        $this->_db->beginTransaction();        $result= $auxiliar->fetchAll();        $this->_db->commit();        }        catch (Exception $e){                    $this->_db-rollBack();          echo "Error :: ".$e->getMessage();          exit();                  }      //  echo $result[1][1];        return $result;                }    public function select($query){            $auxiliar = $this->_db->query($query);        try {        $this->_db->beginTransaction();        $result= $auxiliar->fetchAll();        $this->_db->commit();        }        catch (Exception $e){                    $this->_db-rollBack();          echo "Error :: ".$e->getMessage();          exit();                  }                return $result;          }       }?>