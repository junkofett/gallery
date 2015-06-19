<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller {
  public function is_admin(){
    return $this->Usuario->is_admin();
  }

  public function usuarios(){
    if(!$this->Usuario->is_admin()) redirect('inicio');
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
    $this->load->view('admin/borrar_usuario', $data);
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

  public function categorias(){
    if(!$this->Usuario->is_admin()) redirect('inicio');
    
    if($this->input->post('crear')):
      $nombre = trim($this->input->post('nombre_cat'));
      $padre  = $this->input->post('categoria');

      if($nombre != '' && $this->Categoria->existe($padre))
        $this->Categoria->anadir($nombre, $padre);

      redirect('admin/categorias');
    else:
      if($this->input->post('borrar')):
        if($this->Categoria->existe($this->input->post('categoria'))):
          $cat_id = $this->input->post('categoria');

          if(!$this->Categoria->tiene_hijos($cat_id))
            $this->Categoria->borrar($cat_id);
          else
            $this->error('Debe borrar primero las categorias hijas', 'admin/categorias');
        endif;
      endif;
    endif;

    $categorias = $this->Imagen->arbol(NULL) ;
    $radio_cat  = $this->Imagen->radio_categorias($categorias);

    $head['titulo'] = 'Administrar categorias';

    $data['radio_cat'] = $radio_cat;

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('admin/admin_categorias', $data);
    $this->load->view('comunes/recursos');
  }

  private function error($mensaje, $enlace = NULL){

    $head['titulo'] = 'Error';
    $data['mensaje']  = $mensaje;

    if($enlace !== NULL)
      $data['enlace'] = $enlace;

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('admin/error', $data);
    $this->load->view('comunes/recursos');
  }
}