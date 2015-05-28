<section role="main" class="scroll-container">
  <div class="row">
    <div class="large-4 columns">
      <?= form_open_multipart('imagenes/do_upload');?>
      <?= form_hidden('id', $this->session->userdata('id')) ?>
      <?= $categorias ?>
    </div>
    <div class="large-8 columns">
      <div class="row">
        <div class="large-12 columns">
          <?= form_label('Titulo', 'titulo') ?>
          <?= form_input(['name' => 'titulo']) ?>
          <?= form_label('Descripción', 'descripcion') ?>
          <?= form_input(['name' => 'descripcion']) ?>
          <?= form_label('Selecciona Imagen', 'imagen') ?>
          <?= form_upload(['name' => 'imagen']) ?>
          <?= form_label('Etiquetas', 'etiquetas') ?>
          <?= form_input(['name' => 'etiquetas']) ?>
          <?= form_checkbox('nsfw', 'nsfw');?>
          <?= form_label('Contenido Adulto', 'nsfw') ?>
          <?= form_submit(['name'  => 'subir', 
                           'value' => 'Subir',
                           'class' => 'button']) ?>
        
          <?= form_close() ?>
        </div>
      </div>      
    </div>
  </div>
</section>