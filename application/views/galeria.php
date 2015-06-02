<ul class='clearing-thumbs small-block-grid-4'>
<?php foreach ($imagenes as $imagen): ?>
  <li class='prev'>
    <div class="imagen">
      <div class="row">
        <div class="large-11 columns">
          <?= anchor('imagenes/imagen/'.$imagen['id'], img($imagen['thumb_url'])) ?>
        </div>
        <div class="large-1 columns raty-div">
          <div class="raty" data-score=<?= $imagen['rate'] ?>></div>
        </div>
      </div>
      <div class="row">
        <div class="large-9 columns">por <?= anchor('usuarios/perfil/'
                                            .$imagen['nick'], $imagen['nick']) ?>
        </div>
      </div>
    </div>
  </li>
<?php endforeach ?>
</ul>