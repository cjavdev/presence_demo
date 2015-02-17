require 'pusher'

url =  "http://#{ ENV['pusher_key'] }:#{ ENV['pusher_secret'] }@api.pusherapp.com/apps/107152"
Pusher.url = url
Pusher.logger = Rails.logger
