require 'forwardable'
require_relative './api_actions/list.rb'

module Opportunity
  class ResultSet
    extend Forwardable
    include Enumerable

    ACCEPTED_ATTRS = %w(x-total-count page limit offset)

    def_delegators :@results, :each, :map, :inject, :first, :last, :count, :length, :empty?
    attr_reader :results, :attrs

    def initialize(results, attrs={})
      @results = results
      @attrs = prune_attributes(attrs)
    end

    def next
      return [] if empty?

      request_direction(1)
    end

    def next!
      return [] if empty?

      copy_result_set(request_direction(1))
    end

    def previous
      return [] if empty?

      request_direction(-1)
    end

    def previous!
      return [] if empty?

      copy_result_set(request_direction(-1))
    end

    def total
      @attrs['x-total-count']
    end

    def page
      if @attrs['offset']
        nil
      else
        @attrs['page'] || APIActions::List::PAGE_DEFAULT
      end
    end

    def limit
      @attrs['limit'] || APIActions::List::LIMIT_DEFAULT
    end

    def offset
      @attrs['offset']
    end

    private

    def result_class
      @results.first.class if !empty?
    end

    def prune_attributes(attrs)
      accepted_attributes = ACCEPTED_ATTRS.dup
      accepted_attributes.concat(result_class.custom_accepted_params) if !empty?
      attrs.select{ |k| accepted_attributes.include?(k) }
    end

    def request_direction(modifier)
      attributes = @attrs.dup
      attributes['page'] = page.to_i + modifier
      result_class.list(attributes)
    end

    def copy_result_set(result_set)
      @results = result_set.results
      @attrs = result_set.attrs
      self
    end

  end
end
