require "opportunity/version"

require "json"

# Actions
require "opportunity/api_actions/request"
require "opportunity/api_actions/list"

# Base
require "opportunity/util"
require "opportunity/errors"
require "opportunity/client"
require "opportunity/opportunity_object"
require "opportunity/api_resource"

# Objects
require "opportunity/occupation"

module Opportunity

  # @api_base = "http://staging.hqpfr7zpgq.us-east-1.elasticbeanstalk.com/"
  @api_base = "http://localhost:3000"

  class << self
    attr_reader :api_base
  end

end
