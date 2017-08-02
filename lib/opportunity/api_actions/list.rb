module Opportunity
  module APIActions
    module List

      ACCEPTABLE_LIST_PARAMS = %w(page limit)

      def list(params={}, opts={})
        response = request(:get, self.resource_url, accepted_params(params), opts)
        parsed_response = JSON.parse(response.body)
        container_key = parsed_response.keys[0]

        initialize_list(parsed_response[container_key])
      end

      def initialize_list(response_list)
        response_list.map do |rl|
          self.new(rl)
        end
      end

      def accepted_params(params)
        params.reject do |k,v|
          !(ACCEPTABLE_LIST_PARAMS | custom_accepted_params).include?(k.to_s) || !v
        end
      end

      def custom_accepted_params
        []
      end

    end
  end
end
