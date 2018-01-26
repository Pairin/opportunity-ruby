module Opportunity
  module APIActions
    module Updatable

      def update(params={})
        validate_param_format!(params)

        params = {klass.object_key => params}.to_json
        update_response = handle_response(request(:put, klass.singular_resource_url(self.id), params))
        klass.new(update_response)
      end

      private

      def handle_response(response)
        parsed_response = JSON.parse(response.body)
        parsed_response[klass.object_key]
      end

      def validate_param_format!(params)
        if klass.update_format.nil?
          raise OpportunityError.new("Update Format not defined")
        else
          valid_format = ParamValidator.validate_value(params, klass.update_format)
          invalid_update_params if !valid_format
        end
      end

      def update_format
        nil
      end

      def invalid_update_params
        raise InvalidParametersError.new("Parameters don't match expected format #{klass.update_format}")
      end

      def klass
        self.class
      end

    end
  end
end
