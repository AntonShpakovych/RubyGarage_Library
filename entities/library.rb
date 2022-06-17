# frozen_string_literal: true

class Library
  FILE_FOR_STORE = 'data_store.yml'

  include Store
  include Validation

  attr_reader :authors, :books, :readers, :orders

  def initialize
    data_store = load(FILE_FOR_STORE)
    @authors = data_store[:authors] || []
    @books = data_store[:books] || []
    @readers = data_store[:readers] || []
    @orders = data_store[:orders] || []
  end

  def add_some_entitie(entitie)
    case entitie
    when Author then authors.push(entitie)
    when Book then books.push(entitie)
    when Reader then readers.push(entitie)
    when Order then orders.push(entitie)
    end
  end

  def top_reader(quantity = 1)
    top(:reader, :book, quantity)
  end

  def most_popular_books(quantity = 1)
    top(:book, :reader, quantity)
  end

  def number_of_readers_most_popular_books(quantity = 3)
    top_books = most_popular_books(quantity)
    orders.select { |order| top_books.include?(order.book) }.uniq(&:reader).length
  end

  def data_to_store
    { authors: authors, books: books, readers: readers, orders: orders }
  end

  private

  def top(entity, uniq_name, quantity)
    grouped = orders.group_by(&entity).flat_map { |_key, orders| orders.uniq(&uniq_name) }.map(&entity)
    grouped.sort_by { |reader| -grouped.count(reader) }.uniq.first(quantity)
  end
end
