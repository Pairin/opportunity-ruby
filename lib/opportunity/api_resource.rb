module Opportunity
  class APIResource < OpportunityObject
    extend Opportunity::APIActions::Request

    def self.class_name
      self.name.split("::")[-1]
    end

    def self.resource_url
      "/v1/#{class_name.downcase}s"
    end

    def self.retrieve(id, opts={})
      resource_instance = self.new(opts.merge!({id: id}))
      resource_instance.refresh
    end

    def refresh
      response = self.class.request(:get, resource_url)
      parsed_response = JSON.parse(response.body)
      self.class.new(parsed_response)
    end

    def resource_url
      "#{self.class.resource_url}/#{self.id}"
    end

  end
end
