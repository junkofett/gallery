<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends CI_Controller {

  public function index(){
    $res = $this->db->query("select *
                               from imagenes i join usuarios u on (i.usuarios_id = u.id)
                              where nsfw = 'f'
                           order by fecha_subida
                              limit 20");

    $imagenes   = $res->result_array();
    $categorias = $this->Imagen->arbol(NULL);
    $lista_cat  = $this->listar_categorias($categorias);

    $data['titulo']     = 'Inicio';
    $data['imagenes']   = $imagenes;
    $data['categorias'] = $lista_cat;

    $this->template->load('plantillas/comun', 'home', $data);
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