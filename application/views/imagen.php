<section role="main" class="scroll-container">
  <div class="row">
    <div class="large-12 columns large-text-center">
      <input type="hidden" id="img_id" value=<?= $imagen['id'] ?>>
      <?= img($imagen['img_url']) ?>
      <div class="row">
        <div class="large-6 columns">
          <p class="left">por <?= anchor('usuarios/perfil/'.$imagen['nick'], 
                                                        $imagen['nick']) ?></p>
        </div>
        <div class="large-6 columns">
          <div class="right raty" data-score=<?= $rate ?>>
            RATE IT!
          </div>
        </div>
      </div>
    </div>
  </div>
</section>