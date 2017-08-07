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

      url_for_request = method == :get ? finalized_url(url, params) : endpoint_url(url)
      uri = URI(url_for_request)

      Net::HTTP.start(uri.host, uri.port,
        use_ssl: uri.scheme == 'https') do |http|

        if method == :get
          request = Net::HTTP::Get.new(uri.request_uri)
        else
          request = Net::HTTP::Post.new(uri.request_uri)
          request.set_form_data(params)
        end

        request['Authorization'] = "Token token=#{'pairin'}"

        api_response = http.request(request)
      end

      if api_response.code != "200"
        raise api_error(api_response)
      end

      api_response
    end

    def finalized_url(url, params)
    endpoint_url(url) + Util.parameterize_hash(params)
    end

    def endpoint_url(url)
      Opportunity.api_base + url
    end

    private

    def api_error(response)
      ApiError.new(response.message, response.code)
    end
  end
end
