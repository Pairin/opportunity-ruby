# Child Objects
require 'opportunity/programs/level'

module Opportunity
  class Program < APIResource
    extend APIActions::List
    extend APIActions::Retrievable

    class << self

      def custom_accepted_params
        ['title', 'award_level']
      end

      def child_mappings
        {
          levels: Programs::Level
        }
      end

    end

  end
end
