module Opportunity
  module APIActions
    module Request

      def request(method, url, params={}, opts={})
        ::Opportunity.client.execute_request(method, url, params, opts)
      end

    end
  end
end
