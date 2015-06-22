<section role="main" class="scroll-container">
  <div class="row margin-row">
    <div class="large-text-center" id="favstitle"><?= $user['nick'] ?></div>
    <?= form_open('usuarios/editar/'.$user['nick'], ['user_id' => $user['id']]) ?>
    <div class="large-6 columns">
      <?= form_label('e-mail', 'email') ?>
      <?= form_input(['name' => 'email',
                      'type' => 'email',
                      'value' => $user['email']]) ?>
      <?= form_label('Confirmar e-mail', 'confemail') ?>
      <?= form_input(['name' => 'confemail',
                      'type' => 'email']) ?>
    </div>
    <div class="large-6 columns">
      <?= form_label('Descripcion', 'descripcion_usr') ?>
      <?= form_input(['name'  => 'descripcion_usr',
                      'type'  => 'text',
                      'value' => $user['descripcion_usr']]) ?>
      <?= form_label('Fecha de Nacimiento', 'fecha_nac') ?>
      <?= form_input(['type' => 'date',
                      'name' => 'fecha_nac',
                      'value' => $user['fecha_nac']]) ?>
    </div>
  </div>
  <div class="row">
    <div class="large-6 columns">
      <?= form_submit('editar', 'Aplicar', 'class = "button expand"') ?>
    </div>
    <div class="large-6 columns">
      <?= anchor('usuarios/perfil/'.$user['nick'], 'Volver al perfil', ['class' => 'button expand']) ?>
    </div>
    <?= form_close() ?>
  </div>
  <div class="row">
    <div class="large-text-center">
      <?= anchor('admin/borrar_user/'.$user['nick'], '<i class="fa fa-trash"></i>', ['class' => 'button expand'])?>
    </div>
  </div>
</section>