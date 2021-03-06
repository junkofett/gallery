<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Imagen extends CI_Model{

  public function __construct(){
    parent::__construct();
    $this->categorias = $this->db->get('categorias')->result_array();
  }

  public function get_galeria($user_id = NULL, $unnested = NULL, $etiqueta = NULL, $fav = NULL, $offset = 0){
    //resolver nsfw
    //resolver paginacion

    $boolhashview = FALSE;
    $boolfavview  = FALSE;

    if($user_id !== NULL):
      if($this->Usuario->existe($user_id)):
        $this->db->from('usuarios u');
        $this->db->join('imagenes i', 'i.usuarios_id = u.id');
        $this->db->where('i.usuarios_id', $user_id);
      endif;
    else:
      $this->db->from('usuarios u');
      $this->db->join('imagenes i', 'i.usuarios_id = u.id');
    endif;

    if($etiqueta !== NULL):
      $this->db->join('imgs_etiquetas ie', 'i.id = ie.imagenes_id');
      $this->db->join('etiquetas e', 'ie.etiquetas_id = e.id');
      $this->db->where('e.id', $etiqueta['id']);

      $input = ['id'    => 'gal_type',
                'name'  => 'hashtag_id',
                'value' => $etiqueta['id']
                ];

      $boolhashview = TRUE;
    endif;

    if($unnested !== NULL):
      foreach ($unnested as $key => $value):
        if($key > 0):
          $this->db->or_where('categorias_id =', $value);
        else:
          $this->db->where('categorias_id =', $value);
        endif;
      endforeach;
    endif;

    if($fav !== NULL):
      $user_id = $fav;
      $this->db->join('favoritos f', 'f.imagenes_id = i.id');
      $this->db->where('f.usuarios_id', $user_id);

      $boolfavview = TRUE;
    endif;

    $this->db->limit(8, $offset);
    $this->db->where('nsfw', 'f');
    $this->db->order_by('fecha_subida', 'desc');
    $res = $this->db->get();

    $imgsnorate = $res->result_array();
    $imagenes   = [];

    foreach ($imgsnorate as $img):
      if(isset($img['imagenes_id'])):
        $img['img_id'] = $img['imagenes_id'];
      else:
        $img['img_id'] = $img['id'];
      endif;

      $img        = $this->add_rate($img);
      $img['fav'] = $this->comprobar_fav($img['id']);
      $imagenes[] = $this->add_hashtags($img, $boolhashview); 
    endforeach;

    if($boolfavview):
      $user = $this->Usuario->user_by_id($fav);

      $input = ['name'  => 'favs_nick',
                'value' => $user['nick']
               ];
    endif;


    if($user_id != NULL):
      $input = ['id'    => 'gal_type',
                'name'  => 'user_perf',
                'value' => $this->Usuario->user_by_id($user_id)['nick']
                ];
    endif;

    if(isset($input)):
      $imagenes['gal_type'] = $input;
    else:
      $imagenes['gal_type'] = ['name' => 'categorias', 'value' => "0"];
    endif;

    return $imagenes;
  }

  public function editar_imagen($id){
    //COMPROBAR QUE LA IMAGEN EXISTE
    if(!$this->Usuario->is_owner($id)) redirect('inicio');

    $img = $this->db->get_where('imagenes',
                              ['id' => $id])
                    ->row_array();    
  }

  public function insertar_comentario($img_id, $texto){
    if(!$this->Usuario->is_logged()) redirect('inicio');

    $user_id = $this->session->userdata('id');

    $this->db->insert('comentarios', ['usuarios_id' => $user_id,
                                      'imagenes_id' => $img_id,
                                      'texto'       => $texto]);
    $id = $this->db->insert_id();

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

    if ($valor == 0)
      return 0;
    else
      return $valor / count($puntuaciones);
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
    $this->db->order_by('fecha_com', 'desc');

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

    return $this->db->get()->row_array();;
  }

  public function add_rate($img){
    $img['rate'] = $this->get_rate($img['id']);
    return $img;
  }

  public function add_hashtags($img, $hashtagview = FALSE){
    if($hashtagview):
      $key = 'imagenes_id';
    else:
      $key = 'id';
    endif;

    $img['hashtags'] = $this->get_hashtags($img[$key]);
    return $img;
  }

  public function get_hashtags($img_id){
    $this->db->from('imgs_etiquetas i');
    $this->db->join('etiquetas e', 'i.etiquetas_id = e.id');
    $this->db->where('i.imagenes_id', $img_id);
    $hashtags = $this->db->get();
    return $hashtags->result_array();
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

    $img = $this->db->get_where('imagenes', ['id' => $this->db->insert_id()])
                    ->row_array();

    $this->Notificacion->notificar_publicacion($img);

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

  public function anadir_y_relacionar_hash($hashtags, $img_id){
    $hashs = $this->Etiqueta->preg_split_hashs($hashtags);

    foreach ($hashs as $hash):
      $hash    = substr($hash, 1);
      $hash_id = $this->Etiqueta->check_and_add_hashtag($hash);
      $this->relacionar_hash($hash_id, $img_id);
    endforeach;
  }

  public function borrar_hash($hash, $img){
    $this->db->where('imagenes_id', $img);
    $this->db->where('etiquetas_id', $hash);
    $this->db->delete('imgs_etiquetas');
  }

  public function relacionar_hash($hash_id, $img_id){
    $this->db->insert('imgs_etiquetas', ['imagenes_id'  => $img_id,
                                         'etiquetas_id' => $hash_id]);
  }

  public function add_fav($img_id){
    if(!$this->Usuario->is_logged()) return FALSE;
    //comprobar que la imagen existe

    $usr = $this->session->userdata('id');
    $this->db->insert('favoritos', ['usuarios_id' => $usr,
                                    'imagenes_id' => $img_id]);
  }

  public function comprobar_fav($img_id){
    if(!$this->Usuario->is_logged()) return FALSE;

    $usr = $this->session->userdata('id');
    $res = $this->db->get_where('favoritos', ['usuarios_id' => $usr,
                                              'imagenes_id' => $img_id]);

    if($res->num_rows() > 0):
      return TRUE;
    else:
      return FALSE;
    endif;
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

  public function radio_categorias($categorias, $cat_sel = NULL){
    $radios = '';

    foreach ($categorias as $cat):
      $radios .= '<li>'.
                    form_radio(['value' => $cat['id'],
                                'name'  => 'categoria',
                                'required' => 'required',
                                'checked' => ($cat_sel === $cat['id'])? 'checked' : '']) . $cat['nombre_cat'];
      
      if(isset($cat['subcats'])):
        $radios .= '<ul>';
        $radios .=    $this->radio_categorias($cat['subcats'], $cat_sel);
        $radios .= '</ul>';
      endif;

      $radios .= '</li>';
    endforeach;

    return $radios;
  }

  public function listar_categorias($categorias){
    $lista = '';

    foreach ($categorias as $categoria):
      $lista .= '<li class="menu-cat button">
                  <input type="hidden" value="'.$categoria['id'].'"/>
                  <div>'.$categoria['nombre_cat'].'</div>';

      if (isset($categoria['subcats'])):
        $lista .= '<ul class="cataccordion">';
        $lista .= $this->listar_categorias($categoria['subcats']);
        $lista .= '</ul>';
      endif;

      $lista .= '</li>';
    endforeach;

    return $lista;
  }

  public function offcanvas_categorias($categorias){
    $canvas = '';

    foreach ($categorias as $cat):
      if(isset($cat['subcats'])):
        $canvas .= '<li class="has-submenu">';
      else:
        $canvas .= '<li>';
      endif;
      
      $canvas .= '<input type="hidden" value="'.$cat['id'].'"/>
                    <a href="#">'.$cat['nombre_cat'].'</a>';

      if(isset($cat['subcats'])):
        $canvas .= '<ul class="left-submenu">
                      <li class="back">
                        <input type="hidden" value="'.(($cat['padre_id'] != NULL) ? $cat['padre_id'] : 0 ).'">
                      <a href="#">atras</a></li>';
        $canvas .= $this->offcanvas_categorias($cat['subcats']);
        $canvas .= '</ul>';
      endif;

      $canvas .= '</li>';
    endforeach;

    return $canvas;    
  }

  public function borrar($img_id){
    if($this->Usuario->is_owner($img_id) || $this->Usuario->is_admin()):
      return $this->db->delete('imagenes', ['id' => $img_id]);
    else:
      redirect('inicio');
    endif;
  }

  public function update($data, $img_id){
    $this->db->where('id', $img_id);
    return $this->db->update('imagenes', $data);
  }
}
