require "opportunity/version"

require "faraday"
require "json"

# Actions
require "opportunity/api_actions/request"
require "opportunity/api_actions/list"

# Base
require "opportunity/util"
require "opportunity/client"
require "opportunity/opportunity_object"
require "opportunity/api_resource"

# Objects
require "opportunity/occupation"
require "opportunity/career"

module Opportunity
  
  @api_base = "http://staging.hqpfr7zpgq.us-east-1.elasticbeanstalk.com/"
  
  class << self
    attr_reader :api_base
  end

end
