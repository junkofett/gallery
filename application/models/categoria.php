<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Categoria extends CI_Model{

  public function __construct(){
    parent::__construct();
    $this->categorias = $this->db->get('categorias')
                                 ->result_array();
  }
}