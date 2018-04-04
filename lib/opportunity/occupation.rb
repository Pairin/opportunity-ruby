# Child Objects
require 'opportunity/occupations/education_statistic'
require 'opportunity/occupations/employment_statistic'
require 'opportunity/occupations/wage_statistic'
require 'opportunity/occupations/location'

module Opportunity
  class Occupation < APIResource
    extend APIActions::List
    extend APIActions::Retrievable

    has_many :programs
    has_many :skills, foreign_key: :connectable_ids

    class << self

      def custom_accepted_params
        [
          'title', 'wage_min', 'wage_max', 'industry',
          'interests', 'ed', 'order', 'onet_code',
          'skill_set_id', 'hawt', 'order_by',
          'lat', 'long', 'radius'
        ]
      end

      def child_mappings
        {
          education: Occupations::EducationStatistic,
          employment: Occupations::EmploymentStatistic,
          wage: Occupations::WageStatistic,
          industries: Industry,
          similar_occupations: Occupation,
          location: Occupations::Location
        }
      end

    end

  end
end
