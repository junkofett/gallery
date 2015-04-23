<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends CI_Controller {

  public $tabla;

  public function index(){
    $res = $this->db->query("select *
                               from imagenes i join usuarios u on (i.usuarios_id = u.id)
                              where nsfw = 'f'
                               order by fecha_subida
                               limit 20");

    $imagenes = $res->result_array();
    $this->tabla = $this->db->query('select * from categorias')->result_array();
    $categorias = $this->arbol(NULL);
    $lista_cat = '<ul class="side-nav">' . $this->listar_categorias($categorias) . '</ul>';

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
        $lista .= '<li class="categoria" value="'.$value.'" role="menuitem">'.$key.'</li>';
      endif;
    endforeach;

    return $lista;
  }

  public function arbol($padre_id){
    $res = array_filter($this->tabla, function ($e) use ($padre_id){
      return $e['padre_id'] == $padre_id;
    });

    if (count($res) == 0) return [];
    $arbol = [];

    foreach ($res as $hijo){
      $arbol[$hijo['nombre_cat']] = $hijo['id'];
      $hijos   = $this->arbol($hijo['id']);
      if ($hijos != []) $arbol[] = $hijos;
    }

    return $arbol;
  } 
}