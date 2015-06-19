<section role="main" class="scroll-container">
  <div class="row  margin-row">
    <div class="large-3 columns">
      <?= form_open('admin/categorias');?>
      <?= form_label('Selecciona un padre', 'nuevo_padre') ?>
      <ul>
        <?= $radio_cat ?>
      </ul>
    </div>
    <div class="large-9 columns">
    <div class="large-text-center">
      <p id="hashtitle">Añadir Categoria</p>
    </div>  
      <div class="row">
        <div class="large-12 columns">
          <?= form_label('Nombre Categoria', 'nombre_cat') ?>
          <?= form_input(['name'  => 'nombre_cat']) ?>
          <?= form_submit(['name'  => 'crear', 
                           'value' => 'Crear',
                           'class' => 'button expand']) ?>
          <?= form_submit(['name'  => 'borrar', 
                           'value' => 'Borrar',
                           'class' => 'button expand']) ?>
        
          <?= form_close() ?>
        </div>
      </div>
    </div>
  </div>
</section>