# frozen_string_literal: true

# Module for validation  class
module Validaiton
  def val_for_type(data, type)
    if type == Integer
      data.is_a?(type) && data >= 1 ? true : false
    elsif type == String
      data.is_a?(type) && !data.empty? ? true : false
    end
  end

  def val_for_instance(data, cls)
    data.instance_of?(cls) ? true : false
  end
end
