require 'opportunity/version'

require 'json'

# Actions
require 'opportunity/api_actions/request'
require 'opportunity/api_actions/list'
require 'opportunity/api_actions/retrievable'
require 'opportunity/api_actions/evaluatable'
require 'opportunity/api_actions/creatable'

# Base
require 'opportunity/util'
require 'opportunity/errors'
require 'opportunity/client'
require 'opportunity/opportunity_object'
require 'opportunity/api_resource'
require 'opportunity/result_set'
require 'opportunity/param_validator'

# Objects
require 'opportunity/occupation'
require 'opportunity/program'
require 'opportunity/award_level'
require 'opportunity/institution'
require 'opportunity/industry'
require 'opportunity/skill'
require 'opportunity/skill_set'
require 'opportunity/path'

# Child Objects
require 'opportunity/occupations/education_statistic'
require 'opportunity/occupations/employment_statistic'
require 'opportunity/occupations/wage_statistic'
require 'opportunity/occupations/experience_breakdown'

module Opportunity

  @api_base = 'https://staging-opportunity.pairin.com'

  class << self
    attr_reader :api_base, :client
    attr_accessor :auth_token

    def client
      @client ||= Client.new(auth_token)
    end

  end

end
