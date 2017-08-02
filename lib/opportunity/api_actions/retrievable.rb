module Opportunity
  module APIActions
    module Retrievable

      def retrieve(id)
        resource_response = request_resource(id)
        initialize_resource(resource_response)
      end

      def singular_resource_url(id)
        "#{self.resource_url}/#{id}"
      end

      private

      def request_resource(id)
        response = request(:get, singular_resource_url(id))
        parsed_response = JSON.parse(response.body)
      end

      def initialize_resource(response)
        container_key = response.keys[0]
        new(response[container_key])
      end

    end
  end
end
