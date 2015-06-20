<ul class='clearing-thumbs large-block-grid-4 small-block-grid-2'>
<?php 
  $gal_type = $imagenes['gal_type'];
  unset($imagenes['gal_type']) ; 
?>
<input type="hidden" id="gal_type" name=<?= $gal_type['name'] ?> value=<?= $gal_type['value'] ?> >
<?php foreach ($imagenes as $imagen): ?>
  <li class='prev'>
    <div class="imagen">
      <?php  if($this->Usuario->is_owner($imagen['img_id']) || $this->Usuario->is_admin()):?>
          <?= anchor('imagenes/borrar/'.$imagen['img_id'], 
                        '<i class="fa fa-trash"></i>', ['class' => 'button tiny expand']) ?>
          <?= anchor('imagenes/editar/'.$imagen['img_id'], 'Editar', ['class' => 'button tiny expand']) ?>
      <?php  endif; ?>
      <div class="row">
        <div class="large-11 columns">
          <?= anchor('imagenes/imagen/'.$imagen['img_id'], img($imagen['thumb_url'])) ?>
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
          <button class="button tiny right expand fav-button"><i class="fa fa-heart"></i></button>
        <?php else: ?>
          <button class="button tiny right expand fav-button disabled"><i class="fa fa-heart-o"></i></button>
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