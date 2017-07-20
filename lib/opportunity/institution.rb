module Opportunity
  class Institution < APIResource
    extend APIActions::List

    class << self

      def custom_accepted_params
        ['name']
      end

    end

    def programs(params={})
      Program.list({institution_id: self.id}.merge!(params))
    end

  end
end
