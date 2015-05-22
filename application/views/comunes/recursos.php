<?= link_tag('css/foundation.css') ?>
<?= link_tag('css/general.css') ?>
<script type="text/javascript" src=<?= base_url().'js/jquery-1.11.2.js'?>></script>
<script type="text/javascript" src=<?= base_url().'js/foundation.min.js'?>></script>
<script type="text/javascript">
  $(document).foundation();

  $("#cat-menu div").on("click", function (e) {
    var ev = $(this);

    $.post("<?= base_url() . 'index.php/ajax/imgs_por_cat/' ?>"+ ev.prev('input').val(),
      {'<?= $this->security->get_csrf_token_name(); ?>' : 
       '<?= $this->security->get_csrf_hash(); ?>'}, function(data){
        $('.clearing-thumbs').remove();
        $('#contents').append(data);
    });

    if ($(this).parent().has("ul")){
      e.preventDefault();
    }

    $(this).next('ul').slideToggle();
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
</script>