<header>
  <div class="fixed">
    <nav class="top-bar" data-topbar role="navigation">
      <ul class="title-area">
        <li class="name">
          <h1 class="show-for-medium-up"><?= anchor('inicio', img(base_url().'images/logo.svg')) ?></h1>
          <h1 class="show-for-small-only"><?= anchor('inicio', img(base_url().'images/imagotipo.svg')) ?></h1>
        </li>
         <!-- Remove the class "menu-icon" to get rid of menu icon. 
         Take out "Menu" to just have icon alone -->
        <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
      </ul>
    
      <section class="top-bar-section">
        <!-- Right Nav Section -->
        <ul class="right">
          
            <?php if($this->session->userdata('nick') != NULL): ?>
              <li class="has-dropdown">
                <a href="#"><?= $this->session->userdata('nick') ?></a>
                <ul class="dropdown">
                  <li><a href="#">Editar Perfil</a></li>
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