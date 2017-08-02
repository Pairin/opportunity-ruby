module Opportunity
  class Occupation < APIResource
    extend APIActions::List
    extend APIActions::Retrievable

    has_many :programs

    class << self

      def custom_accepted_params
        ['title', 'wage_min', 'wage_max', 'industry', 'interests', 'ed', 'order']
      end

      def child_mappings
        {
          education: Occupations::EducationStatistic,
          employment: Occupations::EmploymentStatistic,
          wage: Occupations::WageStatistic
        }
      end

    end

  end
end
