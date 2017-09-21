module Opportunity
  class OccupationTitle < APIResource
    extend APIActions::List

    class << self

      def custom_accepted_params
        ['title']
      end

    end

  end
end
