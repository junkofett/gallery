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
      redirect('inicio');
    }
  }

  public function loguear($nick, $pass){
    $this->db->from('usuarios');
    $this->db->where('nick', $nick);
    $this->db->where('pass', md5($pass));
    $res = $this->db->get();

    if($res->num_rows() > 0){
      $usuario = new Usuario($nick);
      
      $this->session->set_userdata('nick', $nick);
      $this->session->set_userdata('id', $usuario->id);
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

  public function registro(){
    $this->load->view('forms/registro');
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
        $this->Usuario->registrar($nick, md5($pass));
        
        $usuario = new Usuario($nick);

        $this->session->set_userdata('nick', $nick);
        $this->session->set_userdata('id', $usuario->id);
        redirect('inicio');
      else:
        $this->load->view('registro');
      endif;
    endif;
  }

  public function perfil($nick){
    $usuario    = new Usuario($nick);
    $imgsnorate = $this->Imagen->imgs_by_user($usuario->id);

    $imagenes = [];

    foreach ($imgsnorate as $img):
      $imagenes[] = $this->Imagen->add_rate($img);
    endforeach;

    $imgs['imagenes'] = $imagenes;
    $head['titulo']   = $usuario->nick;

    $data['usuario_seguido'] = $this->Usuario->es_seguidor($nick);
    $data['nick']            = $usuario->nick;
    $data['user_id']         = $usuario->id;  
    $data['descripcion_usr'] = $usuario->descripcion_usr;
    $data['email']           = $usuario->email;
    $data['fecha_nac']       = $usuario->fecha_nac;
    $data['imagenes']        = $this->load->view('galeria', $imgs, TRUE);

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('usuario/usuario', $data);
    $this->load->view('comunes/recursos');
  }
}