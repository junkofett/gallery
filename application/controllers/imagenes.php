<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Imagenes extends CI_Controller {
  public function editar($img_id){
    if(!$this->Usuario->is_owner($img_id)) redirect('inicio');
    
    $img        = $this->Imagen->img_por_id($img_id);
    $categorias = $this->Imagen->arbol(NULL);
    $radio_cat  = '<ul>'. $this->Imagen->radio_categorias($categorias)  . '</ul>';

    $data['img_url']         = $img['img_url'];
    $data['nsfw']            = $img['nsfw'];
    $data['descripcion_img'] = $img['descripcion_img'];
    $data['radio_cat']       = $radio_cat;

    $this->load->view('forms/editar', $data);
  }

  public function imagen($id){
    $data['imagen'] = $this->Imagen->img_por_id($id);
    $data['rate']   = $this->Imagen->get_rate($id);

    $head['titulo']      = $data['imagen']['titulo'];
    $header['menu_opt']  = $this->load->view('forms/login', [], TRUE);

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $header);
    $this->load->view('imagen', $data);
    $this->load->view('comunes/recursos');
  }

  public function puntuar($img_id, $puntuacion){
    if(!$this->Usuario->is_logged()) return FALSE;

    $this->Imagen->guardar_puntuacion($img_id, $puntuacion);

    return $this->Imagen->get_rate($img_id);
  }

  public function upload(){
    if(!$this->Usuario->is_logged()) redirect('inicio');

    $categorias = $this->Imagen->arbol(NULL);
    $data['categorias'] = '<ul>'.
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
}