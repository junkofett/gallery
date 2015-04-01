<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Registro extends CI_Controller {

  public function index(){
    $this->load->view('registro');
  }

  public function registrar(){
    if($this->input->post('registrarse')):
      $reglas = array(
                  array(
                    'field' => 'nick',
                    'label' => 'Nick',
                    'rules' => 'trim|required|max_length[20]|is_unique[usuarios.nick]'
                  ),
                  array(
                    'field' => 'pass',
                    'label' => 'Pass',
                    'rules' => 'trim|required|matches[passconf]'
                  ),
                  array(
                    'field' => 'passconf',
                    'label' => 'Confirma Pass',
                    'rules' => 'trim|required'
                  )
                );

      $nick = $this->input->post('nick');
      $pass = $this->input->post('pass');

      $this->form_validation->set_rules($reglas);

      if($this->form_validation->run()):
        $res = $this->db->query('insert into usuarios (nick, pass)
                                 values (?, md5(?))', [$nick, $pass]);

        $this->session->set_userdata('usuario', new Usuario($nick));
        $this->session->set_userdata('nick', $nick);
        redirect('inicio');
      else:
        $this->load->view('registro');
      endif;
    endif;
  }
}