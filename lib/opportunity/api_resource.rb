require 'plural'

module Opportunity
  class APIResource < OpportunityObject
    extend Opportunity::APIActions::Request

    class << self

      def class_name
        self.name.split("::")[-1]
      end

      def resource_url
        "/v1/#{Util.underscore(class_name).plural}"
      end

      def has_many(name, definition_params={})
        define_method(name) do |params={}|
          if definition_params[:foreign_key]
            foreign_key = definition_params[:foreign_key]
          else
            foreign_key = self.class.name.gsub("Opportunity::", "").downcase
            foreign_key += "_id"
          end
          Util.constantize(name[0..-2]).list({foreign_key.to_sym => self.id}.merge!(params))
        end
      end

    end

  end
end
