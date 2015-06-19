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
      $this->error('El usuario no existe');
    }
  }

  public function logout(){
    $this->session->sess_destroy();
    redirect('inicio');
  }

  public function registro(){
    $this->load->view('comunes/head', ['titulo' => 'Registro']);
    $this->load->view('forms/registro');
    $this->load->view('comunes/recursos');
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
                    'label' => 'Confirmar Pass',
                    'rules' => 'trim|required'
                  ),
                  array(
                    'field' => 'email',
                    'label' => 'e.mail',
                    'rules' => 'trim|required|is_unique[usuarios.email]|matches[confemail]'
                  ),
                  array(
                    'field' => 'confemail',
                    'label' => 'Confirmar e.mail',
                    'rules' => 'trim|required'
                  ),
                  array(
                    'field' => 'fecha_nac',
                    'label' => 'Fecha de Nacimiento',
                    'rules' => 'trim|required'
                  )
                );

      $nick      = $this->input->post('nick');
      $pass      = $this->input->post('pass');
      $email     = $this->input->post('email');
      $fecha_nac = $this->input->post('fecha_nac');

      $this->form_validation->set_rules($reglas);

      if($this->form_validation->run()):
        $this->Usuario->registrar($nick, md5($pass), $email, $fecha_nac);
        
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
    $usuario  = new Usuario($nick);
    $imagenes = $this->Imagen->get_galeria($usuario->id);

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

  public function editar($nick){
    if($this->Usuario->is_self($nick) || $this->Usuario->is_admin()):
      if($this->input->post('editar')):
        $reglas = array(
                  array(
                    'field' => 'descripcion_usr',
                    'label' => 'Descripcion',
                    'rules' => 'trim'
                  ),
                  array(
                    'field' => 'fecha_nac',
                    'label' => 'Fecha de Nacimiento',
                    'rules' => 'trim'
                  )
                );

        $this->form_validation->set_rules($reglas);

        if($this->form_validation->run()):
          $user = $this->Usuario->user_by_nick($nick);
          $data = [];

          if($this->input->post('descripcion_usr') != $user['descripcion_usr'])
            $data['descripcion_usr'] = $this->input->post('descripcion_usr');

          if($this->input->post('fecha_nac') != $this->input->post('fecha_nac'))
            $data['fecha_nac'] = $user['fecha_nac'];

          if(empty($data)):
            redirect('usuarios/editar/'.$user['nick']);
          else:
            if(!$this->Usuario->update($data, $user['id']))
              redirect('usuarios/perfil/'.$user['nick']);
            else
              $this->error('No pudo actualizarse el usuario');
          endif;
        else:
          $head['titulo'] = 'Editar usuario- '. $nick;
          $data['user']   = $this->Usuario->user_by_nick($nick);

          $this->load->view('comunes/head', $head);
          $this->load->view('comunes/header', $this->Navheader->get_header());
          $this->load->view('usuario/editar', $data);
          $this->load->view('comunes/recursos');
        endif;
      else:
        $head['titulo'] = 'Editar usuario- '. $nick;
        $data['user']   = $this->Usuario->user_by_nick($nick);

        $this->load->view('comunes/head', $head);
        $this->load->view('comunes/header', $this->Navheader->get_header());
        $this->load->view('usuario/editar', $data);
        $this->load->view('comunes/recursos');
      endif;
    else:
      redirect('inicio');
    endif;
  }

  private function error($mensaje){

    $head['titulo'] = 'Error';
    $data['mensaje']  = $mensaje;

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('admin/error', $data);
    $this->load->view('comunes/recursos');
  }
}