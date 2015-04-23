<ul class='clearing-thumbs small-block-grid-4'>
<?php foreach ($imagenes as $imagen): ?>
  <li class='prev'>
    <?= img($imagen['img_url']) ?>
    <p>por <?= $imagen['nick'] ?></p>
  </li>
<?php endforeach ?>
</ul>