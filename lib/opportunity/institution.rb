module Opportunity
  class Institution < APIResource
    extend APIActions::List

    has_many :programs

    class << self

      def custom_accepted_params
        ['name', 'award_level', 'program_id', 'lat', 'long', 'radius']
      end

    end

  end
end
