# Child Objects
require 'opportunity/occupations/education_statistic'
require 'opportunity/occupations/employment_statistic'
require 'opportunity/occupations/wage_statistic'

module Opportunity
  class Occupation < APIResource
    extend APIActions::List
    extend APIActions::Retrievable

    has_many :programs
    has_many :skills, foreign_key: :connectable_id

    class << self

      def custom_accepted_params
        ['title', 'wage_min', 'wage_max', 'industry', 'interests', 'ed', 'order', 'onet_code', 'skill_set_id', 'hawt', 'order_by']
      end

      def child_mappings
        {
          education: Occupations::EducationStatistic,
          employment: Occupations::EmploymentStatistic,
          wage: Occupations::WageStatistic,
          industries: Industry,
          similar_occupations: Occupation
        }
      end

    end

  end
end
