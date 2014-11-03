require 'rest_client'

module Socialmedia
  API_PATH = "/ghost/api/v0.1"
  class GhostApi
    def initialize(username,password)
      options = {
          "username" => username,
          "password" => password,
          "grant_type" => "password",
          "client_id" => "ghost-admin"
      }
      @token = post("#{HOST_PATH}#{API_PATH}/authentication/token",{},options,{})
      puts @token
    end

    #publish article
    def publishArticle(contentObj)

    end

  end
end

HOST_PATH = "http://localhost:2368"