# frozen_string_literal: true

class Order
  include Validation

  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    validate(book, reader, date)
    @book = book
    @reader = reader
    @date = date
  end

  private

  def validate(book, reader, date)
    val_for_instance(book, Book)
    val_for_instance(reader, Reader)
    val_for_instance(date, Date)
  end
end
