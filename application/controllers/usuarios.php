<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios extends CI_Controller {

  public function login(){
    $reglas = array(
                array(
                  'field' => 'nick',
                  'label' => 'Nick',
                  'rules' => 'trim|required|max_length[20]'
                ),
                array(
                  'field' => 'pass',
                  'label' => 'Pass',
                  'rules' => 'trim|required'
                )
              );

    $this->form_validation->set_rules($reglas);

    if($this->form_validation->run()){
      if($this->input->post('login')){
        $nick = $this->input->post('nick');
        $pass = $this->input->post('pass');

        $this->loguear($nick, $pass);
      }
    }else{
      $this->load->view('login');
    }
  }

  public function loguear($nick, $pass){
    $res = $this->db->query('select *
                               from usuarios
                              where nick = ? and pass = md5(?)',
                            [$nick, $pass]);
    
    if($res->num_rows() > 0){
      $usuario = new Usuario($nick);

      $id = $usuario->id;
      $this->session->set_userdata('nick', $nick);
      $this->session->set_userdata('usuario', $usuario);
      $this->session->set_userdata('id', $id);
      redirect('inicio');
    }else{
      $data['errores'][] = 'El usuario no existe';
      $this->load->view('login', $data);
    }
  }

  public function logout(){
    $this->session->sess_destroy();
    redirect('inicio');
  }

  public function perfil($nick){
    $usuario = new Usuario($nick);
    
    $head['titulo'] = $usuario->nick;
    $data['nick']   = $usuario->nick;

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header');
    $this->load->view('usuario/usuario', $data);
    $this->load->view('comunes/recursos');
  }
}