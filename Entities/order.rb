# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative '../Validation/validation'

require 'date'

# Order => book, reader, date => instances =>Book, Reader, Date
class Order
  include Validaiton
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book = val_for_instance(book, Book) ? book : raise('Must be an instance of Book class')
    @reader = val_for_instance(reader, Reader) ? reader : raise('Must be an instance of Reader class')
    @date = date || raise('Must be an instance of a Ruby Date class') if val_for_instance(date, Date)
  rescue StandardError => e
    puts e.message
    exit
  end

  def to_s
    "#{@date}|#{@book}| Reader: #{@reader}"
  end
end
