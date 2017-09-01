module Opportunity
  class Occupation < APIResource
    extend APIActions::List
    extend APIActions::Retrievable

    has_many :programs
    has_many :skills, foreign_key: :connectable_id

    class << self

      def custom_accepted_params
        ['title', 'wage_min', 'wage_max', 'industry', 'interests', 'ed', 'order', 'skill_set_id', 'steamy']
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
