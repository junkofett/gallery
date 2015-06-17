<div class="row">
  <div class="large-5 columns">
    <div class="row">
      <div class="large-8 columns">
        <h2><?= $nick ?></h2>
      </div>
      <div class="large-4 columns">
      <?php  if($this->Usuario->is_self($nick) || $this->Usuario->is_admin()): ?>
        <button class="button tiny"><?= anchor('/usuarios/editar/'.$nick, 'editar perfil') ?></button>
      <?php else: ?>
        <?php if (!$usuario_seguido): ?>
          <button class="button tiny seguir">
            <input type="hidden" value="<?= $nick ?>">
            <i class="fa fa-user-plus"></i> seguir
          </button>
        <?php else: ?>
          <button class="button tiny">
            siguiendo
          </button>
        <?php endif; ?>
      <?php endif; ?>
      </div>
    </div>
    <p class="descripcion-usr"><?= $descripcion_usr ?></p>
  </div>
  <div class="large-7 columns">
    <ul class="tabs" data-tab>
      <li class="sala-user tab-title active">
        <input type="hidden" value="<?= $nick ?>" />
        <a href="#sala">sala</a>
      </li>
      <li class="favs-user tab-title">
        <input type="hidden" value="<?= $nick ?>">
        <a href="#favs-user">favoritos</a>
      </li>
      <li class="follows-user tab-title">
        <input type="hidden" value="<?= $nick ?>">
        <a href="#follows-user">usuarios seguidos</a>
      </li>
    </ul>
    <div class="tabs-content">
      <?= $imagenes ?>
    </div>
  </div>
</div>