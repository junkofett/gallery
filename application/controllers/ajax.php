<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajax extends CI_Controller {
  public function lista_categorias($id){
    $categorias = $this->obtener_categorias($id);

    $lista = '<ul>';

    foreach ($categorias as $categoria) {
      if($categoria['id'] != '0'):
        $lista .= "<li class='categoria' role='menuitem'>
                    <input type='hidden' value='".$categoria['id']."' />".
                            $categoria['nombre_cat'].'</li>';
      endif;
    }

    $lista .= '</ul>';

    echo $lista;
  }

  public function obtener_categorias($id){
    $res = $this->db->query('select * from categorias where padre_id = ?', [$id])
                    ->result_array();
    return (count($res) != 0) ? $res : FALSE;
  }
}