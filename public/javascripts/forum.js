$(function () {

  $('a').live('ajax:success', function (e, data) {
    $('#forum' + data.forum_id + '-post' + data.post_id + '-score').html(data.score);
  });
    
});
