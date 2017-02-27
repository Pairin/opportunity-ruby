module Opportunity
  class Client
    attr_accessor :conn

    def initialize()
      self.conn = self.class.connection
    end

    def self.active_client
      @active_client ||= Client.new
    end

    def self.connection
      @conn ||= Faraday.new
    end

    def execute_request(method, url, params={}, opts={})
      response = conn.send(method, finalized_url(url, params))

      response
    end

    def finalized_url(url, params)
      Opportunity.api_base + url + Util.parameterize_hash(params)
    end

  end
end