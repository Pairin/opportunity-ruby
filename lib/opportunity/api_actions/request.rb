module Opportunity
  module APIActions
    module Request

      def request(method, url, params={}, opts={})
        client = Client.active_client
      
        client.execute_request(method, url, params, opts)
      end

    end
  end
end