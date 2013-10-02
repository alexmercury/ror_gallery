commentHtml = (comment) ->
  div = '<div class="load-comment comment-div" style="display: none;">'\
  + '<span class="label label-inverse">'+comment.user.name+'</span>'\
  + '<span class="label label-info label-right">'\
  + new Date(comment.created_at).toUTCFormat('%m-%d-%y at %H:%M')+'</span>'\
  + '<div class="well well-small">'\
  + comment.description + '</div></div>'
  return div

$(document).ready ->

  current_page = 1

  $(document).on "click", "#load_comment", ->
    current_page += 1
    pages = parseInt($(this).attr 'pages')
    if current_page <= pages
      comments_load = $.post "/load_comments",  {id: $('#comment_picture_id').attr('value'), page: current_page}
      comments_load.done (data) ->
        if data
          $.each data, (key, value) ->
            $(commentHtml(data[key])).insertAfter $("#load_comment")
            $(".picture-comments-container .comments-container .load-comment").slideDown "slow"
        if current_page == pages
          $("#load_comment").remove()

  $("#new_comment").on "ajax:success", (xhr, data, status) ->
    if data.error
      alert data.error
    else
      $("#comment_description").val('')
      $('#comments_count').text(parseInt($('#comments_count').text()) + 1)
      $(".picture-comments-container .comments-container").append commentHtml(data)
      $(".picture-comments-container .comments-container .load-comment").show ->
        $(".picture-comments-container").scrollTop $(".comments-container").height()
        if $(".comment-div").length == 6
          $(".comment-div")[0].remove()