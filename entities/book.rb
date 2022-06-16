# frozen_string_literal: true

class Book
  include Validation

  attr_reader :title, :author

  def initialize(title, author)
    validate(title, author)
    @title = title
    @author = author
  rescue StandardError
    exit
  end

  def validate(title, author)
    val_for_type(title, String)
    val_for_instance(author, Author)
  end
end
