<div class='row' id="home">
  <aside id="categorias" class='large-2 columns'>
    <ul id="cat-menu">
      <li class="menu-cat button radius">
        <input type="hidden" value="0">
        <div>Todas las categorías</div>
        <ul class="cataccordion">
          <?= $categorias ?>
        </ul>
      </li>
    </ul>
  </aside>
  <div class='large-10 columns' id='contents'>
    <?= $contents ?>
  </div>
</div>