<header>
  <div class="fixed">
    <nav class="top-bar" data-topbar role="navigation">
      <ul class="title-area">
        <li class="name">
          <h1 class="show-for-large"><?= anchor('inicio', img('images/logo.svg')) ?></h1>
          <h1 class="hide-for-large"><?= anchor('inicio', img('images/imagotipo.svg'),
                    ['class' => "left-off-canvas-toggle"]) ?></h1>
        </li>
         <!-- Remove the class "menu-icon" to get rid of menu icon. 
         Take out "Menu" to just have icon alone -->
        <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
      </ul>
    
      <section class="top-bar-section">
        <!-- Right Nav Section -->
        <ul class="right">
          <?php if($this->Usuario->is_logged() != NULL): ?>
            <li class="has-dropdown">
              <a href="#" id="notificaciones"> <i class="fa fa-server"></i> 
                <?php if (isset($cont_noti) ): ?>
                  <span class="badge" id="cont-noti"><?= $cont_noti ?></span>
                <?php endif; ?>
              </a>
            <?php if(isset($notificaciones)): ?>
              <ul class="dropdown" id="lista_notif">
                <?php foreach ($notificaciones as $noti): ?>
                  <li> 
                    <div data-alert class="alert-box">
                      <?= form_hidden('notif_id', $noti['id']) ?>
                      <?= anchor($noti['notif_url'], $noti['texto']) ?> 

                       <a href="#" class="close notif-close">&times;</a>
                    </div>
                  </li>
                <?php endforeach; ?>
              </ul>
            <?php endif; ?>
            </li>
            <li class="has-dropdown">
              <a href="#"><?= $this->session->userdata('nick') ?></a>
              <ul class="dropdown">
                <?php if($this->Usuario->is_admin()): ?>
                <li><?= anchor('admin/usuarios', 'Administrar Usuarios') ?></li>
                <li><?= anchor('admin/categorias', 'Administrar Categorias') ?></li>
                <li><?= anchor('chapus/rand_time', 'Randomizar Fechas') ?></li>
                <?php endif; ?>
                <li><?= anchor('usuarios/perfil/'.$this->session->userdata('nick'), 'Ver Perfil') ?></li>
                <li><?= anchor('imagenes/favoritos', 'Ver Favoritos') ?></li>
                <li><?= anchor('imagenes/upload', 'Subir Imagen') ?></li>
                <li><?= anchor('usuarios/logout', 'Logout') ?></li>
              </ul>
            </li>
          <?php else: ?>
            <li class="has-dropdown">
              <a href="#">Login</a>
              <ul class="dropdown">
                <li>
                  <?= $menu_opt ?>
                </li>
              </ul>  
            </li>
          <?php endif; ?>
        </ul>
      </section>
    </nav>
  </div>
</header>