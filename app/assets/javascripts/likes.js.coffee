$(document).ready ->

  $(document).on "click", "#like", ->
    $.post "/like",  {picture_id: parseInt $('#picture').attr 'alt'}

  $(document).on "click", "#dislike", ->
    $.post "/dislike",  {picture_id: parseInt $('#picture').attr 'alt'}