<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Imagenes extends CI_Controller {
  public function editar($id){
    $img        = $this->Imagen->img_por_id($id);
    $categorias = $this->Imagen->arbol(NULL);
    $radio_cat  = '<ul>'. $this->Imagen->radio_categorias($categorias)  . '</ul>';

    $data['img_url']         = $img['img_url'];
    $data['nsfw']            = $img['nsfw'];
    $data['descripcion_img'] = $img['descripcion_img'];
    $data['radio_cat']       = $radio_cat;

    $this->load->view('forms/editar', $data);
  }
}