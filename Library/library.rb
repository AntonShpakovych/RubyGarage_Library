# frozen_string_literal: true

require 'json'

# Library
class Library
  attr_accessor :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
  end

  def add_author(author)
    authors.push({ name: author.name, biography: author.biography })
  end

  def add_books(book)
    books.push({ title: book.title, author: book.author })
  end

  def add_readers(reader)
    readers.push({ name: reader.name,
                   email: reader.email,
                   city: reader.city,
                   street: reader.street,
                   house: reader.house })
  end

  def add_orders(order)
    orders.push({ book: order.book, reader: order.reader, date: order.date })
  end

  def top_reader(quantity = 1)
    count_readers = @orders.map { |order| order[:reader].name }
    count_readers.sort { |f, s| count_readers.count(f) <=> count_readers.count(s) }.uniq.reverse[0...quantity]
  end

  def most_popular_book(quantity = 1)
    count_books = @orders.map { |order| order[:book].title }
    count_books.sort { |f, s| count_books.count(f) <=> count_books.count(s) }.uniq.reverse[0...quantity]
  end

  def number_of_readers_most_popular_book(some_quantity = 3)
    top_books = most_popular_book(some_quantity)
    reader_uniq = @orders.map { |order| order[:reader].name if top_books.include? order[:book].title }.uniq
    reader_uniq.reverse[0...some_quantity]
  end

  def save(filename)
    file = File.open("#{filename}.json", 'w')
    data = { authors: @authors,
             books: @books,
             readers: @readers,
             orders: @orders }
    file.write(data.to_json)
  end

  def load(filename)
    file = File.read("#{filename}.json")
    data = JSON.parse(file, object_class: OpenStruct)
    data.authors.map { |author| add_author(author) }
    data.books.map { |book| add_books(book) }
    data.readers.map { |reader| add_readers(reader) }
    data.orders.map { |order| add_orders(order) }
  end
end
