---
:authors: []
:books: []
:readers: []
:orders:
- &7 !ruby/object:Order
  book: &6 !ruby/object:Book
    title: Book2
    author: &8 !ruby/object:Author
      biography: bio1
      name: Author2
  reader: &1 !ruby/object:Reader
    name: name3
    email: email3
    city: city3
    street: street3
    house: 3
  date: 2022-06-20
- !ruby/object:Order
  book: &4 !ruby/object:Book
    title: Book3
    author: !ruby/object:Author
      biography: bio1
      name: Author3
  reader: *1
  date: 2022-06-20
- !ruby/object:Order
  book: &2 !ruby/object:Book
    title: Book1
    author: !ruby/object:Author
      biography: Author doesn't have biography
      name: Author1
  reader: &3 !ruby/object:Reader
    name: name1
    email: email1
    city: city1
    street: street1
    house: 1
  date: 2022-06-20
- !ruby/object:Order
  book: *2
  reader: *3
  date: 2022-06-20
- !ruby/object:Order
  book: *4
  reader: &5 !ruby/object:Reader
    name: name4
    email: email4
    city: city4
    street: street4
    house: 4
  date: 2022-06-20
- !ruby/object:Order
  book: *2
  reader: *5
  date: 2022-06-20
- !ruby/object:Order
  book: *6
  reader: *5
  date: 2022-06-20
- !ruby/object:Order
  book: *2
  reader: *1
  date: 2022-06-20
- !ruby/object:Order
  book: *2
  reader: !ruby/object:Reader
    name: name2
    email: email2
    city: city2
    street: street2
    house: 2
  date: 2022-06-20
- *7
- !ruby/object:Order
  book: !ruby/object:Book
    title: Book4
    author: *8
  reader: *5
  date: 2022-06-20
