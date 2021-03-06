<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajax extends CI_Controller {

  public function imgs_por_cat($id){
    if(!$this->input->is_ajax_request()) return;
    $id = ($id == '0') ? NULL : $id;

    $primer = $this->db->get_where('categorias', ['id' => $id])->row_array();
    $arbol  = $this->Imagen->arbol($id);

    if($id != NULL):
      array_unshift($arbol, ['id'         => $primer['id'],
                             'nombre_cat' => $primer['nombre_cat'],
                             'padre_id'   => $primer['padre_id'] ]);
    endif;

    $unnested = $this->Imagen->unnest($arbol, []);

    $data['imagenes'] = $this->Imagen->get_galeria(NULL, $unnested);

    $this->load->view('galeria', $data);
  }

  public function imgs_by_user($nick){
    if(!$this->input->is_ajax_request()) return;
    $usuario = new Usuario($nick);
    
    $data['imagenes'] = $this->Imagen->get_galeria($usuario->id);
    $data['nick']     = $usuario->nick;

    $this->load->view('galeria', $data);
  }

  public function favs_by_user($nick){
    if(!$this->input->is_ajax_request()) return;
    $usuario = new Usuario($nick);

    $data['imagenes'] = $this->Imagen->get_galeria(NULL, NULL, NULL, $usuario->id);
    $data['nick']     = $usuario->nick;
    
    $this->load->view('galeria', $data);
  }

  public function users_seguidos($nick){
    if(!$this->input->is_ajax_request()) return;
    $usuario = new Usuario($nick);

    $data['users'] = $this->Usuario->get_seguidores($usuario->id);

    $this->load->view('usuario/seguidos', $data);
  }

  public function get_cont_notif(){
    if(!$this->input->is_ajax_request()) return;

    echo $this->Usuario->contar_notificaciones();
  }

  public function get_parents($cat){
    $cats  = $this->Imagen->cat_parents($cat, ['0']);

    echo json_encode($cats);
  }

  public function seguir_usuario($nick){
    if(!$this->input->is_ajax_request()) return;
    if(!$this->Usuario->is_logged()) return;

    $this->Usuario->seguir_usuario($nick);
    $this->Notificacion->notificar_seguidor($nick);
  }

  public function is_logged(){
    if(!$this->input->is_ajax_request()) return;
    echo (string)$this->Usuario->is_logged();
  }

  public function add_fav(){
    $img_id = $this->input->post('img_id');

    if($this->Imagen->comprobar_fav($img_id)):
      return FALSE;
    else:
      $this->Imagen->add_fav($img_id);
    endif;
  }

  public function borrar_hash(){
    $hash = $this->input->post('hash_id');
    $img  = $this->input->post('img_id');

    if(($this->Usuario->is_owner($img) || $this->Usuario->is_admin()) && $this->Etiqueta->existe($hash)):
      $this->Imagen->borrar_hash($hash, $img);
    else:
      return FALSE;
    endif;
  }

  public function borrar_notif(){
    $notif_id = $this->input->post('notif_id');
    
    $this->Notificacion->ver_notif($notif_id);
  }

  public function scroll_load(){
    $offset     = $this->input->post('offset');
    $cat_id     = $this->input->post('cat_id');
    $user_fav   = $this->input->post('favs_nick');
    $hashtag_id = $this->input->post('hashtag_id');
    $user_perf  = $this->input->post('user_perf');

    if($cat_id != 0):
      $primer = $this->db->get_where('categorias', ['id' => $cat_id])->row_array();
      $arbol  = $this->Imagen->arbol($cat_id);

      if($cat_id != '0'):
        array_unshift($arbol, ['id'         => $primer['id'],
                               'nombre_cat' => $primer['nombre_cat'],
                               'padre_id'   => $primer['padre_id'] ]);
      endif;

      $unnested = $this->Imagen->unnest($arbol, []);
    else:
      $unnested = NULL;
    endif;

    if($user_fav != ''):
      $user_fav = $this->Usuario->user_by_nick($user_fav)['id'];
    else:
      $user_fav = NULL;
    endif;

    if($hashtag_id != ''):
      $etiqueta = $this->Etiqueta->by_id($hashtag_id);
    else:
      $etiqueta = NULL;
    endif;

    if($user_perf == ''):
      $user_perf = NULL;
    else:
      $user_perf = $this->Usuario->user_by_nick($user_perf)['id'];
    endif;

    /*echo $user_fav.' user fav<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';
    echo $user_perf.' user perf<<<<<<<<<<<<<<<';
    echo $etiqueta.' etiqueta<<<<<<<<'; 
    echo $unnested. ' unnested<<<<<<<<<<<<<<<<<<';
    echo $offset.' offsettttt<<<<<<<<<<<<<<<<<<<<';
    echo $cat_id.' catiddddddd<<<<<<<<<<<<<<<<<'; die();*/

    $imgs['imagenes'] = $this->Imagen->get_galeria($user_perf, $unnested, 
                                                   $etiqueta, $user_fav, 
                                                   $offset);

    $this->load->view('galeria', $imgs);
  }
}