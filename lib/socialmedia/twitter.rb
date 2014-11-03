require 'twitter'

module Socialmedia
  class TwitterApi
    def initialize(config)
      @me = Twitter::REST::Client.new(config)
    end
    def publish(message)
      @me.update(message)
    end
    def publishWithMedia(mediaFile,message)
      @me.update_with_media(message,File.new(mediaFile))
    end
  end
end