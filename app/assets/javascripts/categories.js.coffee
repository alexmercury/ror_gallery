$(document).ready ->

  $(document).on "click", ".subscribe", ->
    subscribe = $.post "/subscribe",  {category_id: $(this).attr 'id'}
    _self =  $(this)
    subscribe.success ->
      _self.removeClass 'subscribe'
      _self.addClass 'unsubscribe'
      _self.parent().parent().find('td:last').append '<img alt="Subscribe" src="/assets/subscribe.png" width="128">'
    false

  $(document).on "click", ".unsubscribe", ->
    unsubscribe = $.post "/unsubscribe",  {category_id: $(this).attr 'id'}
    _self =  $(this)
    unsubscribe.success ->
      _self.removeClass 'unsubscribe'
      _self.addClass 'subscribe'
      _self.parent().parent().find('td:last').html('')
    false