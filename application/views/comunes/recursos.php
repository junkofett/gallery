<?= link_tag('css/foundation.css') ?>
<?= link_tag('css/general.css') ?>
<?= link_tag('css/font-awesome-4.3.0/css/font-awesome.min.css') ?>
<?= link_tag('js/raty/jquery.raty.css') ?>
<script type="text/javascript" src=<?= base_url().'js/jquery-1.11.2.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/foundation.min.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/raty/jquery.raty.js'?>></script>
<script type="text/javascript">
  $(document).foundation();
  
  function ref_raty(){
    $('.raty').raty({
      path: "<?= base_url().'js/raty/images'?>",
      space: false,
      score: function() {
        return $(this).attr('data-score');
      }
    });
  }

  ref_raty();

  $('#contents').slideDown(300);

  $("#cat-menu div").on("click", function (e) {
    var ev = $(this);

    $('#contents').slideUp(300, function(){
      $('.clearing-thumbs').remove();
      $.post("<?= base_url() . 'index.php/ajax/imgs_por_cat/' ?>"+ ev.prev('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        
        $('#contents').append(data);
        ref_raty();
        $('#contents').slideDown(300);
      });
    });

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

  $('.sala-user').on('click', function () {
    var ev = $(this);

    $.post("<?= base_url() . 'index.php/ajax/imgs_by_user/' ?>"+ ev.find('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        //$('.clearing-thumbs').remove();
        $('.tabs-content').append(data);
    });
  });

  $('.raty').on('click', function(e){
    var ev     = $(this);
    var puntos = ev.find('input').val();
    var id     = $('#img_id').val();

    $.post("<?= base_url() . 'index.php/imagenes/puntuar/' ?>"+
                            id+"/"+ev.find('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        //$('.clearing-thumbs').remove();
          //ev.removeAttr('data-score');
          //ev.attr('data-score', data);
          //console.log(data);

    });
  });

  $('#insertarcomentario').on('click', function(){
    var ev     = $(this);
    var ncom   = $('#nuevocomentario').val();
    var img_id = $('#nuevocomentario').prev('input').val();

    if(ncom != ''){
      $.post("<?= base_url() . 'index.php/imagenes/comentar/' ?>"+
                            img_id+"/"+ncom,
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        $('#comentarios').prepend(data);
      });
    }else{
      alert('Debe rellenar el formulario');
    }
  });

  /*$('#sngl-img').css('height', function(){
    return $(window).height();
  });*/
</script>