<?php foreach ($comentarios as $comentario): ?>
  <div class="comentario">
    <?= htmlspecialchars(urldecode($comentario['texto'])) ?>
    <div class="row">
      <div class="large-12 columns">
        <div class="left time">
          <?php $date = new DateTime($comentario['fecha_com']);
                echo $date->format('Y-m-d H:i:s'); ?>
        </div>
        <div class="right">
          <?= anchor('usuarios/perfil/'.$comentario['nick'], 
                                        $comentario['nick']) ?>
        </div>
      </div>
    </div>
  </div>
<?php endforeach; ?>