<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Notificacion extends CI_Model{

  public function insertar_notificacion($usuario_notificado, $texto, $enlace){
    if(!$this->Usuario->existe($usuario_notificado)) redirect('inicio');

    $this->db->insert('notificaciones', ['usuarios_id' => $usuario_notificado,
                                         'texto'       => $texto,
                                         'notif_url'   => $enlace]);
  }

  public function get_notificaciones($usuario_id){
    if(!$this->Usuario->existe($usuario_id)) redirect('inicio');

    $this->db->from('notificaciones');
    $this->db->where('usuarios_id', $usuario_id);
    $this->db->where('vista', 'f');
    $this->db->order_by('fecha_notif', 'desc');

    $notificaciones = $this->db->get();

    if($notificacions->num_rows() > 0):
      return $notificaciones->result_array();
    else:
      return FALSE;
    endif;
  }

  //notifica al propietario de la imagen
  public function notificar_comentario($comentario){
    $imagen = $this->Imagen->img_por_id($comentario['imagenes_id']);

    $usr_disp = $this->Usuario->user_by_id($comentario['usuarios_id']);
    $usr_noti = $this->Usuario->user_by_id($imagen['usuarios_id']);

    $mensaje = 'El usuario '.$usr_disp['nick'].' ha comentado tu imagen '
               .$imagen['titulo'];

    $enlace = '/imagenes/imagen/'.$imagen['id'];

    $this->insertar_notificacion($usr_noti['id'], $mensaje, $enlace);
  }

  //notifica al usuario seguido
  public function notificar_seguidor($nick){
    if(!$this->Usuario->is_logged()) return FALSE;

    $usuario_seguidor = $this->Usuario->user_by_nick($nick);
    
    $usr_disp = $this->Usuario->user_by_id($usuario_seguidor['id']);
    $usr_noti = $this->Usuario->user_by_id($this->session->userdata('id'));

    $mensaje = 'El usuario '.$usr_disp['nick'].' sigue tus publicaciones';
    $enlace  = '/usuarios/perfil/'.$usr_disp['nick'];

    $this->insertar_notificacion($usr_noti['id'], $mensaje, $enlace);
  }

  //notifica al usuario seguidor
  public function notificar_publicacion($img){
    if(!$this->Usuario->is_logged()) return FALSE;

    $usr = $this->session->userdata('id');
    $res = $this->db->get_where('seguidores', ['seguidos_id' => $usr])
                    ->result_array();

    if(count($res) == 0):
      return FALSE;
    else:
      $mensaje = 'El usuario '.$this->session->userdata('nick').
                 ' ha publicado '.$img['titulo'];
      $enlace  = '/imagenes/imagen/'.$img['id']; 
      foreach ($res as $user):
        $this->insertar_notificacion($user['usuarios_id'], $mensaje, $enlace);
      endforeach;
    endif;
  }

  public function get_ultima_notif(){
    if(!$this->Usuario->is_logged()) return FALSE;

    $usr = $this->session->userdata('id');

    $this->db->from('notificaciones');
    $this->db->where('usuarios_id', $usr);
    $this->db->where('vista', 'f', 1, 0);
    $this->db->order_by('fecha_notif', 'desc');

    $notif = $this->db->get();

    if($notif->num_rows() > 0):
      return $notif->row_array();
    else:
      return FALSE;
    endif;
  }
}