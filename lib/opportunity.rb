require 'opportunity/version'

require 'json'

# Actions
require 'opportunity/api_actions/request'
require 'opportunity/api_actions/list'
require 'opportunity/api_actions/retrievable'
require 'opportunity/api_actions/evaluatable'
require 'opportunity/api_actions/creatable'
require 'opportunity/api_actions/updatable'

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
require 'opportunity/occupation_title'
require 'opportunity/program'
require 'opportunity/award_level'
require 'opportunity/institution'
require 'opportunity/industry'
require 'opportunity/job_family'
require 'opportunity/skill'
require 'opportunity/skill_set'
require 'opportunity/path'

module Opportunity
  PRODUCTION_OPPORTUNITY_URL = ENV.fetch('PRODUCTION_OPPORTUNITY_URL', 'https://opp.pairin.com')
  STAGING_OPPORTUNITY_URL = ENV.fetch('STAGING_OPPORTUNITY_URL', 'https://staging-opportunity.pairin.com')

  class << self
    attr_reader :client, :auth_token

    def client
      @client ||= Client.new(auth_token)
    end

    def auth_token=(token)
      @client = nil
      @auth_token = token
    end

    def production=(value)
      @production = value
    end

    def api_base
      !@production ? STAGING_OPPORTUNITY_URL : PRODUCTION_OPPORTUNITY_URL
    end

  end

end
