$(document).ready ->

  $(document).on 'click', '#like', ->
    like = $.post '/like',  {picture_id: $('#comment_picture_id').attr 'value'}
    like.done ->
      $('#like i').removeClass 'icon-thumbs-up'
      $('#like i').addClass 'icon-thumbs-down'
      button = $('#like')
      button.removeClass 'btn-info'
      button.addClass 'btn-danger'
      button.attr 'id','dislike'
      $('#likes_count').text(parseInt($('#likes_count').text()) + 1)
    false

  $(document).on 'click', '#dislike', ->
    dislike = $.post '/dislike',  {picture_id: $('#comment_picture_id').attr 'value'}
    dislike.done ->
      $('#dislike i').removeClass 'icon-thumbs-down'
      $('#dislike i').addClass 'icon-thumbs-up'
      button = $('#dislike')
      button.removeClass 'btn-danger'
      button.addClass 'btn-info'
      button.attr 'id','like'
      $('#likes_count').text(parseInt($('#likes_count').text()) - 1)
    false