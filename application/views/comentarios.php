<div class="large-12 columns">
<?php foreach ($comentarios as $comentario): ?>
  <div class="comentario">
    <?= htmlspecialchars(urldecode($comentario['texto'])) ?>
    <div class="row">
      <div class="large-12 columns">
        <div class="right">
          <?= anchor('usuarios/perfil/'.$comentario['nick'], 
                                        $comentario['nick']) ?>
        </div>
      </div>
    </div>
  </div>
<?php endforeach; ?>
</div>