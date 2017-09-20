module Opportunity
  class Path < APIResource

    extend APIActions::Retrievable
    extend APIActions::Creatable

    class << self

      def creation_format
        {
          'start_point' => '',
          'end_point' => '',
          'inputs' => {
            'skill_set_id' => ''
          }
        }.freeze
      end

    end




  end
end
