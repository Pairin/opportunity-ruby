module Opportunity
  class Occupation < APIResource
    extend APIActions::List

    has_many :programs

    class << self

      def custom_accepted_params
        ['title']
      end

    end

  end
end
