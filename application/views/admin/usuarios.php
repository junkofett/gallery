<section role="main" class="scroll-container">
  <div class="row">
    <div class="large-text-center columns">
      <?= form_open('admin/usuarios') ?>
      <?= form_label('buscar usuario', 'user_like') ?>
      <?= form_input(['name'     => 'user_like',
                      'required' => 'required']) ?>
      <?= form_submit(['name'  => 'busca_usuario', 
                       'value' => 'Buscar',
                       'class' => 'button']) ?>
      <?= form_close() ?>
    </div>
  </div>

  <div class="row">
    <div class="small-3 large-centered columns" id="admin-users">
      <?php foreach ($users as $user): ?>
        <div class="row user-admin">
            <?= anchor('usuarios/perfil/'.$user['nick'], $user['nick'], ['class' => 'left']) ?>
            <?= anchor('admin/borrar_user/'.$user['nick'], 'Borrar usuario',['class' => 'button right']) ?>          
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>