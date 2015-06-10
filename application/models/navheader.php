<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Navheader extends CI_Model{

  public function get_header(){
     if(!$this->session->userdata('nick')):
      $header['menu_opt'] = $this->load->view('forms/login', [], TRUE);
    else:
      $header['menu_opt'] = FALSE; 

      $num_noti = $this->Usuario->contar_notificaciones(
                                    $this->session->userdata('id')
                                  );
      if($num_noti !== FALSE):
        $header['cont_noti'] = $num_noti;
        $header['notificaciones'] = $this->Usuario->get_notificaciones();
      endif;
    endif;

    return $header;
  }

}