class Library

  def initialize
    @book_catalog = {}
  end

  def add_book(title, author, genre, publication_year)
    @book_catalog[title] = Book.new(title, author, genre, publication_year)
  end

  def search_books_by_year(year)
    @book_catalog.select { |title, book| book.publication_year > year }
  end 

  def print_books
    @book_catalog.map { |book| puts book }
  end
end
 class Book
    attr_accessor :title, :author, :genre, :publication_year

    def initialize(title, author, genre, publication_year)
      @title = title
      @author = author
      @genre = genre
      @publication_year = publication_year
    end
    def to_s
      "Title: #{@title}, Author: #{@author}, Genre: #{@genre}, Year: #{@publication_year}"
    end
  end

 library = Library.new
 library.add_book("Atomic Habits", "James ...", "Self Help", 1949)
library.add_book("tileb", "IDK the author ", "Some category", 1960)

puts "All Books:"
library.print_books

puts "\nBooks published after 1950:"
books_after_1950 = library.search_books_by_year(1950)
books_after_1950.each_value { |book| puts book }
