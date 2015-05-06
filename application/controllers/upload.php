<?php

class Upload extends CI_Controller {

  function __construct()
  {
    parent::__construct();
    $this->load->helper(array('form', 'url'));
  }

  function index()
  {
    $categorias = $this->Imagen->arbol(NULL);
    $data['categorias'] = '<ul>'.
                            $this->Imagen->radio_categorias($categorias) . 
                          '</ul>';
    $data['error'] = ' ';
    $this->load->view('forms/uploadimg', $data);
  }

  function do_upload()
  {
    $nick = $this->session->userdata('nick');
    $userfolder = 'uploads/'.$nick;

    if (!is_dir($userfolder)) {
      mkdir('./'.$userfolder, 0777, TRUE);
    }

    $descripcion = $this->input->post('descripcion');
    $titulo      = $this->input->post('titulo');
    $categoria   = $this->input->post('categoria');
    $nsfw        = ($this->input->post('nsfw') != NULL) ? 't' : 'f';
    $userid      = $this->input->post('id');

    if (isset($this->input->post('etiquetas'))):
      $etiquetas = $this->input->post('etiquetas')
    endif;

    $md5 = md5($nick . $titulo . time());

    $nombreimg = $nick .'-'. $titulo . substr($md5, 0, 6) . substr($md5, -0, 6);

    $config['upload_path']   = './'.$userfolder;
    $config['allowed_types'] = 'gif|jpg|png';
    $config['file_name']     = $nombreimg;
    $config['max_size']      = '100000';

    $this->load->library('upload', $config);

    if ( ! $this->upload->do_upload('imagen'))
    {
      $error = array('error' => $this->upload->display_errors());

      $this->load->view('upload_form', $error);
    }
    else
    {
      $ext = $this->upload->data()['file_ext'];

      $configcopy['source_image'] = './'.$userfolder.'/'.$nombreimg;
      $configcopy['new_image']    = './'.$userfolder.'/'.$nombreimg.$ext;
      $configcopy['quality']      = '100%';
      
      $this->load->library('image_lib', $configcopy);
      $this->image_lib->resize();

      $insert = array(
         'img_url'         => $userfolder.'/'.$nombreimg.$ext,
         'thumb_url'       => $userfolder.'/'.$nombreimg.'_thumb'.$ext
         'titulo'          => $titulo
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
      $this->load->view('home', $data);
    }
  }
}