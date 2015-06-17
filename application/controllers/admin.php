<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller {
  public function is_admin(){
    return $this->Usuario->is_admin();
  }

  public function usuarios(){
    if(!$this->input->post('busca_usuario')):
      $users = $this->Usuario->get_all();
    else:
      $users = $this->Usuario->get_like($this->input->post('user_like'));
    endif;

    $head['titulo'] = 'admin - usuarios';
    $data['users']  = $users;

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('admin/usuarios', $data);
    $this->load->view('comunes/recursos');
  }

  public function borrar_user($nick){
    if(!$this->Usuario->is_admin()) redirect('inicio');
    if(!$this->Usuario->existe_nick($nick)) redirect('inicio');
    
    $head['titulo']  = 'admin - borrar usuario';
    $data['usuario'] = $this->Usuario->user_by_nick($nick);

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('admin/borrar', $data);
    $this->load->view('comunes/recursos');
  }

  public function conf_borrar_usuario($nick){
    if(!$this->Usuario->is_admin()) redirect('inicio');
    if(!$this->Usuario->existe_nick($nick)) redirect('inicio');

    if($this->Usuario->borrar($nick)):
      redirect('admin/usuarios');
    else:
      redirect('inicio');//VISTA ERRORES!!!
    endif;
  }

}