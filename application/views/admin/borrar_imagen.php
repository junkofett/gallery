<section role="main" class="scroll-container" id="reg-form">
<div class="row">
<div id="cont-form">
<form>
  <div class="large-text-center">
    <h2>¿Seguro que desea borrar la imagen <?= anchor('imagenes/imagen/'.$imagen['id'], $imagen['titulo']) ?></h2>
    <div class="row">
      <div class="large-6 columns">
        <?= anchor('imagenes/conf_borrar/'.$imagen['id'], 'Sí', ['class' => 'button']) ?>
      </div>
      <div class="large-6 columns">
        <?= anchor('imagenes/imagen/'.$imagen['id'], 'No', ['class' => 'button']) ?>
      </div>      
    </div>
  </div>
</form>
  </div>
</div>
</section>