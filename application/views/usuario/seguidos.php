<ul class="dropdown large-text-center" id="seguidos-user">
  <?php foreach ($users as $user): ?>
    <li class="seguido"><?= anchor('usuarios/perfil/'.$user['nick'], $user['nick']) ?></li>
  <?php endforeach ?>
</ul>