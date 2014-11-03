require 'google/api_client'
require 'legato'
require 'oauth2'
require 'date'

module Socialmedia
  class Pageviews
    extend Legato::Model
    metrics :pageviews
    def self.query(profile, start_date, end_date)
      Pageviews.results(profile,
                        :start_date => start_date,
                        :end_date => end_date
      )
    end
  end
  class GanalyticsApi
    def initialize(email,file)
      @user = Legato::User.new(getAccessToken(email,file))
      @profile = @user.profiles.first
    end
    def getAccessToken(email,file)
      client = Google::APIClient.new(
          :application_name => "Some_Name",
          :application_version => "Some_Version"
      )
      scope="https://www.googleapis.com/auth/analytics.readonly"
      key = Google::APIClient::PKCS12.load_key(file, "notasecret")
      service_account = Google::APIClient::JWTAsserter.new(email, scope, key)
      client.authorization = service_account.authorize
      oauth_client = OAuth2::Client.new("", "", {
          :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
          :token_url => 'https://accounts.google.com/o/oauth2/token'
      })
      token = OAuth2::AccessToken.new(oauth_client, client.authorization.access_token)
    end
    def getPageViewInfo(startDate,endDate)
      Pageviews.query(@profile, startDate, endDate)
    end

  end
end




