<!DOCTYPE html>
<html>
<head>
  <title>Registro</title>
</head>
<body>
  <?= form_open('registro/registrar') ?>
    <?= form_label('Nick', 'nick') ?>
    <?= form_input('nick', set_value('nick')) ?> <br>
    <?= form_label('Pass', 'pass') ?>
    <?= form_password('pass') ?> <br>
    <?= form_label('Confirma Pass', 'passconf') ?>
    <?= form_password('passconf') ?> <br>
    <?= form_submit('registrarse','Registrarse') ?>
  <?= form_close() ?>

  <?= validation_errors() ?>
</body>
</html>