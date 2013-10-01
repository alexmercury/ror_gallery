commentLoadHtml = (comment) ->
  div = '<div class="load-comment" style="display: none;">'\
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
            $(commentLoadHtml(data[key])).insertAfter $("#load_comment")
            $(".picture-comments-container .load-comment").slideDown "slow"
        if current_page == pages
          $("#load_comment").remove()