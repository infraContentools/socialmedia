require 'linkedin'

module Socialmedia
  class LinkedInApi
    def initialize(config)
      @me = LinkedIn::Client.new(config[:consumer_key],config[:consumer_secret])
      @me.authorize_from_access(config[:access_token],config[:access_secret])
    end
    def publish(messageObj)
      @me.add_share(messageObj)
    end
    def publishOnCompanyPage(companyID,messageObj)
      @me.add_company_share(companyID, messageObj)
    end
    def publishOnGroupPage(groupID,messageObj)
      @me.add_group_share(groupID, messageObj)
    end
  end
end