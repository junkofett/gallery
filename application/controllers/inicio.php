<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends CI_Controller {

  public function index(){
    $categorias = $this->Imagen->arbol(NULL);
    $lista_cat  = $this->listar_categorias($categorias);

    $head['titulo']      = 'gallery';
    $galeria['imagenes'] = $this->Imagen->get_galeria();
    $data['categorias']  = $lista_cat;
    $data['contents']    = $this->load->view('galeria', $galeria, TRUE);

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('comunes/home', $data);
    $this->load->view('comunes/recursos');
  }

  public function listar_categorias($categorias){
    $lista = '';

    foreach ($categorias as $categoria):
      $lista .= '<li class="menu-cat button">
                  <input type="hidden" value="'.$categoria['id'].'"/>
                  <div>'.$categoria['nombre_cat'].'</div>';

      if (isset($categoria['subcats'])):
        $lista .= '<ul class="cataccordion">';
        $lista .= $this->listar_categorias($categoria['subcats']);
        $lista .= '</ul>';
      endif;

      $lista .= '</li>';
    endforeach;

    return $lista;
  }
  
}