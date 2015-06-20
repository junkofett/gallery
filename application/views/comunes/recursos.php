<script type="text/javascript" src=<?= base_url().'js/jquery-1.11.2.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/foundation.min.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/vendor/modernizr.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/raty/jquery.raty.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/jquery.validate.min.js'?>></script>

<?php if(!$this->session->userdata('id')): ?>
<div id="reg-login" class="reveal-modal text-center" data-reveal aria-labelledby="modalTitle" aria-hidden="true" role="dialog">
  <h3 id="modalTitle">Debes estar logueado para realizar esta acción</h3>
  <?= anchor('/usuarios/registro', '<button class="button">Registrate!</button>') ?>
  <a class="close-reveal-modal" aria-label="Close">&#215;</a>
</div>
<?php endif; ?>
<script type="text/javascript">
  $(document).foundation();
  $("form").validate();

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
        if(data == 0){
          cont.hide();
        }else{
          cont.show();
          cont.html(data);
        }
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
        $('.clearing-thumbs').data('categoria', ev.prev('input').val());
        $('.clearing-thumbs').data('offset', 8);

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


  function paginacion(){

    $(window).scroll(function() {
      if($(window).scrollTop() + $(window).height() == $(document).height()){
        var offset    = $('.clearing-thumbs').data('offset');
        var categoria = $('.clearing-thumbs').data('categoria');
        var gal_type  = $('#gal_type').attr('name');

        switch(gal_type){
          case 'hashtag_id': var hashtag_id = $('#gal_type').val();
                             var favs_nick  = null;
                             var user_perf  = null;
                             break;
          case 'favs_nick' : var favs_nick  = $('#gal_type').val();
                             var hashtag_id = null;
                             var user_perf  = null;
                             break;
          case 'user_perf' : var favs_nick  = null;
                             var hashtag_id = null;
                             var user_perf  = $('#gal_type').val();
                             break;
          default:
            var hashtag_id = null;
            var fav_nick   = null;
            var user_perf = null;
        }

        console.log('gal_type '+gal_type);
        console.log('hashtag_id '+hashtag_id);
        console.log('favs_nick '+favs_nick);

        console.log('offset '+offset);
        console.log('cat id '+categoria);
        console.log('user_perf '+user_perf);

        $.ajax({
          url: "<?= base_url() . 'index.php/ajax/scroll_load' ?>",
          data: { '<?= $this->security->get_csrf_token_name(); ?>' :
                    '<?= $this->security->get_csrf_hash(); ?>',
                  "offset"     : offset,
                  "cat_id"     : categoria,
                  "hashtag_id" : hashtag_id,
                  "favs_nick"  : favs_nick,
                  "user_perf"  : user_perf
                },
          type: 'POST',
          async: true,
          success: function(data) {
            console.log(data);
            var imagenes = $(data).find('.prev');
            $('.clearing-thumbs').append(imagenes);
            favoritear();
            ref_raty();
          }
        });

        $('.clearing-thumbs').data('offset', (offset + 8));
      }
    });
  }

  centrarForm();
  paginacion();
  favoritear();
  ref_raty();


  $('.clearing-thumbs').data('offset', 8);
  $('.clearing-thumbs').data('categoria', 0);

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

    $.ajax({
        url: "<?= base_url() . 'index.php/ajax/get_parents/' ?>"+ ev.prev('input').val(),
        data: { '<?= $this->security->get_csrf_token_name(); ?>' :
                  '<?= $this->security->get_csrf_hash(); ?>',
                "offset" : $('.clearing-thumbs').data('offset'),
                "cat_id" : $('.clearing-thumbs').data('categoria')
              },
        type: 'GET',
        async: false,
        success: function(data) {
          data =  $.parseJSON(data);
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

        }
      });

   /* $.getJSON("<?= base_url() . 'index.php/ajax/get_parents/' ?>"+ ev.prev('input').val(),
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
    });*/

    //$('.cat-open').slideToggle();
    if ($(this).parent().has("ul").hasClass('.cat-open')){
      e.preventDefault();
    }

    $('.cat-open').each(function(){
      $(this).slideDown();
    });

    //guarda en el data id de la categoria
    $('.clearing-thumbs').data('categoria', ev.prev('input').val());
    //reset de offset
    $('.clearing-thumbs').data('offset', 8);

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

        $('#gal_type').attr('name', 'user_perf');

        console.log($('#gal_type').attr('name'));
        console.log($('#gal_type').attr('value'));


        $('.clearing-thumbs').data('offset', 8);
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
        
        $('#gal_type').attr('name', 'favs_nick');

        console.log($('#gal_type').attr('name'));
        console.log($('#gal_type').attr('value'));


        $('.clearing-thumbs').data('offset', 8);
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

        
        $('.clearing-thumbs').data('offset', 8);
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
      }

      reset_cont();
    }
  });

  $('.rem-hash').on('click', function(){
    if(is_logged()){
      var img_id  = $(this).find('input[name=img_id]').val();
      var hash_id = $(this).find('input[name=hash_id]').val();

      $.ajax({
        url: "<?= base_url() . 'index.php/ajax/borrar_hash' ?>",
        data: { '<?= $this->security->get_csrf_token_name(); ?>' : 
                        '<?= $this->security->get_csrf_hash(); ?>',
                "img_id"  : img_id,
                "hash_id" : hash_id},
        type: 'POST',
        async: false,
        success: function(data) {
          console.log(data);
        }
      });
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

  $('.notif-close').on('click', function(){
    if(!is_logged()){
      $('#reg-login').foundation('reveal', 'open');
    }else{
      var ev       = $(this);
      var notif_id = ev.parent().find('input').val();

      $.ajax({
        url: "<?= base_url() . 'index.php/ajax/borrar_notif' ?>",
        data: { '<?= $this->security->get_csrf_token_name(); ?>' : 
                        '<?= $this->security->get_csrf_hash(); ?>',
                "notif_id" : notif_id},
        type: 'POST',
        async: false,
        success: function(data) {
          console.log(data);
        }
      });

      reset_cont();
    }
  });
</script>