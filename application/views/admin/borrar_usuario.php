<section role="main" class="scroll-container" id="reg-form">
<div class="row">
<div id="cont-form">
<form>
  <div class="large-text-center">
    <h2>¿Seguro que desea borrar al usuario <?= anchor('usuario/perfil/'.$usuario['nick'], $usuario['nick']) ?></h2>
    <div class="row">
      <div class="large-6 columns">
        <?= anchor('admin/conf_borrar_usuario/'.$usuario['nick'], 'Sí', ['class' => 'button']) ?>
      </div>
      <div class="large-6 columns">
        <?= anchor('admin/usuarios', 'No', ['class' => 'button']) ?>
      </div>      
    </div>
  </div>
</form>
</div>
</div>
</section>