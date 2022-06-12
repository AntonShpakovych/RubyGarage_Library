# frozen_string_literal: true

require_relative 'author'
require_relative '../Validation/validation'

# Book => Title - required,  String, not empty | Author  - required, must be an instance of Author class.
class Book
  include Validaiton
  attr_accessor :title, :author

  def initialize(title, author)
    @title = val_for_type(title, String) ? title : raise('Must be a string and not empty')
    @author = val_for_instance(author, Author) ? author : raise('must be an instance of Author class')
  rescue StandardError => e
    puts e.message
    exit
  end

  def to_s
    "Book title: #{@title} || Author: #{@author.name}"
  end
end
