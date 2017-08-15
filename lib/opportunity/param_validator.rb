module Opportunity
  class ParamValidator

    class << self

      def validate_hash(attempt, expectation)
        valid = true

        if attempt.is_a?(Hash) && !attempt.empty?
          expectation.each do |(k,v)|
            attempt_value = attempt[k]
            if attempt_value.nil?
              valid = false
            else
              valid = validate_value(attempt_value, expectation[k])
            end
            break if !valid
          end
        else
          valid = false
        end

        valid
      end

      def validate_array(attempt, expectation)
        valid = true
        if attempt.is_a?(Array) && !attempt.empty?
          valid = validate_value(attempt[0], expectation[0])
        else
          valid = false
        end

        valid
      end

      def validate_simple_value(attempt, expectation)
        attempt.class == expectation.class
      end

      def validate_value(attempt, expectation)
        valid = validate_simple_value(attempt, expectation)

        if valid
          if expectation.is_a?(Hash)
            valid = validate_hash(attempt, expectation)
          elsif expectation.is_a?(Array)
            valid = validate_array(attempt, expectation)
          else
            valid
          end
        end
        valid
      end

    end

  end
end
