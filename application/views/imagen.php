<section role="main" class="scroll-container">
  <div class="row margin-row">
    <div class="large-8 columns large-text-center">
      <?php  if($this->Usuario->is_owner($imagen['id']) || $this->Usuario->is_admin()):?>
        <?= anchor('imagenes/borrar/'.$imagen['id'], 
                   '<i class="fa fa-trash"></i>', ['class' => 'button tiny expand']) ?>
      <?php  endif; ?>
      <?= img(['src' => $imagen['img_url'], 'id' => 'sngl-img']) ?>
      <div class="row">
        <div class="large-6 columns">
          <p class="left">por <?= anchor('usuarios/perfil/'.$imagen['nick'], 
                                                        $imagen['nick']) ?></p>
        </div>
        <input type="hidden" class="img_id" value=<?= $imagen['id'] ?>>
        <div class="large-6 columns">
          <div class="right raty" data-score=<?= $rate ?>>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="large-9 columns hashtags">
          <?php foreach ($hashtags as $hashtag): ?>
            <span><?= anchor('imagenes/hashtag/'.$hashtag['nombre_et'],
                                            '#'.$hashtag['nombre_et']) ?></span>
          <?php endforeach; ?>
        </div>
        <div class="large-3 columns">
        <?php if(!$fav): ?>
          <button class="button tiny right expand fav-button"><i class="fa fa-heart"></i></button>
        <?php else: ?>
          <button class="button tiny right expand fav-button disabled"><i class="fa fa-heart-o"></i></button>
        <?php endif; ?>
        </div>
      </div>
    </div>
    <div class="large-4 columns">
      <div class="row">
        <div class="large-12 columns">
          <?= $formcom ?>
          <div class="row">
            <div class="large-12 columns">
              <div id="comentarios">
                <?= isset($comentarios) ? $comentarios : '' ?>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>