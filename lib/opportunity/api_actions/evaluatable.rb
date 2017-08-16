module Opportunity
  module APIActions
    module Evaluatable

      def evaluate(params={})
        handle_response(self.class.request(:post, evaluation_url, params))
      end

      def evaluation_url
        self.class.singular_resource_url(self.id) + 'evaluate'
      end

      private

      def handle_response(response)
        parsed_response = JSON.parse(response.body)
        true
      end

    end
  end
end
