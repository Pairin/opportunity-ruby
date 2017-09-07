module Opportunity
  class Skill < APIResource
    extend APIActions::List

    class << self

      def custom_accepted_params
        ['connectable_ids', 'source', 'source_classification', 'name']
      end

    end

  end
end
