<?php 
  $data = array('name' => 'nuevocomentario',
                'rows' => '4',
                'id'   => 'nuevocomentario');
                ?>

<?= form_open() ?>
  <?= form_hidden('img_id', $img_id) ?>
  <?= form_textarea($data) ?>
  <?= form_button([ 'name'    => 'comentar',
                    'id'      => 'insertarcomentario',
                    'content' => 'Comentar',
                    'class'   => 'button radius tiny right']) ?>
<?= form_close() ?>