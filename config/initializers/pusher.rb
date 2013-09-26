require 'pusher'

Pusher.logger = Rails.logger
Pusher.key = Settings.pusher.app_key
Pusher.secret = Settings.pusher.app_secret
Pusher.app_id = Settings.pusher.app_id
Pusher.host   = Settings.pusher.host
Pusher.port   = Settings.pusher.api_port
#for pusher.com
#Pusher.url = "http://#{Settings.pusher.app_key}:#{Settings.pusher.app_secret}@api.pusherapp.com/apps/#{Settings.pusher.app_id}"

PusherRails.initialize(Pusher)