<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajax extends CI_Controller {

  public function imgs_por_cat($id){
    if(!$this->input->is_ajax_request()) return;
    $id = ($id == '0') ? NULL : $id;

    $primer = $this->db->get_where('categorias', ['id' => $id])->row_array();
    $arbol  = $this->Imagen->arbol($id);

    if($id != NULL)
    array_unshift($arbol, ['id'         => $primer['id'],
                           'nombre_cat' => $primer['nombre_cat'],
                           'padre_id'   => $primer['padre_id'] ]);

    $unnested = $this->Imagen->unnest($arbol, []);

    $this->db->from('imagenes');
    $this->db->join('usuarios', 'imagenes.usuarios_id = usuarios.id');
    $this->db->where('nsfw', 'f', 20, 0);

    foreach ($unnested as $key => $value):
      if($key > 0):
        $this->db->or_where('categorias_id =', $value);
      else:
        $this->db->where('categorias_id =', $value);
      endif;
    endforeach;

    $this->db->order_by('fecha_subida', 'desc');
    $data['imagenes'] = $this->db->get()->result_array();

    $this->load->view('galeria', $data);
  }

  public function imgs_by_user($nick){
    if(!$this->input->is_ajax_request()) return;
    $usuario = new Usuario($nick);
    
    $data['imagenes'] = $this->Imagen->imgs_by_user($usuario->id);
    $data['nick']     = $usuario->nick;

    $this->load->view('galeria', $data);
  }
}