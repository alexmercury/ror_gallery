#= require active_admin/base

$(document).ready ->

  $(document).on "click", "#parse_win", ->
    alert 'Google'

  $(document).on "click", "#close_img", (event)->
    $(this).closest('tr').remove()

  $(document).on "click", "img", ->

    if newImg = new Image()

      newImg.src = $(this).attr 'src'

      height = newImg.height
      width = newImg.width

      $('#lightbox img').attr 'src', newImg.src
      $('#lightbox .img-box').attr 'height', (height+'px')
      $('#lightbox .img-box').attr 'width', (width+'px')

      $('#lightbox .img-box').attr 'style', ('margin-top: -'+(height/2)+'px; margin-left: -'+ (width/2)+'px;')

      $('#lightbox').show()

    true

  $(document).on "click", "#close_lightbox", ->
    $('#lightbox').hide()

  $(document).on "click", ".overlay", ->
    $('#lightbox').hide()