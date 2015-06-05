<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Notificacion extends CI_Model{

  public function nueva_notificacion($user_id, $evento){
    //COMPROBAR QUE USUARIO EXISTE
    $enlace = '';
    
    switch ($evento) {
      case 'COMENTARIO':
        $enlace = '/imagenes/imagen/';
        break;
      case 'SEGUIDOR':
        $enlace = '/usuarios/perfil/';
        break;
    }
  }
}