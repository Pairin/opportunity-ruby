module Opportunity
  module APIActions
    module Evaluatable

      SKILL_KEYS = %w(id score)

      def evaluate!(skill_assessment)
        if valid_params!(skill_assessment)
          1
        end
      end

      private

      def valid_params!(params)
        if !params.is_a?(Array)
          invalid_parameters("")
        elsif params.length == 0
          invalid_parameters("")
        elsif !params.find{|s| valid_skill?(s)}
          invalid_parameters("")
        else
          true
        end
      end

      def valid_skill?(skill)
        if !skill.is_a?(Hash)
          false
        elsif skill.keys.sort != SKILL_KEYS
          false
        else
          true
        end
      end

      def invalid_parameters(message)
        raise InvalidParametersError.new(message)
      end

    end
  end
end
