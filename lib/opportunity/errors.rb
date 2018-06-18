module Opportunity
  class OpportunityError < StandardError

    def initialize(message)
      @message = message
    end

    def to_s
      @message
    end
  end

  class AuthenticationError < OpportunityError
  end

  class ApiError < OpportunityError
    attr_reader :response_code

    def initialize(message, response_code)
      @message = message
      @response_code = response_code
    end

    def to_s
      "#{@response_code} #{@message}"
    end
  end

  class InvalidParametersError < OpportunityError
  end

end
