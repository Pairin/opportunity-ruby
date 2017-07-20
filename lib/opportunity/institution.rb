module Opportunity
  class Institution < APIResource
    extend APIActions::List

    class << self

      def custom_accepted_params
        ['name']
      end

    end

  end
end
