# frozen_string_literal: true

class Author
  include Validation

  attr_reader :name, :biography

  def initialize(name, biography = '')
    val_for_type(name, String)
    @biography = biography
    @name = name
  end
end
