require 'pusher'

module PusherRails

  extend self

  Pusher.url = "http://#{Settings.pusher.app_key}:#{Settings.pusher.app_secret}@api.pusherapp.com/apps/#{Settings.pusher.app_id}"

  def trigger
    Pusher['test_channel'].trigger('my_event', {
        message: 'hello world'
    })
  end

  def comment_add(data = {})
    Pusher['comments_channel'].trigger('comment_event', data)
  end

end