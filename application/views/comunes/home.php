<?php if(isset($categorias)): ?>
<div class="off-canvas-wrap" data-offcanvas>
  <div class="inner-wrap">
    <!-- Off Canvas Menu -->
    <aside class="left-off-canvas-menu hide-for-large">
        <!-- whatever you want goes here -->
      <ul class="off-canvas-list" id="offcanvas_cat">
        <li class="has-submenu">
          <input type="hidden" value="0">
          <a href="#">Todas las categorias</a>
          <ul class="left-submenu">
            <li class="back">
              <input type="hidden" value="0">
              <a href="#">atras</a>
            </li>
            <?= $offcanvas ?>
          </ul>
        </li>
      </ul>
    </aside>

    <!-- main content goes here -->
<?php endif; ?>

<?php if(isset($hashtag_nom)): ?>
<div class="row">
  <div class="large-text-center">
    <p id="hashtitle"><?= $hashtag_nom ?></p>
  </div>  
</div>
<?php endif; ?>

<?php if(isset($favs)): ?>
<div class="row">
  <div class="large-text-center">
    <p id="favstitle">Favoritos de <?= $favsnick ?></p>
  </div>  
</div>
<?php endif; ?>

<div class='row<?= (isset($favs) || isset($hashtag_nom) ? " margin-row" : "") ?>' id="home">
  <?php if(isset($categorias)): ?>
  <?php $classcontents = "large-10 columns"; ?>
  <aside id="categorias" class='large-2 columns show-for-large'>
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

<?php if(isset($categorias)): ?>
  <!-- close the off-canvas menu -->
  <a class="exit-off-canvas"></a>
</div>
</div>
<?php endif; ?>