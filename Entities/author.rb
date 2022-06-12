# frozen_string_literal: true

require_relative '../Validation/validation'

# Author => Name - required, String, not empty | Biography - optional
class Author
  include Validaiton
  attr_accessor :name, :biography

  def initialize(name, biography = '')
    @biography = biography
    @name = val_for_type(name, String) ? name : raise('Eror:bad data type or data == empty')
  rescue StandardError => e
    puts e.message
    exit
  end

  def to_s
    "Author: #{@name} || Biography: #{!@biography.empty? ? @biography : "Don't have"}"
  end
end
