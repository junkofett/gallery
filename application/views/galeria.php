<ul class='clearing-thumbs small-block-grid-4'>
<?php foreach ($imagenes as $imagen): ?>
  <li class='prev'>
    <div class="imagen">
      <?= anchor('imagenes/imagen/'.$imagen['id'], img($imagen['thumb_url'])) ?>
      <div class="row">
        <div class="large-6 columns">por <?= anchor('usuarios/perfil/'
                                            .$imagen['nick'], $imagen['nick']) ?>
        </div>
        <div class="large-6 columns">
          <div class="right raty" data-score=<?= $imagen['rate'] ?>></div>
        </div>
      </div>
    </div>
  </li>
<?php endforeach ?>
</ul>