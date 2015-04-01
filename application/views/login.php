<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
</head>
<body>
  <?= form_open('inicio/login') ?>
    <?= form_label('Nick', 'nick') ?>
    <?= form_input('nick', set_value('nick')) ?> <br>
    <?= form_label('Pass', 'pass') ?>
    <?= form_password('pass') ?> <br>
    <?= form_submit('enviar','Enviar') ?>
  <?= form_close() ?>

  <?= anchor('registro', '<button>Registrate!</button>') ?>

  <?= validation_errors() ?>
  <?php if(isset($errores)): ?>
    <?php foreach ($errores as $key => $value) { ?>
      <h3><?= $value ?></h3>
    <?php } ?>
  <?php endif; ?>
</body>
</html>