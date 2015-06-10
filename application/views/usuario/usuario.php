<div class="row">
  <div class="large-5 columns">
    <div class="row">
      <div class="large-8 columns">
        <h2><?= $nick ?></h2>
      </div>
      <div class="large-4 columns">
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
      <li class="tab-title"><a href="#panel2">Tab 2</a></li>
      <li class="tab-title"><a href="#panel3">Tab 3</a></li>
      <li class="tab-title"><a href="#panel4">Tab 4</a></li>
    </ul>
    <div class="tabs-content">
      <?= $imagenes ?>
    </div>
  </div>
</div>