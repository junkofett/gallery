<div class="row">
  <div class="large-center columns">
    <?= form_open('usuarios/login', ['id' => 'login-form']) ?>
      <?= form_label('Nick', 'nick') ?>
      <?= form_input('nick', set_value('nick')) ?>
      <?= form_label('Pass', 'pass') ?>
      <?= form_password('pass') ?> <br>
      <div class="large-text-center">
      <?= form_submit(['name'  => 'login',
                       'value' => 'Login',
                       'class' => 'button']) ?>
      </div>
    <?= form_close() ?>

    <?= anchor('usuarios/registro', '<button class="button">Registrate!</button>') ?>

    <?= validation_errors() ?>
    <?php if(isset($errores)): ?>
      <?php foreach ($errores as $key => $value) { ?>
        <h3><?= $value ?></h3>
      <?php } ?>
    <?php endif; ?>
  </div>
</div>