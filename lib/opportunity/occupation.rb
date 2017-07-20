module Opportunity
  class Occupation < APIResource
    extend APIActions::List

    class << self

      def custom_accepted_params
        ['title']
      end

    end

    def programs(params={})
      Program.list({occupation_id: self.id}.merge!(params))
    end

  end
end
