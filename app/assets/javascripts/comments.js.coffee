commentHtml = (comment, user_name, flag) ->
  link = ''
  if flag != 0
    link = '<br>' + flag

  div = '<div class="load-comment comment-div" style="display: none;">'\
  + '<span class="label label-inverse">'+user_name+'</span>'\
  + '<span class="label label-info label-right">'\
  + new Date(comment.created_at).toUTCFormat('%m-%d-%y at %H:%M')+'</span>'\
  + '<div class="well well-small">'\
  + comment.description + link\
  +'</div></div>'
  return div

$(document).ready ->

  current_page = 1

  $(document).on 'click', '#load_comment', ->
    current_page += 1
    pages = parseInt($(this).attr 'data-pages')
    if current_page <= pages
      comments_load = $.post '/load_comments',  {id: $(this).attr('data-id'), page: current_page}
      comments_load.done (data) ->
        if data
          $.each data, (key, value) ->
            $(commentHtml(data[key], data[key].user.name)).insertAfter $('#load_comment')
            $('.picture-comments-container .comments-container .load-comment').slideDown 'slow'
        if current_page == pages
          $('#load_comment').remove()

  $('#new_comment').on 'ajax:success', (xhr, data, status) ->
    if data.error
      alert data.error
    else
      $('#comment_description').val('')
      $('#comments_count').text(parseInt($('#comments_count').text()) + 1)
      $('.picture-comments-container .comments-container').append commentHtml(data, data.user.name, 0)
      $('.picture-comments-container .comments-container .load-comment').show ->
        $('.picture-comments-container').scrollTop $('.comments-container').height()
        if $('.comment-div').length == 6
          $('.comment-div')[0].remove()

  pusher = new PusherRails('comments_channel')
  pusher.channelBind.bind 'comment_event', (data) ->
    if $('#comments-all').length > 0
      $('#comments-all').prepend commentHtml(data.comment, data.user_name, data.link)
      $('#comments-all .load-comment').show ->
        if $('#comments-all .comment-div').length >= 10
          $('#comments-all .comment-div:last').remove()
    if $('#picture').attr('data-id').toString() == data.comment.picture_id.toString()
      if data.user_name.toString() != $('#userModalLabel').attr('data-user-name').toString()
        $('#comments_count').text(parseInt($('#comments_count').text()) + 1)
        $('.picture-comments-container .comments-container').append commentHtml(data.comment, data.user_name, 0)
        $('.picture-comments-container .comments-container .load-comment').show ->
          $('.picture-comments-container').scrollTop $('.comments-container').height()
          if $('.comment-div').length == 6
            $('.comment-div')[0].remove()