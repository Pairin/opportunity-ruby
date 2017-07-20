module Opportunity
  class Institution < APIResource
    extend APIActions::List

    has_many :programs

    class << self

      def custom_accepted_params
        ['name']
      end

    end

  end
end
