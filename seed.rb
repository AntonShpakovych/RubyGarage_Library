# frozen_string_literal: true

require_relative 'config/initializer'

library = Library.new
author1 = Author.new('Author1', 'bio1')
author2 = Author.new('Author2', 'bio1')
author3 = Author.new('Author3', 'bio1')
book1 = Book.new('Book1', author1)
book2 = Book.new('Book2', author2)
book3 = Book.new('Book3', author3)
book4 = Book.new('Book4', author2)
reader1 = Reader.new('name1', 'email1', 'city1', 'street1', 1)
reader2 = Reader.new('name2', 'email2', 'city2', 'street2', 2)
reader3 = Reader.new('name3', 'email3', 'city3', 'street3', 3)
reader4 = Reader.new('name4', 'email4', 'city4', 'street4', 4)

order1 = Order.new(book1, reader1)
order2 = Order.new(book1, reader1)
order3 = Order.new(book2, reader3)
order4 = Order.new(book3, reader3)
order5 = Order.new(book3, reader4)
order6 = Order.new(book1, reader4)
order7 = Order.new(book2, reader4)
order8 = Order.new(book1, reader3)
order9 = Order.new(book1, reader2)
order10 = Order.new(book4, reader4)

library.add_some_entitie(order3)
library.add_some_entitie(order4)
library.add_some_entitie(order1)
library.add_some_entitie(order2)
library.add_some_entitie(order5)
library.add_some_entitie(order6)
library.add_some_entitie(order7)
library.add_some_entitie(order8)
library.add_some_entitie(order9)
library.add_some_entitie(order3)
library.add_some_entitie(order10)
pp library.top_reader
pp library.most_popular_books
pp library.number_of_readers_most_popular_books
