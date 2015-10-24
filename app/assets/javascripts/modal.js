$(function(){
  $('#myModal').modal();

  $('.ajax-link').click(function(e){
    e.preventDefault();

    $.ajax($(this).data('link'), {
      success: function(data){
        $('.modal-dialog').find('.modal-content').html(data);
      },
      error: function(){
        alert('Falha ao fazer requisição!');
      }
    });
  });
});
