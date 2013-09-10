$(document).ready ->

  $(document).on "click", "#like", ->
    $.post "/like",  {picture_id: $('#comment_picture_id').attr 'value'}

  $(document).on "click", "#dislike", ->
    $.post "/dislike",  {picture_id: $('#comment_picture_id').attr 'value'}