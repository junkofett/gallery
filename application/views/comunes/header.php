<header>
  <nav class="top-bar" data-topbar role="navigation">
    <ul class="title-area">
      <li class="name">
        <h1><?= anchor('inicio', 'gallery') ?></h1>
      </li>
       <!-- Remove the class "menu-icon" to get rid of menu icon. 
       Take out "Menu" to just have icon alone -->
      <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
    </ul>
  
    <section class="top-bar-section">
      <!-- Right Nav Section -->
      <ul class="right">
        
          <?php if($this->session->userdata('usuario') != NULL): ?>
            <li class="has-dropdown">
              <a href="#"><?= $this->session->userdata('nick') ?></a>
              <ul class="dropdown">
                <li><a href="#">Editar Perfil</a></li>
                <li><?= anchor('upload', 'Subir Imagen') ?></li>
                <li><?= anchor('usuarios/logout', 'Logout') ?></li>
              </ul>
            </li>
          <?php else: ?>
            <li><?= anchor('usuarios/login', 'Login') ?></li>
            <li class="hide">prueba</li>
          <?php endif; ?>
      </ul>
    </section>
  </nav>
</header>