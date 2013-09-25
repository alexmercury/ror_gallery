require 'pusher'

module PusherRails

  extend self

  Pusher.logger = Rails.logger

  Pusher.key = Settings.pusher.app_key
  Pusher.secret = Settings.pusher.app_secret
  Pusher.app_id = Settings.pusher.app_id

  Pusher.host   = Settings.pusher.host
  Pusher.port   = Settings.pusher.api_port

  #Pusher.url = "http://#{Settings.pusher.app_key}:#{Settings.pusher.app_secret}@api.pusherapp.com/apps/#{Settings.pusher.app_id}"

  def trigger
    Pusher['test_channel'].trigger('my_event', {
        message: 'hello world'
    })
  end

  def comment_add(data = {})
    Pusher['comments_channel'].trigger('comment_event', data)
  end

end