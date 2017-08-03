module Opportunity
  class Skill < APIResource
    extend APIActions::List

    class << self

      def custom_accepted_params
        ['connectable_id', 'source', 'source_classification']
      end

    end

  end
end
