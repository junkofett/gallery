<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Escapar extends CI_Controller {

  public function index(){
    $res = $this->db->query('select * from usuarios');

    $usuarios = $res->result_array();

    foreach ($usuarios as $usuario) {
      $id = $usuario['id'];
      $descripcion = $this->db->escape($usuario['descripcion_usr']);
      //$sql = "INSERT INTO table (title) VALUES(".$this->db->escape($title).")";
      echo '<pre>';
        var_dump($usuario['descripcion_usr']);
      echo '</pre>';
      echo '<pre>';
        var_dump($descripcion);
      echo '</pre>';
      $res = $this->db->query('update usuarios
                                  set descripcion_usr = ? 
                                where id = ?', [$descripcion, $id]);

    }

    $res = $this->db->query('select * from imagenes');

    $imagenes = $res->result_array();

    foreach ($imagenes as $imagen) {
      $id = $imagen['id'];
      $descripcion = $this->db->escape($imagen['descripcion_img']);

      echo '<pre>';
        var_dump($imagen['descripcion_img']);
      echo '</pre>';
      echo '<pre>';
        var_dump($descripcion);
      echo '</pre>';

      $res = $this->db->query('update imagenes
                                  set descripcion_img = ?
                                where id = ?', [$descripcion, $id]);
    }
  }

}