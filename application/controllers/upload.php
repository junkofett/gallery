<?php

class Upload extends CI_Controller {

  function __construct()
  {
    parent::__construct();
    $this->load->helper(array('form', 'url'));
  }

  function index()
  {
    $data['categorias'] = $this->Imagen->categorias;
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
    
    $nombreimg = $nick . md5($nick . $titulo . time());

    $config['upload_path']   = './'.$userfolder;
    $config['allowed_types'] = 'gif|jpg|png';
    $config['file_name']     = $nombreimg;
    $config['max_size']      = '100000';

    $this->load->library('upload', $config);
    $imagen = 'imagen';

    if ( ! $this->upload->do_upload($imagen))
    {
      $error = array('error' => $this->upload->display_errors());

      $this->load->view('upload_form', $error);
    }
    else
    {
      $insert = array(
         'img_url'         => $userfolder.'/'.$nombreimg,
         'titulo'          => $titulo,
         'categorias_id'   => $categoria,
         'usuarios_id'     => $userid,
         'descripcion_img' => $descripcion,
         'nsfw'            => $nsfw
      );

      $this->Imagen->anadir_imagen($insert); 
      
      $data = array('upload_data' => $this->upload->data());

      $this->load->view('home', $data);
    }
  }
}