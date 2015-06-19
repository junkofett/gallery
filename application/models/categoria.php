<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Categoria extends CI_Model{

  public function anadir($nombre, $padre){
    $this->db->insert('categorias', ['nombre_cat' => $nombre,
                                     'padre_id'   => $padre]);
  }

  public function borrar($cat_id){
    if(!$this->existe($cat_id)) return FALSE;

    $res = $this->db->get_where('imagenes', ['categorias_id' => $cat_id]);

    if($res->num_rows() > 0):
      $padre = $this->db->get_where('categorias', ['id' => $cat_id])
                        ->row_array()['padre_id'];

      $this->db->where('categorias_id', $cat_id);
      $this->db->update('imagenes', ['categorias_id' => $padre]);
    endif;

    $this->db->where('id', $cat_id);
    $this->db->delete('categorias');
  }

  public function existe($cat_id){
    $res = $this->db->get_where('categorias', ['id' => $cat_id]);

    if($res->num_rows() > 0)
      return TRUE;
    else
      return FALSE;
  }

  public function tiene_hijos($cat_id){
    $res = $this->db->get_where('categorias', ['padre_id' => $cat_id]);

    if($res->num_rows() > 0)
      return TRUE;
    else
      return FALSE;
  }

  public function get_by_id($cat_id){
    return $this->db->get_where('categorias', ['id' => $cat_id])
                    ->row_array();
  }
}