<div class="row">
  <div class="large-center columns">
    <?= form_open('usuarios/login', ['id' => 'login-form']) ?>
      <?= form_label('Nick', 'nick_field') ?>
      <?= form_input(['name' => 'nick', 
                      'id'  => 'nick_field',
                      'value' => set_value('nick'),
                      'required' => 'required']) ?>
      <?= form_label('Password', 'pass_field') ?>
      <?= form_password(['id' => 'pass_field',
                        'required' => 'required',
                        'name' => 'pass']) ?> <br>
      <div class="large-text-center">
      <?= form_submit(['name'  => 'login',
                       'value' => 'Login',
                       'id'    => 'login-button',
                       'onclick' => 'guarda_cookie()',
                       'class' => 'button']) ?>

      <?= anchor('usuarios/registro', 'Registrate!', ['id' => 'reg-button']) ?>
      </div>
    <?= form_close() ?>
    <?= validation_errors() ?>
    <?php if(isset($errores)): ?>
      <?php foreach ($errores as $key => $value) { ?>
        <h3><?= $value ?></h3>
      <?php } ?>
    <?php endif; ?>
  </div>
</div>