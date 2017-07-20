require 'net/http'

module Opportunity
  class Client

    def initialize
    end

    class << self

      def active_client
        @active_client ||= Client.new
      end

    end

    def execute_request(method, url, params={}, opts={})
      api_response = ''

      url_for_request = finalized_url(url, params)
      uri = URI(url_for_request)

      Net::HTTP.start(uri.host, uri.port,
        use_ssl: uri.scheme == 'https') do |http|

        request = Net::HTTP::Get.new(uri.request_uri)
        request['Authorization'] = "Token token=#{'pairin'}"

        api_response = http.request(request)
      end

      if api_response.code != "200"
        raise api_error(api_response)
      end

      api_response
    end

    def finalized_url(url, params)
      Opportunity.api_base + url + Util.parameterize_hash(params)
    end

    private

    def api_error(response)
      ApiError.new(response.message, response.code)
    end
  end
end
