getImgSize = (imgSrc, element) ->
  newImg = new Image()
  newImg.onload = ->
    height = newImg.height
    width = newImg.width
    # Size Slider Item 256X256
    if (width / 256) <= (height / 256)
      element.attr 'style', 'height: 100%;'
    else
      element.attr 'style', 'width: 100%;'
      unless (element.attr('alt')).toString() == 'slider-img'
        margin = (256 - (256 * height / width))/2.56
        element.attr 'style', 'margin-top:' + margin + '%;'
  newImg.src = imgSrc
  true

$(document).ready ->

  $('#featured ul').roundabout
    easing: 'easeOutInCirc'
    duration: 1000

  $('#featured ul li img').each ->
    getImgSize $(this).attr('src'), $(this)
    true

  $('img').load ->
    $('.picture-comments-container').attr 'style', 'height:'+$('.picture-show-container').height()+'px;'