<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuario extends CI_Model{
  public function __construct($nick = NULL){
    parent::__construct();

    if($nick != NULL):
      $res = $this->db->get_where('usuarios',['nick' => $nick]);

      if($res->num_rows() > 0):
        $fila = $res->row_array();

        foreach ($fila as $key => $value):
            $this->$key = $value;
        endforeach;

        return $this;        
      else:
        return FALSE;
      endif;
    else:
      return FALSE;
    endif;
  }

  public function is_logged(){
    if($this->session->userdata('nick'))
      return TRUE;
    else
      return FALSE;
  }

  public function is_admin(){
    if($this->is_logged()):
      if($this->session->userdata('id') === 0):
        return TRUE;
      else:
        return FALSE;
      endif;
    else:
      return FALSE;
    endif;
  }

  public function is_owner($img_id){
    if (!$this->is_logged()) return FALSE;
    $res = $this->db->get_where('imagenes', ['id' => $img_id]);

    if($res->num_rows() > 0):
      $fila = $res->row_array();

      if($fila['usuarios_id'] == $this->session->userdata('id')):
        return TRUE;
      else:
        return FALSE;
      endif;
    endif;
  }

  public function registrar($nick, $pass){
    $this->db->insert('usuarios', ['nick' => $nick, 
                                   'pass' => $pass]);
  }
}