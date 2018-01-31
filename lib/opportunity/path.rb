module Opportunity
  class Path < APIResource

    extend APIActions::Retrievable
    extend APIActions::Creatable

    include APIActions::Updatable


    class << self

      def creation_format
        {
          '!start_point' => '',
          '!end_point' => '',
          'inputs' => {
            'skill_set_id' => '',
            'award_level' => '',
            'program_id' => '',
            'lat' => 0.0,
            'long' => 0.0
          }
        }.freeze
      end

      def update_format
        {
          '!inputs' => {
            'skill_set_id' => '',
            'award_level' => '',
            'program_id' => '',
            'lat' => 0.0,
            'long' => 0.0
          }
        }
      end

    end

    def reset
      response = Path.request(:post, "#{Path.singular_resource_url(self.id)}/reset")
      parsed_response = JSON.parse(response.body)
      Path.send(:initialize_resource, parsed_response)
    end

  end
end
