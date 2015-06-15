<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends CI_Controller {

  public function index(){
    $categorias = $this->Imagen->arbol(NULL);
    $lista_cat  = $this->Imagen->listar_categorias($categorias);

    $head['titulo']      = 'gallery';
    $galeria['imagenes'] = $this->Imagen->get_galeria();
    $data['categorias']  = $lista_cat;
    $data['offcanvas']  = $this->Imagen->offcanvas_categorias($categorias);
    $data['contents']    = $this->load->view('galeria', $galeria, TRUE);

    $this->load->view('comunes/head', $head);
    $this->load->view('comunes/header', $this->Navheader->get_header());
    $this->load->view('comunes/home', $data);
    $this->load->view('comunes/recursos');
  }  
}