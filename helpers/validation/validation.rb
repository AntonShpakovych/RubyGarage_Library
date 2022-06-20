# frozen_string_literal: true

module Validation
  STRING = 'Must be a string and not empty'
  KLASS = 'Must be an instance of class'
  GLOBAL = 'Must be a string or a integer'
  INTEGER = 'Must be a integer'

  private

  def val_for_type(data, type)
    if type == Integer
      data.is_a?(type) && data.positive? ? data : raise(StandardError, INTEGER)
    elsif type == String
      data.is_a?(type) && !data.empty? ? data : raise(StandardError, STRING)
    else
      raise(StandardError, GLOBAL)
    end
  end

  def val_for_instance(data, klass)
    raise(StandardError, KLASS) unless data.is_a?(klass)
  end
end
