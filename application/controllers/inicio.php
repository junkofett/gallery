<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends CI_Controller {

  public function index(){
    $this->db->from('usuarios u');
    $this->db->join('imagenes i', 'i.usuarios_id = u.id');
    $this->db->where('nsfw', 'f', 20, 0);
    $this->db->order_by('fecha_subida', 'desc');
    $res = $this->db->get();
    
    $imgsnorate = $res->result_array();
    $imagenes   = [];

    foreach ($imgsnorate as $img):
      $imagenes[] = $this->Imagen->add_rate($img);
    endforeach;

    $categorias = $this->Imagen->arbol(NULL);
    $lista_cat  = $this->listar_categorias($categorias);

    $head['titulo']      = 'gallery';
    $galeria['imagenes'] = $imagenes;
    $data['categorias']  = $lista_cat;
    $data['contents']    = $this->load->view('galeria', $galeria, TRUE);

    if(!$this->session->userdata('nick')):
      $header['menu_opt'] = $this->load->view('forms/login', [], TRUE);
    else:
      $header['menu_opt'] = FALSE; 
    endif;

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $header);
    $this->load->view('comunes/home', $data);
    $this->load->view('comunes/recursos');
  }

  public function listar_categorias($categorias){
    $lista = '';

    foreach ($categorias as $categoria):
      $lista .= '<li class="menu-cat">
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