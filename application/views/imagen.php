<section role="main" class="scroll-container">
  <div class="row margin-row">
    <div class="large-8 columns large-text-center">
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