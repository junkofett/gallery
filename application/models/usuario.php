<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuario extends CI_Model{
  public function __construct($nick = NULL){
    parent::__construct();

    if($nick != NULL){
      $res = $this->db->query('select *
                                 from usuarios
                                where nick = ?', [$nick]);

      if($res->num_rows() > 0){
        $fila = $res->row_array();

        foreach ($fila as $key => $value):
            $this->$key = $value;
        endforeach;

        return $this;        
      }else{
        return FALSE;
      }
    }else{
      return FALSE;
    }
  }
}