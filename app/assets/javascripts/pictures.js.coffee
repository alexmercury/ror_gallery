getImgSize = (imgSrc, element) ->
  newImg = new Image()
  newImg.onload = ->
    height = newImg.height
    width = newImg.width
    # Size Slider Item 256X256
    if (width / 256) <= (height / 256)
      element.attr "style", "height: 100%;"
    else
      element.attr "style", "width: 100%;"
      unless (element.attr('alt')).toString() == 'slider-img'
        margin = (256 - (256 * height / width))/2.56
        element.attr "style", "margin-top:" + margin + "%;"

  newImg.src = imgSrc
  true

current_page = 1

commentLoadHtml = (comment) ->
  div = '<div>'\
  + '<span class="label">'+comment.user.name+'</span>'\
  + '2013-09-30 13:03:14 UTC'\
  + '<div class="well well-small">'\
  + comment.description + '</div></div>'
  div

$(document).ready ->

  $("#featured ul").roundabout
    easing: "easeOutInCirc"
    duration: 1000

  $("#featured ul li img").each ->
    getImgSize $(this).attr("src"), $(this)
    true

  $("img").load ->
    $(".picture-comments-container").attr 'style', 'height:'+$(".picture-show-container").height()+'px;'

  $(document).on "click", "#load_comment", ->
    current_page += 1
    pages = parseInt($(this).attr 'pages')

    if current_page <= pages
      comments_load = $.post "/load_comments",  {id: $('#comment_picture_id').attr('value'), page: current_page}
      comments_load.done (data) ->
        if data
          $.each data, (key, value) ->
            $(commentLoadHtml(data[key])).insertBefore $("#load_comment")
        if current_page == pages
          $("#load_comment").remove()