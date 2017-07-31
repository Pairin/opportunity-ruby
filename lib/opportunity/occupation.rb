module Opportunity
  class Occupation < APIResource
    extend APIActions::List

    has_many :programs

    class << self

      def custom_accepted_params
        ['title', 'wage_min', 'wage_max', 'industry', 'interests', 'ed', 'order']
      end

    end

  end
end
