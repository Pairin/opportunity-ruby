module Opportunity
  module APIActions
    module Creatable

      def create(params={})
        validate_param_format!(params)

        params = {object_key => params}.to_json
        creation_response = handle_response(request(:post, resource_url, params))
        new(creation_response)
      end

      private

      def handle_response(response)
        parsed_response = JSON.parse(response.body)
        parsed_response[object_key]
      end

      def validate_param_format!(params)
        if creation_format.nil?
          raise OpportunityError.new("Creation Format not defined")
        else
          valid_format = ParamValidator.validate_value(params, creation_format)
          invalid_creation_params if !valid_format
        end
      end

      def creation_format
        nil
      end

      def invalid_creation_params
        raise InvalidParametersError.new("Parameters don't match expected format #{creation_format}")
      end

    end
  end
end
