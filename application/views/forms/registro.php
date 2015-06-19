<section role="main" class="scroll-container" id="reg-form">
  <div class="row">
    <div id="cont-form">
    <div class="large-centered columns">  
      <?= form_open('usuarios/registrar') ?>
        <div class="row text-center">
          <div class="large-6 columns">
            <?= form_label('Nick', 'nick') ?>
            <?= form_input('nick', set_value('nick')) ?> <br>
            <?= form_label('Password', 'pass') ?>
            <?= form_password('pass') ?> <br>
            <?= form_label('Confirmar Pass', 'passconf') ?>
            <?= form_password('passconf') ?> <br>
          </div>
          <div class="large-6 columns">
            <?= form_label('e-mail', 'email') ?>
            <?= form_input(['name' => 'email',
                            'type' => 'email',
                            'required' => 'required',
                            'value' => '']) ?> <br>
            <?= form_label('Confirmar e-mail', 'confemail') ?>
            <?= form_input(['name' => 'confemail',
                            'type' => 'email',
                            'required' => 'required',
                            'value' => '']) ?> <br>
            <?= form_label('Fecha de Nacimiento', 'fecha_nac') ?>
            <?= form_input(['type' => 'date',
                            'name' => 'fecha_nac',
                            'requried' => 'required']) ?>
          </div>
        </div>
        <div class="row text-center">
          <?= form_submit(['name'  => 'registrarse',
                           'value' => 'Registrarse',
                           'class' => 'button']) ?>

        </div>
      <?= form_close() ?>
        <div class="row text-center"><?= anchor(base_url(), '<button class="button">Volver sin Loguear</button>') ?></div>
      <?= validation_errors() ?>
    </div>
    </div>
  </div>
</section>