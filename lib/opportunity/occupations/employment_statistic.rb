# Child Objects
require 'opportunity/occupations/experience_breakdown'

module Opportunity
  module Occupations
    class EmploymentStatistic < OpportunityObject

      class << self

        def child_mappings
          {
            experience: ExperienceBreakdown
          }
        end

      end

    end
  end
end
