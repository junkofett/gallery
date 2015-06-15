<ul class='clearing-thumbs small-block-grid-4'>
<?php foreach ($imagenes as $imagen): ?>
  <li class='prev'>
    <div class="imagen">
      <div class="row">
        <div class="large-11 columns">
          <?= anchor('imagenes/imagen/'.$imagen['id'], img($imagen['thumb_url'])) ?>
        </div>
        <input type="hidden" class="img_id" value=<?= $imagen['id'] ?>>
        <div class="large-1 columns raty-div">
          <div class="raty" data-score=<?= $imagen['rate'] ?>></div>
        </div>
      </div>
      <hr>
      <div class="row">
        <div class="large-6 columns by-user"><p>por <?= anchor('usuarios/perfil/'
                                            .$imagen['nick'], $imagen['nick']) ?></p>
        </div>
        <div class="large-6 columns">
        <?php if(!$imagen['fav']): ?>
          <button class="button tiny right fav-button"><i class="fa fa-heart"></i></button>
        <?php else: ?>
          <button class="button tiny right fav-button disabled"><i class="fa fa-heart-o"></i></button>
        <?php endif; ?>
        </div>
      </div>
      <div class="row">
        <div class="large-center hashtags">
          <?php foreach ($imagen['hashtags'] as $hashtag): ?>
            <span><?= anchor('imagenes/hashtag/'.$hashtag['nombre_et'],
                                            '#'.$hashtag['nombre_et']) ?></span>
          <?php endforeach; ?>
        </div>
      </div>
    </div>
  </li>
<?php endforeach ?>
</ul>