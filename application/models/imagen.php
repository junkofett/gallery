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

  public function img_por_id($id){
    $res = $this->db->get_where('imagenes', ['id' => $id])
                    ->row_array();
    return $res;
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

    if (count($res) == 0) return [];
    $arbol = [];

    foreach ($res as $hijo):
      $arbol[$hijo['nombre_cat']] = $hijo['id'];
      $hijos   = $this->arbol($hijo['id']);
      if ($hijos != []) $arbol[] = $hijos;
    endforeach;

    return $arbol;
  }

  public function unnest($array, $return){
    foreach($array as $key => $value):
      if(is_array($array[$key])):
        $return = $this->unnest($array[$key], $return);
      else:
        if(isset($array[$key])):
          $return[] = $array[$key];
        endif;
      endif;
    endforeach;

    return $return;
  }

  public function radio_categorias($categorias){
    $radios = '';

    foreach ($categorias as $key => $value):
      if (is_numeric($key)):
        $radios .= '<ul>';
        $radios .= $this->radio_categorias($value);
        $radios .= '</ul>';
      else:
        $radios .= '<li>'.
                      form_radio(['value' => $value,
                                  'name'  => 'categoria']) . $key .
                    '</li>';
      endif;
    endforeach;

    return $radios;
  }
}