<?= link_tag('css/foundation.css') ?>
<?= link_tag('css/general.css') ?>
<?= link_tag('css/font-awesome-4.3.0/css/font-awesome.min.css') ?>
<?= link_tag('js/raty/jquery.raty.css') ?>
<script type="text/javascript" src=<?= base_url().'js/jquery-1.11.2.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/foundation.min.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/raty/jquery.raty.js'?>></script>
<div id="reg-login" class="reveal-modal text-center" data-reveal aria-labelledby="modalTitle" aria-hidden="true" role="dialog">
  <h3 id="modalTitle">Debes estar logueado para realizar esta acción</h3>
  <?= anchor('/usuarios/registro', '<button class="button">Registrate!</button>') ?>
  <a class="close-reveal-modal" aria-label="Close">&#215;</a>
</div>
<script type="text/javascript">
  $(document).foundation();

  function is_logged(){
    var is_logged = false;

    $.ajax({
      url: "<?= base_url() . 'index.php/ajax/is_logged' ?>",
      data: {
              '<?= $this->security->get_csrf_token_name(); ?>': '<?= $this->security->get_csrf_hash(); ?>'
            },
      type: 'POST',
      async: false,
      success: function(data) {
        if(data == 1) {
          is_logged = true;
        }
      }

    });

    return is_logged;
  }
  
  function ref_raty(){
    $('.raty').raty({
      path: "<?= base_url().'js/raty/images'?>",
      space: false,
      score: function() {
        return $(this).attr('data-score');
      }
    });
  }

  function favoritear(){
    $('.fav-button').on('click', function(){
      if(!is_logged()){
        $('#reg-login').foundation('reveal', 'open');
      }else{
        var ev = $(this);
        var img_id = ev.parent().parent().parent().find('.img_id').val();
  
        $.ajax({
            url: "<?= base_url() . 'index.php/ajax/add_fav' ?>",
            data: { '<?= $this->security->get_csrf_token_name(); ?>' : 
                            '<?= $this->security->get_csrf_hash(); ?>',
                    "img_id" : img_id},
            type: 'POST',
            async: false,
            success: function(data) {
  
            }
        });
      }
    });
  }

  function reset_cont(){
    var cont = $('#cont-noti');
    
    $.ajax({
      url: "<?= base_url() . 'index.php/ajax/get_cont_notif' ?>",
      data: { '<?= $this->security->get_csrf_token_name(); ?>' :
                '<?= $this->security->get_csrf_hash(); ?>'
            },
      type: 'POST',
      success: function(data) {
        cont.html(data);
      }
    });

  }

  function update_gallery(ev){
    $('#contents').slideUp(300, function(){
      $('.clearing-thumbs').remove();
      $.post("<?= base_url() . 'index.php/ajax/imgs_por_cat/' ?>"+ ev.prev('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        
        $('#contents').append(data);
        ref_raty();
        favoritear();
        $('#contents').slideDown(300);
      });
    });
  }

  function centrarForm() {
    $("#cont-form").css({
      "top": (($('#reg-form').height() / 2) - ($('#cont-form').height() / 2)) + "px",
      "left": (($('#reg-form').width() / 2) - ($('#cont-form').width() / 2)) + "px"
    });

  }

  centrarForm();
  favoritear();
  ref_raty();

  $(window).resize(function() {
    centrarForm();
  });

  $('#contents').slideDown(300);

  $('#offcanvas_cat a').on('click', function(e) {
    var ev = $(this);

    update_gallery(ev);
  });

  $("#cat-menu div").on("click", function (e) {
    var ev = $(this);

    update_gallery(ev);

    $.getJSON("<?= base_url() . 'index.php/ajax/get_parents/' ?>"+ ev.prev('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){

        $('.menu-cat').removeClass('cat-active');
        $('.cataccordion').removeClass('cat-open');

        $('#cat-menu input').each(function(){
          var cat = $(this);

          $.each(data, function(e, v){
            if(cat.val() == v){
              cat.parent().addClass('cat-active');
              cat.parent().parent().addClass('cat-open');
            }
          });
        }); 
    });

    //$('.cat-open').slideToggle();
    if ($(this).parent().has("ul").hasClass('.cat-open')){
      e.preventDefault();
    }

    $('.cat-open').each(function(){
      $(this).slideDown();
    });

    $(this).next('ul').slideDown();
  });

//------------------------------------------------------------------------PERFIL

  $('.sala-user').on('click', function () {
    var ev = $(this);

    $.post("<?= base_url() . 'index.php/ajax/imgs_by_user/' ?>"+ ev.find('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        $('.clearing-thumbs').remove();
        $('#seguidos-user').remove();
        $('.tabs-content').append(data);

        favoritear();
        ref_raty();
    });
  });

  $('.favs-user').on('click', function () {
    var ev = $(this);

    $.post("<?= base_url() . 'index.php/ajax/favs_by_user/' ?>"+ ev.find('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        $('.clearing-thumbs').remove();
        $('#seguidos-user').remove();
        $('.tabs-content').append(data);

        favoritear();
        ref_raty();
    });
  });

  $('.follows-user').on('click', function () {
    var ev = $(this);

    $.post("<?= base_url() . 'index.php/ajax/users_seguidos/' ?>"+ ev.find('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        $('.clearing-thumbs').remove();
        $('#seguidos-user').remove();
        $('.tabs-content').append(data);        
    });
  });

  $('.raty').on('click', function(e){
    if(!is_logged()){
      $('#reg-login').foundation('reveal', 'open');
    }else{
      var ev     = $(this);
      var puntos = ev.find('input').val();
      var id     = ev.parent().parent().find('.img_id').val();

      $.ajax({
        url: "<?= base_url() . 'index.php/imagenes/puntuar' ?>",
        data: { '<?= $this->security->get_csrf_token_name(); ?>' : '<?= $this->security->get_csrf_hash(); ?>',
                "img_id"      : id,
                "puntuacion"  : puntos},
        type: 'POST',
        async: false,
        success: function(data) {
          //$('.clearing-thumbs').remove();
            //ev.removeAttr('data-score');
            //ev.attr('data-score', data);
            //console.log(data);
        }
      });
    }
  });

  $('#insertarcomentario').on('click', function(){
    if(!is_logged()){
      $('#reg-login').foundation('reveal', 'open');
    }else{
      var ev     = $(this);
      var ncom   = $('#nuevocomentario').val();
      var img_id = $('#nuevocomentario').prev('input').val();

      if(ncom != ''){
        $.ajax({
          url: "<?= base_url() . 'index.php/imagenes/comentar' ?>",
          data: { '<?= $this->security->get_csrf_token_name(); ?>' : 
                          '<?= $this->security->get_csrf_hash(); ?>',
                  "img_id" : img_id ,
                  "texto"  : ncom},
          type: 'POST',
          async: false,
          success: function(data) {
            $('#comentarios').prepend(data);
            $('#nuevocomentario').val('');
          }
        });
      }else{
        alert('Debe rellenar el formulario');
      }

      reset_cont();
    }
  });

  $('.seguir').on('click', function(){
    if(!is_logged()){
      $('#reg-login').foundation('reveal', 'open');
    }else{
      var ev   = $(this);
      var nick = ev.find('input').val();

      $.post("<?= base_url() . 'index.php/ajax/seguir_usuario/' ?>"+nick,
        {'<?= $this->security->get_csrf_token_name(); ?>' : 
         '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
          ev.html('Siguiendo');
      });
    }
  });
</script>