<ul class='clearing-thumbs small-block-grid-4'>
<?php foreach ($imagenes as $imagen): ?>
  <li class='prev'>
    <?= img($imagen['thumb_url']) ?>
    <p>por <?= $imagen['nick'] ?></p>
  </li>
<?php endforeach ?>
</ul>