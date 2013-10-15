module PusherRails

  extend self

  def comment_add(data = {})
    begin
      Pusher['comments_channel'].trigger('comment_event', data)
    rescue Pusher::Error => e
      puts('Pusher::Error\n' + e.to_s)
      # (Pusher::AuthenticationError, Pusher::HTTPError, or Pusher::Error)
    end
  end

end