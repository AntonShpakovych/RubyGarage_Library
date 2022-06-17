# frozen_string_literal: true

class Author
  include Validation

  attr_reader :name, :biography

  BIOGRAPHY = "Author doesn't have biography"

  def initialize(name, biography = BIOGRAPHY)
    validate(name, biography)
    @biography = biography
    @name = name
  end

  private

  def validate(name, biography)
    val_for_type(name, String)
    val_for_type(biography, String)
  end
end
