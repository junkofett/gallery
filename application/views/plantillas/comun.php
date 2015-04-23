<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title><?=$titulo?></title>
</head>
<body>
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
                <li><a href="#">Subir Imagen</a></li>
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
  <div class='row'>
    <aside class='large-2 columns'>
      <?= $categorias ?>
    </aside>
    <div class='large-10 columns'>
      <?= $contents ?>
    </div>
  </div>
  <?= link_tag('css/foundation.css') ?>
  <?= link_tag('css/general.css') ?>
  <script type="text/javascript" src=<?= base_url().'js/jquery-1.11.2.js'?>></script>
  <script type="text/javascript" src=<?= base_url().'js/foundation.min.js'?>></script>
  <script type="text/javascript">
    $(document).foundation();

    $('.categoria').on('click', function (event){
      console.log(event);
    });

    /*$( document ).on( "click", ".categoria", function() {     
      var et = $(this);
      
      $.post("<?= base_url() . 'index.php/ajax/lista_categorias/' ?>"+ et.find('input').val(),
        {'<?= $this->security->get_csrf_token_name(); ?>' : 
         '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
          et.append(data);
      });
    });*/

    /*$('li').on('click', function(){
      var et = $(this);

      console.log(et);

      $.post("<?= base_url() . 'index.php/ajax/lista_categorias/' ?>"+ et.find('input').val(),
        {'<?= $this->security->get_csrf_token_name(); ?>' : 
         '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
          et.append(data);
      });
    });*/
  </script>
</body>
</html>