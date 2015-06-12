<?php if(isset($hashtag_nom)): ?>
<div class="row">
  <div class="large-text-center">
    <p id="hashtitle"><?= $hashtag_nom ?></p>
  </div>  
</div>
<?php endif; ?>
<div class='row' id="home">
  <?php if(isset($categorias)): ?>
  <?php $classcontents = "large-10 columns"; ?>
  <aside id="categorias" class='large-2 columns'>
    <ul id="cat-menu">
      <li class="menu-cat button">
        <input type="hidden" value="0">
        <div>Todas las categorías</div>
        <ul class="cataccordion">
          <?= $categorias ?>
        </ul>
      </li>
    </ul>
  </aside>
  <?php else: ?>
  <?php $classcontents = "large-center columns"; ?>
  <?php endif; ?>
  <div class="large-10 columns" id='contents'>
    <?= $contents ?>
  </div>
</div>