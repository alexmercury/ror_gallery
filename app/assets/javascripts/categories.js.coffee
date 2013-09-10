$(document).ready ->

  $(".subscribe").click ->
    $.post "/subscribe",  {category_id: $(this).attr 'id'}
    false

  $(".unsubscribe").click ->
    $.post "/unsubscribe",  {category_id: $(this).attr 'id'}
    false