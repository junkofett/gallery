<div>    
  <?= form_open_multipart('imagenes/do_editar');?>
    <?= form_hidden('id', $this->session->userdata('id')) ?>
    <?= img($img_url) ?>
    <br>
    <?= $radio_cat ?>
    <br>
    <?= form_label('Titulo', 'titulo') ?>
    <?= form_input(['name' => 'titulo',
                    'value' => (isset($titulo)) ? $titulo : '']) ?> <br>
    <?= form_label('Descripción', 'descripcion') ?>
    <?= form_input(['name' => 'descripcion',
                    'value'=> $descripcion_img]) ?> <br>
    <?= form_label('Contenido Adulto', 'nsfw') ?>
    <?= form_checkbox('nsfw', 'nsfw');?> <br>
    <?= form_submit('editar', 'Editar') ?>
  <?= form_close() ?>
</div>