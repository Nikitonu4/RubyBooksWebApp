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

  # def sort_by_genre
  #   @books.sort { |book2, book1| (book1.genre <=> book2.genre) }
  # end

  # def genre
  #   array_of_genres = []
  #   @books.values.each do |book|
  #     genre = book.genre.map(&:to_s)
  #     array_of_genres.append(genre[0])
  #   end
  #   array_of_genres.uniq.sort
  # end

  #  def sum_quantity
  #   sum = 0
  #   @books.each do |book|
  #     sum+=book.quantity
  #   sum
  # end

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
