# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

getImgSize = (imgSrc, element) ->
  newImg = new Image()
  newImg.onload = ->
    height = newImg.height
    width = newImg.width

    # Size Slider Item 256X256
    if (width / 256) <= (height / 256)
      element.attr "style", "height: 256px;"
    else
      element.attr "style", "width: 256px;"
      margin = (256 - (256 * height / width)) / 2
      element.attr "style", "margin-top:" + margin + "px;"

  newImg.src = imgSrc # this must be done AFTER setting onload
  true

$(document).ready -> #Start up our Featured Project Carosuel

  $("#featured ul").roundabout
    easing: "easeOutInCirc"
    duration: 1000

  $("#featured ul li img").each ->
    getImgSize $(this).attr("src"), $(this)
    true