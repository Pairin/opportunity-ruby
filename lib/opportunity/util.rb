module Opportunity
  class Util

    class << self

      def parameterize_hash(hash={})
        hash.inject("") do |summ, (k,v)|
          prefix = summ.length == 0 ? "?" : "&"
          summ += "#{prefix}#{k.to_s.downcase}=#{v}"
          summ
        end
      end

      def stringify_keys(hash)
        hash.inject({}) do |summ, (k,v)|
          summ[k.to_s] = v
          summ
        end
      end

      def underscore(string)
        string.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          tr("-", "_").
          downcase
      end

      def constantize(string)
        Object.const_get("Opportunity::#{string.capitalize}")
      end

    end

  end
end
