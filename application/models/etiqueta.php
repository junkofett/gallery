<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Etiqueta extends CI_Model{
  public function get_hashtags(){
    return $this->db->get('etiquetas')->result_array();
  }

  public function preg_split_hashs($cadena){
    $expr     = "/(#\w{1,24})\b/";
    $division = preg_split($expr, $cadena, null, PREG_SPLIT_DELIM_CAPTURE);

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

  public function existe($hash){
    $res = $this->db->get_where('etiquetas', ['id' => $hash]);

    if($res->num_rows() > 0)
      return TRUE;
    else
      return FALSE;
  }

  private function add_hashtag($nombre){
    $this->db->insert('etiquetas', ['nombre_et' => $nombre]);
    //devuelve id del ultimo inserto en la db
    return $this->db->insert_id();
  }

  public function get_etiqueta_nombre($nombre){
    $et = $this->db->get_where('etiquetas', ['nombre_et' => $nombre]);

    if($et->num_rows() > 0):
      return $et->row_array();
    else:
      return FALSE;
    endif;
  }

  public function by_id($hash_id){
    $et = $this->db->get_where('etiquetas', ['id' => $hash_id]);

    if($et->num_rows() > 0):
      return $et->row_array();
    else:
      return FALSE;
    endif;
  }
}