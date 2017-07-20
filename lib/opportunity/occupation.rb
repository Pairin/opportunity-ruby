module Opportunity
  class Occupation < APIResource
    extend APIActions::List

    def programs(params={})
      Program.list({occupation_id: self.id}.merge!(params))
    end

  end
end
