module Opportunity
  module APIActions
    module Evaluatable

      SKILL_KEYS = %w(id score)
      EVALUATION_URL = "/v1/evaluations/"

      attr_reader :match

      def evaluate!(skill_assessment)
        valid_params!(skill_assessment)

        skill_assessment.select!{ |s| valid_skill?(s) }
        identifier = self.class.class_name.downcase
        params = {
          'evaluation' => {
            'skill_assessment' => skill_assessment,
            "#{identifier}_id" => id
          }
        }.to_json

        score = handle_response(self.class.request(:post, EVALUATION_URL, params))
        attach_match(score)
        score
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

      def handle_response(response)
        parsed_response = JSON.parse(response.body)
        parsed_response['evaluation']['score']
      end

      def attach_match(match_score)
        @match = match_score
      end

    end
  end
end
