module Opportunity
  class JobFamily < APIResource
    extend APIActions::List

    class << self

      def custom_accepted_params
        ['title']
      end

    end

  end
end
