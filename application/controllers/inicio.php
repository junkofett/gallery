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
    $lista_cat  = '<ul class="side-nav">' . $this->listar_categorias($categorias) . '</ul>';

    $data['titulo']     = 'Inicio';
    $data['imagenes']   = $imagenes;
    $data['categorias'] = $lista_cat;

    $this->template->load('plantillas/comun', 'home', $data);
  }

  public function listar_categorias($categorias){
    $lista = '';

    foreach ($categorias as $key => $value):
      if (is_numeric($key)):
        $lista .= '<ul>';
        $lista .= $this->listar_categorias($value);
        $lista .= '</ul>';
      else:
        $lista .= '<li class="categoria" role="menuitem">
                    <input type="hidden" value="'.$value.'"/>'.$key.'</li>';
      endif;
    endforeach;

    return $lista;
  }

}