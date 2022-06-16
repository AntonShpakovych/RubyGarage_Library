# frozen_string_literal: true

# Module for validation  class
class MyError < StandardError; end

module Validation
  STRING = 'Must be a string and not empty'
  KLASS = 'Must be an instance of class'
  GLOBAL = 'Must be a string or a integer'

  def val_for_type(data, type)
    if type == Integer
      data.is_a?(type) && data >= 1 ? data : MyError(STRING)
    elsif type == String
      data.is_a?(type) && !data.empty? ? data : MyError(STRING)
    else
      raise MyError(GLOBAL)
    end
  end

  def val_for_instance(data, klass)
    raise MyError(KLASS) unless data.instance_of?(klass)
  end
end
