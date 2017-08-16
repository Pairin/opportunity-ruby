module Opportunity
  class SkillSet < APIResource

    extend APIActions::Retrievable
    extend APIActions::Creatable
    include APIActions::Evaluatable

    class << self

      def creation_format
        {
          'skill_evaluations' => [
            {'skill_id' => '', 'score' => 0.0}
          ]
        }.freeze
      end

    end

  end
end
