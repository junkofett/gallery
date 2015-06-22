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

  public function user_by_img($img_id){
    $res = $this->db->get_where('imagenes', ['id' => $img_id])
                    ->result_array();

    return $this->user_by_id($res[0]['usuarios_id']);
  }

  public function is_logged(){
    if($this->session->userdata('nick'))
      return TRUE;
    else
      return FALSE;
  }

  public function is_admin(){
    if($this->is_logged()):
      $this->db->from('usuarios');
      $this->db->where('nom_rol', 'admin');
      $this->db->where('id', $this->session->userdata('id'));

      $res = $this->db->get();

      if($res->num_rows() > 0):
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

  public function registrar($nick, $pass, $email, $fecha_nac){
    $this->db->insert('usuarios', ['nick'      => $nick, 
                                   'pass'      => $pass,
                                   'email'     => $email,
                                   'fecha_nac' => $fecha_nac]);
  }

  public function seguir_usuario($nick){
    if(!$this->Usuario->is_logged()) redirect('inicio');

    $actual_id = $this->session->userdata('id');
    $usuario = new Usuario($nick);

    if($usuario === FALSE):
      return FALSE;
    else:
      $this->db->insert('seguidores', ['usuarios_id' => $actual_id,
                                       'seguidos_id' => $usuario->id]);
    endif;
  }

  public function es_seguidor($nick){
    if(!$this->existe_nick($nick)) return FALSE;


    if($this->Usuario->is_logged()):
      $seguido = $this->user_by_nick($nick);
      
      $res = $this->db->get_where(
                          'seguidores', 
                          ['usuarios_id' => $this->session->userdata('id'),
                           'seguidos_id' => $seguido['id']]
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

  public function get_seguidores($user_id){
    if(!$this->Usuario->existe($user_id)) redirect('inicio');

    $seguidos = $this->db->get_where('seguidores', ['usuarios_id' => $user_id])
                         ->result_array();

    $usuarios = [];

    foreach ($seguidos as $seguido):
      $usuarios[] = $this->db
                      ->get_where('usuarios', ['id' => $seguido['seguidos_id']])
                      ->row_array();
    endforeach;
    
    return $usuarios;
  }

  public function contar_notificaciones(){
    if(!$this->Usuario->is_logged()) return FALSE;

    $this->db->select('count(*)');
    $this->db->from('notificaciones');
    $this->db->where('usuarios_id', $this->session->userdata('id'));
    $this->db->where('vista', 'f');
    $res = $this->db->get()->row_array();

    if($res['count'] > 0):
      return $res['count'];
    else:
      return FALSE;
    endif;
  }

  public function get_notificaciones(){
    if(!$this->Usuario->is_logged()) return FALSE;

    $user_id = $this->session->userdata('id');
    $res = $this->db->get_where('notificaciones', ['usuarios_id' => $user_id]);

    if($res->num_rows() > 0):
      return $res->result_array();
    else:
      return FALSE;
    endif;
  }

  public function get_like($user_like){
    $this->db->from('usuarios');
    $this->db->like('nick', $user_like);
    $this->db->where_not_in('nom_rol', 'admin');

    $res = $this->db->get();

    return $res->result_array();
  }

  public function get_all(){
    if(!$this->Usuario->is_admin()) return FALSE;
    
    $this->db->from('usuarios');
    $this->db->where_not_in('nom_rol', 'admin');
    $res = $this->db->get();

    return $res->result_array();
  }

  public function borrar_seguidores($nick){
    $user = new Usuario($nick);

    $this->db->where('usuarios_id', $user->id);
    $this->db->or_where('seguidos_id', $user->id);
    $this->db->delete('seguidores');
  }

  public function borrar($nick){
    if(!$this->Usuario->is_admin() || !$this->Usuario->is_self($nick)):
      if(!$this->Usuario->existe_nick($nick)) redirect('admin/usuarios');

      $user = new Usuario($nick);

      $this->borrar_seguidores($nick);


      //$this->db->where('seguidos_id', $user->id);
      $this->db->where('usuarios_id', $user->id);
      $this->db->delete('notificaciones'); 

      return $this->db->delete('usuarios', ['nick' => $nick]);
    else:
     redirect('inicio');
    endif;
  }

  public function is_self($nick){
    if(!$this->Usuario->is_logged()) return FALSE;
    if(!$this->Usuario->existe_nick($nick)) return FALSE;
    if($this->session->userdata('nick') == $nick) return TRUE;
  }

  public function update($data, $user_id){
    $this->db->where('id', $user_id);
    $this->db->update('usuarios', $data);
  }
}