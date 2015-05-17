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
      $lista .= '<li class="categoria accordion-navigation">
                    <input type="hidden" value="'.$categoria['id'].'"/>
                    <a href="#panel'.$categoria['id'].$categoria['padre_id'].'">'
                      .$categoria['nombre_cat'].'</a>';
    

      $lista .= '<div id="panel'.$categoria['id'].$categoria['padre_id'].'" class="content';

      if($categoria['padre_id'] == NULL)
        $lista .= ' active">';
      else
        $lista .='">';

      if (isset($categoria['subcats'])):
        $lista .= '<ul class="accordion">';
        $lista .= $this->listar_categorias($categoria['subcats']);
        $lista .= '</ul>';
      endif;

      $lista .= '</div>';

      $lista .= '</li>';
    endforeach;

    return $lista;
  }
  
}