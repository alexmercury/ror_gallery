#= require active_admin/base

$(document).ready ->

  $(document).on 'click', '#close_row', ->
    $(this).closest('tr').remove()

  $('form').bind 'ajax:success', ->
    $(this).closest('tr').attr 'style', 'background-color: rgba(20, 160, 17, 0.31);'
    category = $(this).find('#picture_category_id :selected').text()
    $(this).closest('td').replaceWith('<td class="img-add-ok"> Picture is successfully added to category: '+category+'</td>')
    true

  $(document).on 'click', 'img', ->

    if newImg = new Image()
      newImg.src = $(this).attr 'src'

      newImg.onload = ->

        $('#lightbox img').attr 'src', newImg.src

        height = newImg.height
        width = newImg.width

        screenWidth = $(window).width() - 200

        if width >  screenWidth
          $('#lightbox .img-box img').attr 'width', (screenWidth+'px')
          $('#lightbox .img-box').attr 'style', ('margin-top: -'+((height/(width / screenWidth))/2)+'px; margin-left: -'+ (screenWidth/2)+'px;')
        else
          $('#lightbox .img-box img').attr 'width', (width+'px')
          $('#lightbox .img-box').attr 'style', ('margin-top: -'+(height/2)+'px; margin-left: -'+ (width/2)+'px;')

        $('#lightbox').show()

    true

  $(document).on 'click', '#close_lightbox', ->
    $('#lightbox').hide()

  $(document).on 'click', '.overlay', ->
    $('#lightbox').hide()