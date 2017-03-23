module Opportunity
  class Career < APIResource
    extend APIActions::List

    CHILD_RESOURCE_MAPPING = {
      similar_careers: Opportunity::Career,
      occupations_covered: Opportunity::Occupation,
      education_requirement: Opportunity::EducationRequirement
    }

    def self.child_mappings
      CHILD_RESOURCE_MAPPING
    end

    def self.custom_accepted_params
      ['ed_req', 'name']
    end

  end
end
