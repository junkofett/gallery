<section role="main" class="scroll-container" id="reg-form">
<div class="row">
<div id="cont-form">
<form>
  <div class="large-text-center">
    <h2>Error: <?= $mensaje ?></h2>
    <div class="row">
      <div class="large-12 columns">
        <?php if(isset($enlace)):?>
          <?= anchor($enlace, 'Volver', ['class' => 'button expand']) ?>
        <?php else: ?>
          <?= anchor('inicio', 'Volver a la galeria', ['class' => 'button expand']) ?>
        <?php endif; ?>
      </div>
    </div>
  </div>
</form>
  </div>
</div>
</section>