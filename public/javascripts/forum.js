$(function () {

  $('a').bind('ajax:complete', function (e, xhr, status) {
    var data = $.parseJSON(xhr.responseText);
    $('#forum' + data.forum_id + '-post' + data.post_id + '-score').html(data.score);
  });
    
});
