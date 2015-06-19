<section role="main" class="scroll-container">
  <div class="row">
    <div class="large-3 small-4 columns">
      <?= form_open('imagenes/editar/'.$imagen['id']);?>
      <?= form_hidden(['name'  => 'img_id', 
                       'value' => $imagen['id'],
                       'id'    => 'imagen-id']) ?>
      <?= form_label('Categorias', 'categoria') ?>
      <?= $radio_cat ?>
    </div>
    <div class="large-4 small-8 columns">
      <div class="row">
        <div class="large-12 columns">
          <div class="show-for-small-only">
            <?= anchor('imagenes/borrar/'.$imagen['id'], 
            '<i class="fa fa-trash"></i>', ['class' => 'button tiny expand']) ?>
          </div>
          <?= form_label('Titulo', 'titulo') ?>
          <?= form_input(['name'  => 'titulo',
                          'value' => $imagen['titulo']]) ?>
          <?= form_label('Descripción', 'descripcion_img') ?>
          <?= form_input(['name'  => 'descripcion_img',
                          'value' => $imagen['descripcion_img']]) ?>
          <?= form_label('Nuevas Etiquetas', 'nuevas_ets') ?>
          <?= form_input(['name' => 'nuevas_ets',
                          'placeholder' => '#etiqueta1 #etiqueta2']) ?>
          <div class="row">
            <div class="large-text-center">
              <?php foreach ($imagen['hashtags'] as $hash): ?>
                <div data-alert class="alert-box rem-hash">
                  <?= form_hidden('hash_id', $hash['id']) ?>
                  <?= form_hidden('img_id', $imagen['id']) ?>
                  <?= '#'.$hash['nombre_et'] ?>
                  <a href="#" class="close">&times;</a>
                </div>
              <?php endforeach ?>
            </div>
          </div>
          <?= form_checkbox('nsfw', 'nsfw') ?>
          <?= form_label('Contenido Adulto', 'nsfw') ?>
          <?= form_submit(['name'  => 'aplicar', 
                           'value' => 'Aplicar',
                           'class' => 'button expand']) ?>
        
          <?= form_close() ?>
        </div>
      </div>
    </div>
    <div class="large-4 columns hide-for-small">
      <?= img($imagen['img_url']) ?>
      <?= anchor('imagenes/borrar/'.$imagen['id'], 
        '<i class="fa fa-trash"></i>', ['class' => 'button tiny expand']) ?>
    </div>
  </div>
</section>