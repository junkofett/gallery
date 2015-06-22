<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Imagenes extends CI_Controller {
  public function imagen($id){
    //comprobar imagen existe

    $data['imagen']      = $this->Imagen->img_por_id($id);
    $data['rate']        = $this->Imagen->get_rate($id);
    $data['formcom']     = $this->load->view('forms/comentario',
                                            ['img_id' => $id], TRUE);
    $com['comentarios']  = $this->Imagen->get_comentarios($id);

    if($com['comentarios'] !== FALSE):
      $data['comentarios'] = $this->load->view('comentarios', $com, TRUE);
    endif;

    $data['fav']      = $this->Imagen->comprobar_fav($id);
    $data['hashtags'] = $this->Imagen->add_hashtags($data['imagen'])['hashtags']; 

    $head['titulo']     = $data['imagen']['titulo'];

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('imagen', $data);
    $this->load->view('comunes/recursos');
  }

  public function favoritos($user_id = NULL){
    if($user_id === NULL):
      if(!$this->Usuario->is_logged()) redirect('inicio');

      $user_id   = $this->session->userdata('id');
      $user_nick = $this->session->userdata('nick');
    else:
      if(!$this->Usuario->existe($user_id)) redirect('inicio');

      $user      = $this->Usuario->user_by_id($user_id);
      $user_id   = $user['id'];
      $user_nick = $user['nick'];
    endif;

    $galeria['imagenes'] = $this->Imagen->get_galeria(NULL, NULL, NULL, $user_id);

    $head['titulo']   = 'favoritos - '.$user_nick;
    $data['favs']     = TRUE;
    $data['favsnick'] = $user_nick;
    $data['contents'] = $this->load->view('galeria', $galeria, TRUE);


    //var_dump($galeria['imagenes']); die();

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('comunes/home', $data);
    $this->load->view('comunes/recursos');
  }

  public function hashtag($nombre_et){
    if(($et = $this->Etiqueta->get_etiqueta_nombre($nombre_et)) === FALSE):
      redirect('inicio') ;
    endif;

    $imgs['imagenes'] = $this->Imagen->get_galeria(NULL, NULL, $et);

    $data['contents']    = $this->load->view('galeria', $imgs, TRUE);
    $data['hashtag_nom'] = '#'.$et['nombre_et'];
    $data['hashtag_id']  = $et['id'];
    $head['titulo']      = '#'.$et['nombre_et'].' - gallery';

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('comunes/home', $data);
    $this->load->view('comunes/recursos');
  }

  public function puntuar(){
    if(!$this->Usuario->is_logged()) return FALSE;

    $img_id     = $this->input->post('img_id');
    $puntuacion = $this->input->post('puntuacion');

    $this->Imagen->guardar_puntuacion($img_id, $puntuacion);

    return $this->Imagen->get_rate($img_id);
  }

  public function comentar(){
    if(!$this->Usuario->is_logged()) redirect('inicio');

    $img_id = $this->input->post('img_id');
    $texto  = $this->input->post('texto');

    $comentario = $this->Imagen->insertar_comentario($img_id, $texto);
    
    $this->Notificacion->notificar_comentario($comentario);
    $this->load->view('comentarios', ['comentarios' => [$comentario]]);
  }

  public function upload(){
    if(!$this->Usuario->is_logged()) redirect('inicio');

    $categorias = $this->Imagen->arbol(NULL);
    $data['categorias'] = '<ul id="radio-cats">'.
                            $this->Imagen->radio_categorias($categorias) . 
                          '</ul>';
    $data['error']  = ' ';
    $head['titulo'] = 'Subir Imagen';

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header');
    $this->load->view('forms/uploadimg', $data);
    $this->load->view('comunes/recursos');
  }

  public function do_upload(){
    $nick = $this->session->userdata('nick');
    $userfolder = 'uploads/'.$nick;

    if (!is_dir($userfolder)):
      mkdir('./'.$userfolder, 0777, TRUE);
    endif;

    $descripcion = $this->input->post('descripcion');
    $titulo      = $this->input->post('titulo');
    $categoria   = $this->input->post('categoria');
    $nsfw        = ($this->input->post('nsfw') != NULL) ? 't' : 'f';
    $userid      = $this->input->post('id');

    if ($this->input->post('etiquetas') != NULL):
      $etiquetas = $this->input->post('etiquetas');
    endif;

    $md5 = md5(rand() . $nick . $titulo . time());
    
    $nombreimg = $nick .'-'. 
                  strtolower(
                    str_replace(' ', '',$titulo)
                  ) .
                substr($md5, 0, 4) . substr($md5, count($md5) * (-4), 4);
    $config['upload_path']   = './'.$userfolder;
    $config['allowed_types'] = 'gif|jpg|png';
    $config['file_name']     = $nombreimg;
    $config['max_size']      = '100000';

    $this->load->library('upload', $config);

    if ( ! $this->upload->do_upload('imagen')):
      $error = array('error' => $this->upload->display_errors());

      $this->load->view('upload_form', $error);
    else:
      $ext = $this->upload->data()['file_ext'];

      $configcopy['source_image'] = './'.$userfolder.'/'.$nombreimg;
      $configcopy['new_image']    = './'.$userfolder.'/'.$nombreimg.$ext;
      $configcopy['quality']      = '100%';
      
      $this->load->library('image_lib', $configcopy);
      $this->image_lib->resize();

      $insert = array(
         'img_url'         => $userfolder.'/'.$nombreimg.$ext,
         'thumb_url'       => $userfolder.'/'.$nombreimg.'_thumb'.$ext,
         'titulo'          => $titulo,
         'categorias_id'   => $categoria,
         'usuarios_id'     => $userid,
         'descripcion_img' => $descripcion,
         'nsfw'            => $nsfw
      );

      if(isset($etiquetas)):
        $insert['etiquetas'] = $etiquetas;
      endif;

      $this->Imagen->anadir_imagen($insert);

      $configthumb['image_library']  = 'gd2';
      $configthumb['source_image']   = './'.$userfolder.'/'.$nombreimg.$ext;
      $configthumb['create_thumb']   = TRUE;
      $configthumb['maintain_ratio'] = TRUE;
      $configthumb['width']          = 400;
      $configthumb['height']         = 400;

      $this->image_lib->initialize($configthumb);
      $this->image_lib->resize();

      $data = array('upload_data' => $this->upload->data());
      redirect('imagenes/upload');
    endif;
  }

  public function editar($id){
    //COMPROBAR QUE IMAGEN EXISTE
    if($this->Usuario->is_owner($id) || $this->Usuario->is_admin()):
      $categorias = $this->Imagen->arbol(NULL);

      $img = $this->Imagen->img_por_id($id);
      $img['hashtags'] = $this->Imagen->get_hashtags($id);

      $radio_cat = '<ul id="radio-cats">'. $this->Imagen->radio_categorias($categorias, $img['categorias_id'])  . '</ul>';

      $head['titulo']    = 'Editar imagen - '. $img['titulo'];

      $data['imagen']    = $img;
      $data['radio_cat'] = $radio_cat;

      if(!$this->input->post('aplicar')):
        $this->load->view('comunes/head', $head);
        $this->load->view('comunes/header', $this->Navheader->get_header());
        $this->load->view('admin/editar_imagen', $data);
        $this->load->view('comunes/recursos');
      else:
        $reglas = array(
          array(
            'field' => 'descripcion_img',
            'label' => 'Descripcion',
            'rules' => 'trim'
          ),
          array(
            'field' => 'titulo',
            'label' => 'Titulo',
            'rules' => 'trim|required'
          )
        );

        $data = [];

        if($this->input->post('descripcion_img') && $this->input->post('descripcion_img') != $img['descripcion_img'])
          $data['descripcion_img'] = $this->input->post('descripcion_img');

        if($this->input->post('titulo') && $this->input->post('titulo') != $img['titulo'])
          $data['titulo'] = $this->input->post('titulo');

        if($this->input->post('categoria') && $this->input->post('categoria') != $img['categorias_id'])
          $data['categorias_id'] = $this->input->post('categoria');

        if($this->input->post('nuevas_ets')):
          $this->Imagen->anadir_y_relacionar_hash($this->input->post('nuevas_ets'), $img['id']);
        endif;

        if(empty($data)):
          redirect('imagenes/editar/'.$img['id']);
        else:
          if($this->Imagen->update($data, $img['id']))
            redirect('imagenes/imagen/'.$img['id']);
          else
            $this->error('No pudo actualizarse la imagen');
        endif;

      endif;
    else:
      $this->error('No tiene permisos para editar esta imagen');
    endif;
  }

  public function borrar($id){
    //COMPROBAR QUE IMAGEN EXISTE
    if($this->Usuario->is_owner($id) || $this->Usuario->is_admin()):
      $imagen = $this->Imagen->img_por_id($id);

      $head['titulo'] = 'Borrar imagen - '. $imagen['titulo'];
      $data['imagen'] = $imagen;

      $this->load->view('comunes/head', $head);
      $this->load->view('comunes/header', $this->Navheader->get_header());
      $this->load->view('admin/borrar_imagen', $data);
      $this->load->view('comunes/recursos');
    else:
      $this->error('No tiene permisos para borrar esta imagen');
    endif;
  }

  public function conf_borrar($img_id){
    //COMPROBAR QUE IMAGEN EXISTE
    if($this->Usuario->is_owner($img_id) || $this->Usuario->is_admin()):
      $user = $this->Usuario->user_by_img($img_id);

      if($this->Imagen->borrar($img_id)):
        redirect('usuarios/perfil/'. $user['nick']);
      else:
        $this->error('No pudo borrarse la imagen');
      endif;
    endif;
  }

  private function error($mensaje){

    $head['titulo'] = 'Error';
    $data['mensaje']  = $mensaje;

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('admin/error', $data);
    $this->load->view('comunes/recursos');
  }
}