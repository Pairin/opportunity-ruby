module Opportunity
  class OpportunityObject

    def initialize(data={})
      set_accessors(data)
    end

    def metaclass
      class << self; self; end
    end

    def set_accessors(data)
      data.each do |(k,v)|
        metaclass.instance_eval do
          if child_mappings[k.to_sym]
            if v.kind_of?(Array)
              method_value = v.map{|list_value| child_mappings[k.to_sym].new(list_value) }
            else
              method_value = child_mappings[k.to_sym].new(v)
            end
          else
            method_value = v
          end

          define_method(k) { method_value }
        end
      end
    end

    def self.child_mappings
      {}
    end

  end
end
