module Opportunity
  module APIActions
    module List

      ACCEPTABLE_LIST_PARAMS = %w(limit offset)
      LIMIT_DEFAULT = 25
      OFFSET_DEFAULT = 0
      PAGINATION_KEY = 'pagination'

      def list(params={}, opts={})
        params = Util.stringify_keys(default_params.merge!(params))
        response = request(:get, self.resource_url, accepted_params(params), opts)
        parsed_response = JSON.parse(response.body)
        attrs = params.merge!(response.each_header.inject({}){|summ, (k,v)| summ[k] = v; summ})
        initialize_list(parsed_response, attrs)
      end

      def initialize_list(response, attrs={})
        response_keys = response.keys
        if response_keys.include?(PAGINATION_KEY)
          attrs.merge!(response[PAGINATION_KEY])
        end

        response_list = response[response.keys[0]]
        response_list = response_list.map do |rl|
          self.new(rl)
        end

        ResultSet.new(response_list, attrs)
      end

      def accepted_params(params)
        params.reject do |k,v|
          !(ACCEPTABLE_LIST_PARAMS | custom_accepted_params).include?(k.to_s) || !v
        end
      end

      def custom_accepted_params
        []
      end

      def default_params
        {
          offset: OFFSET_DEFAULT,
          limit: LIMIT_DEFAULT
        }
      end

    end
  end
end
