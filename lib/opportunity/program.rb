module Opportunity
  class Program < APIResource
    extend APIActions::List
    extend APIActions::Retrievable

    class << self

      def custom_accepted_params
        ['occupation_id', 'level_id', 'institution_id']
      end

    end

  end
end
