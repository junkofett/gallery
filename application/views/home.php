<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Bienvenido</title>
</head>
<body>

  <h2>Bienvenido <?= $this->session->userdata('nick') ?></h2>

  <?= anchor('inicio/logout', '<button>Logout</button>') ?>

  <div>    
    <?= form_open_multipart('upload/do_upload');?>
      <?= form_hidden('id', $this->session->userdata('id')) ?>
      <?= form_label('Selecciona Imagen', 'imagen') ?>
      <?= form_upload(['name' => 'imagen']) ?> <br>
      <?= form_label('Titulo', 'titulo') ?>
      <?= form_input(['name' => 'titulo']) ?> <br>
      <?= form_label('Descripción', 'descripcion') ?>
      <?= form_input(['name' => 'descripcion']) ?> <br>
      <?= form_label('Contenido Adulto', 'nsfw') ?>
      <?= form_checkbox('nsfw', 'nsfw');?> <br>
      <?= form_submit('subir', 'Subir') ?>
    <?= form_close() ?>
  </div>

  <?= /*anchor('escap', 'ESCAPAR TOOOLOCOOOOO')*/'' ?>
</body>
</html>