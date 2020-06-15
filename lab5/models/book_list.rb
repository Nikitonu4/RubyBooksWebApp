# frozen_string_literal: true

require_relative 'book'

# The class that contains all our books
class BookList
  def initialize(books = [])
    @books = books.map do |book|
      [book.id, book]
    end.to_h
  end

  def all_books
    @books.values
  end

  def count_books
    count = 0
    @books.each do |book|
      count+=book.quantity
    end
  end

  def genres
    array_of_genres = []
    @books.values.each do |book|
      array_of_genres.append(book.genre)
    end
    array_of_genres.uniq.sort
  end

  def count_quantity
    count = 0
    @books.each do |book|
      if book.genre == genre
        count+=book.quantity
      end
    end
    count
  end

  def book_by_id(id)
    @books[id]
  end

  def filter(title, genre)
    @books.values.select do |book|
      next if title && !title.empty? && title != book.title
      next if genre && !genre.empty? && genre != book.genre
      true
    end
  end

  def add_book(parameters)
    book_id = if @books.empty?
                1
              else
                @books.keys.max + 1
              end
    @books[book_id] = Book.new(id: book_id, **parameters.to_h)
    @books[book_id]
  end

  

  def add_real_book(book)
    @books[book.id] = book
  end
  def delete_book(id)
    @books.delete(id)
  end
end
