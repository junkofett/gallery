<section role="main" class="scroll-container">
  <div class="row">
    <div class="large-4 column">
      <?= form_open_multipart('imagenes/do_upload');?>
      <?= form_hidden('id', $this->session->userdata('id')) ?>
  
      <?= form_label('Selecciona Imagen', 'imagen') ?>
      <?= form_upload(['name' => 'imagen']) ?>
    </div>
    <div class="large-8 column">
      <?= form_label('Titulo', 'titulo') ?>
      <?= form_input(['name' => 'titulo']) ?>
    </div>
  </div>
  <div class="row">
    <div class="large-4 columns">
      <?= $categorias ?>
    </div>
    <div class="large-8 columns">
      <div class="row">
        <div class="large-12 columns">
          <?= form_label('Descripción', 'descripcion') ?>
          <?= form_input(['name' => 'descripcion']) ?> <br>
          <?= form_label('Etiquetas', 'etiquetas') ?>
          <?= form_input(['name' => 'etiquetas']) ?>
          <?= form_label('Contenido Adulto', 'nsfw') ?>
          <?= form_checkbox('nsfw', 'nsfw');?>
          <?= form_submit('subir', 'Subir') ?>
        
          <?= form_close() ?>
        </div>
      </div>      
    </div>
  </div>
</section>