#= require jquery
#= require jquery_ujs
#= require likes
#= require categories
#= require pusher
#= require pusher/pusher_rails

$(document).ready ->

  pusher = new PusherRails("comments_channel")
  pusher.channelBind.bind "comment_event", (data) ->
    alert data.user_name + "\n" + data.comment.description