<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajax extends CI_Controller {

  public function imgs_por_cat($id){
    $stmt       = "select nombre_cat, id from categorias where id = ?";
    $primer     = $this->db->query($stmt, [$id])->row_array();

    $arbol = $this->Imagen->arbol($id);
    array_unshift($arbol, [$primer['nombre_cat'] => $primer['id'] ]);

    $unnested = $this->Imagen->unnest($arbol, []);

    $where = 'where ';

    foreach ($unnested as $cat_id) {
      $where .= ($where != 'where ') ? ' OR ' : '';
      $where .= 'categorias_id = '.$cat_id.' ';
    }

    echo json_encode($unnested);
  }
}