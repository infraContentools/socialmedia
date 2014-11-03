require 'koala'

module Socialmedia
  class FacebookApi
    @secret = nil
    def initialize(token,_secret=nil)
      @secret = _secret
      @me = Koala::Facebook::API.new(token,@secret)
    end

    # post without image on wall
    def publishPost(message,options)
      @me.put_wall_post(message,options)
    end

    # post with image on wall
    def publishWithMedia(mediaFile, options )
      @me.put_picture(mediaFile,options)
    end

    #post without image on company page
    def publishPostOnCompanyPage(pageID,message,options)
      pageToken = @me.get_page_access_token(pageID)
      companyPage = Koala::Facebook::API.new(pageToken)
      companyPage.put_wall_post(message,options)
    end

    #post with image on company page
    def publishWithMediaOnCompanyPage(pageID,mediaFile,options)
      pageToken = @me.get_page_access_token(pageID)
      companyPage = Koala::Facebook::API.new(pageToken,@secret)
      companyPage.put_picture(mediaFile,options)
    end

    def self.renewToken app_id, secret, token
        oauth = Koala::Facebook::OAuth.new(app_id, secret)
        new_access_info = oauth.exchange_access_token_info token
        return new_access_info
    end
  end
end