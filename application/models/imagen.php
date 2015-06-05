<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Imagen extends CI_Model{

  public function __construct(){
    parent::__construct();
    $this->categorias = $this->db
                            ->get('categorias')
                            ->result_array();
  }

  public function editar_imagen($id){
    //CONTROLAR QUE NO ENTREN USUARIOS NO LOGUEADOS
    //Y QUE EL USUARIO ES AUTOR DE LA IMAGEN
    $img = $this->db->get_where('imagenes',
                              ['id' => $id])
                    ->row_array();    
  }

  public function insertar_comentario($img_id, $texto){
    //COMPROBAR USUARIO LOGUEADO
    $user_id = $this->session->userdata('id');

    $this->db->insert('comentarios', ['usuarios_id' => $user_id,
                                      'imagenes_id' => $img_id,
                                      'texto'       => $texto]);
    $id = $this->db->insert_id();

    //return $this->db->get_where('comentarios', ['id' => $id])->row_array();
    return $this->comentario_por($id);
  }

  public function guardar_puntuacion($img_id, $puntuacion){
    $this->db->insert('puntuaciones', 
                        ['usuarios_id' => $this->session->userdata('id'),
                         'imagenes_id' => $img_id,
                         'valoracion'  => $puntuacion]
                      );
  }

  public function get_rate($img_id){
    $puntuaciones = $this->db->get_where('puntuaciones', 
                                          ['imagenes_id' => $img_id])
                             ->result_array();
    $valor = 0;

    foreach ($puntuaciones as $puntuacion):
      $valor += $puntuacion['valoracion'];  
    endforeach;

    if ($valor == 0):
      return 0;
    else:
      return $valor / count($puntuaciones);
    endif;
  }

  public function comentario_por($com_id){
    $this->db->from('comentarios c');
    $this->db->join('usuarios u', 'c.usuarios_id = u.id');
    $this->db->where('c.id', $com_id);

    $comentarios = $this->db->get();

    if($comentarios->num_rows() > 0):
      return $comentarios->row_array();
    else:
      return FALSE;
    endif;
  }

  public function get_comentarios($img_id){
    $this->db->from('comentarios c');
    $this->db->join('usuarios u', 'c.usuarios_id = u.id');
    $this->db->where('imagenes_id', $img_id);

    $comentarios = $this->db->get();

    if($comentarios->num_rows() > 0):
      return $comentarios->result_array();
    else:
      return FALSE;
    endif;
  }

  public function img_por_id($id){
    $this->db->from('usuarios u');
    $this->db->join('imagenes i', 'i.usuarios_id = u.id');
    $this->db->where('nsfw', 'f', 20, 0);
    $this->db->where('i.id', $id);
    $this->db->order_by('fecha_subida', 'desc');
    $res = $this->db->get()
                    ->row_array();
    return $res;
  }

  public function add_rate($img){
    $img['rate'] = $this->get_rate($img['id']);
    return $img;
  }

  public function imgs_by_user($id){
    $this->db->from('usuarios u');
    $this->db->join('imagenes i', 'i.usuarios_id = u.id');
    $this->db->where('nsfw', 'f', 20, 0);
    $this->db->where('usuarios_id', $id);
    $this->db->order_by('fecha_subida', 'desc');
    $res = $this->db->get();

    if($res->num_rows() > 0):
      return $res->result_array();
    else:
      return FALSE;
    endif;
  }

  public function anadir_imagen($insert){
    if(isset($insert['etiquetas'])):
      $hashtags = $insert['etiquetas'];
      unset($insert['etiquetas']);
    endif;

    $this->db->insert('imagenes', $insert);

    if(isset($hashtags)):
      $img_id  = $this->db->insert_id();
      $hashs   = $this->Etiqueta->preg_split_hashs($hashtags);

      foreach ($hashs as $hash):
        $hash    = substr($hash, 1);
        $hash_id = $this->Etiqueta->check_and_add_hashtag($hash);
        $this->relacionar_hash($hash_id, $img_id);
      endforeach;

    endif;
  }

  public function relacionar_hash($hash_id, $img_id){
    $this->db->insert('imgs_etiquetas', ['imagenes_id'  => $img_id,
                                         'etiquetas_id' => $hash_id]);
  }

  public function arbol($padre_id){
    $res = array_filter($this->categorias, function ($e) use ($padre_id){
      return $e['padre_id'] == $padre_id;
    });

    $res = array_values($res);

    if (count($res) == 0) return [];

    for ($i = 0; $i < count($res); $i++):
      $arbol[$i]['id']         = $res[$i]['id'];
      $arbol[$i]['nombre_cat'] = $res[$i]['nombre_cat'];
      $arbol[$i]['padre_id']   = $res[$i]['padre_id'];
      $hijos = $this->arbol($res[$i]['id']);

      if ($hijos != []) $arbol[$i]['subcats'] = $hijos;
    endfor;

    return $arbol;
  }

  public function unnest($arrays, $return){
    foreach($arrays as $array):
      if(isset($array['subcats'])):
        $return = $this->unnest($array['subcats'], $return);
      endif;

      $return[] = $array['id'];
    endforeach;

    return $return;
  }

  public function cat_parents($cat_id, $return){
    if($cat_id == 0) return [0];

    $return[] = $cat_id;

    $current = $this->db->get_where('categorias', ['id' => $cat_id])
                        ->row_array();
    $parent = $this->db->get_where('categorias', ['id' => $current['padre_id']])
                       ->row_array();

    if(count($parent) > 0):
      $return = $this->cat_parents($parent['id'], $return);
    endif;

    return $return;
  }

  public function radio_categorias($categorias){
    $radios = '';

    foreach ($categorias as $cat):
      $radios .= '<li>'.
                    form_radio(['value' => $cat['id'],
                                'name'  => 'categoria']) . $cat['nombre_cat'];
      
      if(isset($cat['subcats'])):
        $radios .= '<ul>';
        $radios .= $this->radio_categorias($cat['subcats']);
        $radios .= '</ul>';
      endif;

      $radios .= '</li>';
    endforeach;

    return $radios;
  }
}
