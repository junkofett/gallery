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

  public function existe($id){
    $res = $this->user_by_id($id);

    if(count($res) > 0):
      return TRUE;
    else:
      return FALSE;
    endif;
  }

  public function existe_nick($nick){
    $res = $this->db->get_where('usuarios', ['nick' => $nick]);

    if($res->num_rows() > 0):
      return TRUE;
    else:
      return FALSE;
    endif;    
  }

  public function user_by_id($id){
    return $this->db->get_where('usuarios', ['id' => $id])->row_array();
  }

  public function user_by_nick($nick){
    return $this->db->get_where('usuarios', ['nick' => $nick])->row_array();
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

  public function seguir_usuario($nick){
    if(!$this->Usuario->is_logged()) redirect('inicio');

    $actual_id = $this->session->userdata('id');
    $usuario = new Usuario($nick);

    if($usuario === FALSE):
      return FALSE;
    else:
      $this->db->insert('seguidores', ['usuarios_id'   => $actual_id,
                                       'seguidores_id' => $usuario->id]);
    endif;
  }

  public function es_seguidor($nick){
    if(!$this->existe_nick($nick)) return FALSE;


    if($this->Usuario->is_logged()):
      $seguido = $this->user_by_nick($nick);
      
      $res = $this->db->get_where(
                          'seguidores', 
                          ['usuarios_id'   => $this->session->userdata('id'),
                           'seguidores_id' => $seguido['id']]
                        );

      if($res->num_rows() > 0):
        return TRUE;
      else:
        return FALSE;
      endif;
    else:
      return FALSE;
    endif;
  }

  public function contar_notificaciones(){
    if(!$this->Usuario->is_logged()) redirect('inicio');

    $this->db->select('count(*)');
    $this->db->from('notificaciones');
    $this->db->where('usuarios_id', $this->session->userdata('id'));
    $res = $this->db->get()->row_array();

    if($res['count'] > 0):
      return $res['count'];
    else:
      return FALSE;
    endif;
  }

  public function get_notificaciones(){
    if(!$this->Usuario->is_logged()) redirect('inicio');

    $user_id = $this->session->userdata('id');
    $res = $this->db->get_where('notificaciones', ['usuarios_id' => $user_id]);

    if($res->num_rows() > 0):
      return $res->result_array();
    else:
      return FALSE;
    endif;
  }
}