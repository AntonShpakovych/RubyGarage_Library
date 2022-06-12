# frozen_string_literal: true

require_relative '../Entities/author'
require_relative '../Entities/book'
require_relative '../Entities/reader'
require_relative '../Entities/order'
require_relative 'library'

# create library
library = Library.new

# create authors
author1 = Author.new('Author1', 'bio1')
author2 = Author.new('Author2', 'bio1')
author3 = Author.new('Author3', 'bio1')

# create books
book1 = Book.new('Book1', author1)
book2 = Book.new('Book3', author2)
book3 = Book.new('Book2', author3)

# create readers
reader1 = Reader.new('name1', 'email1', 'city1', 'street1', 1)
reader2 = Reader.new('name2', 'email2', 'city2', 'street2', 2)
reader3 = Reader.new('name3', 'email3', 'city3', 'street3', 3)

# create orders
order1 = Order.new(book1, reader3)
order2 = Order.new(book2, reader3)
order3 = Order.new(book3, reader1)

# library add's
library.add_author(author1)
library.add_author(author2)
library.add_author(author3)

library.add_books(book1)
library.add_books(book2)
library.add_books(book3)

library.add_readers(reader1)
library.add_readers(reader2)
library.add_readers(reader3)

library.add_orders(order1)
library.add_orders(order2)
library.add_orders(order3)

# methods statistics
puts library.top_reader(2)

puts library.most_popular_book

puts library.number_of_readers_most_popular_book

# library.save => filename = save data to file
# library.save('cheack')

# library.load => filename = download data from file
library.load('cheack')
