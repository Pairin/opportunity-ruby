module Opportunity
  module APIActions
    module Creatable

      def create(params={})
        params = {"#{object_key}": params}
        creation_response = handle_response(request(:post, resource_url, params))
        new(creation_response)
      end

      private

      def handle_response(response)
        parsed_response = JSON.parse(response.body)
        parsed_response[object_key]
      end

    end
  end
end
