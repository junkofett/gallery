<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Etiqueta extends CI_Model{
  public function get_hashtags(){
    return $this->db->get('etiquetas')->result_array();
  }

  public function preg_split_hashs($cadena){
    $expr     = "/(#\w{1,24})\b/";
    $division = preg_split($expr, $mensaje, null, PREG_SPLIT_DELIM_CAPTURE);

    return preg_grep($expr, $division);
  }

  public function check_and_add_hashtag($nombre){
    $res = $this->db->get_where('etiquetas', ['nombre_et' => $nombre]);

    if ($res->num_rows() == 0):
      return $this->add_hashtag($nombre);
    else:
      return $res->row_array()['id'];
    endif;
  }

  private function add_hashtag($nombre){
    $this->db->insert('etiquetas', ['nombre_et' => $nombre]);
    //devuelve id del ultimo inserto en la db
    return $this->db->insert_id();
  }
}