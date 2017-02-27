module Opportunity
  class Util

    def self.parameterize_hash(hash={})
      hash.inject("") do |summ, (k,v)|
        prefix = summ.length == 0 ? "?" : "&"
        summ += "#{prefix}#{k.to_s.downcase}=#{v}"
        summ
      end
    end

  end
end