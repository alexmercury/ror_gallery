commentHtml = (comment, user_name) ->
  div = '<div class="load-comment comment-div" style="display: none;">'\
  + '<span class="label label-inverse">'+user_name+'</span>'\
  + '<span class="label label-info label-right">'\
  + new Date(comment.created_at).toUTCFormat('%m-%d-%y at %H:%M')+'</span>'\
  + '<div class="well well-small">'\
  + comment.description + '</div></div>'
  return div

$(document).ready ->

  current_page = 1

  $(document).on "click", "#load_comment", ->
    current_page += 1
    pages = parseInt($(this).attr 'data-pages')
    if current_page <= pages
      comments_load = $.post "/load_comments",  {id: $(this).attr('picture_id'), page: current_page}
      comments_load.done (data) ->
        if data
          $.each data, (key, value) ->
            $(commentHtml(data[key], data[key].user.name)).insertAfter $("#load_comment")
            $(".picture-comments-container .comments-container .load-comment").slideDown "slow"
        if current_page == pages
          $("#load_comment").remove()

  $("#new_comment").on "ajax:success", (xhr, data, status) ->
    if data.error
      alert data.error
    else
      $("#comment_description").val('')
      $('#comments_count').text(parseInt($('#comments_count').text()) + 1)
      $(".picture-comments-container .comments-container").append commentHtml(data, data.user.name)
      $(".picture-comments-container .comments-container .load-comment").show ->
        $(".picture-comments-container").scrollTop $(".comments-container").height()
        if $(".comment-div").length == 6
          $(".comment-div")[0].remove()

  pusher = new PusherRails("comments_channel")
  pusher.channelBind.bind "comment_event", (data) ->
    if $("#comment_picture_id").val().toString() == data.comment.picture_id.toString()
      unless data.user_name.toString() == $("#userModalLabel").text()
        $('#comments_count').text(parseInt($('#comments_count').text()) + 1)
        $(".picture-comments-container .comments-container").append commentHtml(data.comment, data.user_name)
        $(".picture-comments-container .comments-container .load-comment").show ->
          $(".picture-comments-container").scrollTop $(".comments-container").height()
          if $(".comment-div").length == 6
            $(".comment-div")[0].remove()