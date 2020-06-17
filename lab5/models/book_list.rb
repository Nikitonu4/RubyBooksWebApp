# frozen_string_literal: true

require_relative 'book'

# The class that contains all our books
class BookList
  attr_writer :genre
  def initialize(books = [])
    @books = books.map do |book|
      [book.id, book]
    end.to_h
  end

  def all_books
    @books.values
  end

  def count_books(genre)
    count = 0
    @books.values.each do |book|
      count += 1 if book.genre == genre
    end
    count
  end

  def instance_books(genre)
    instance = 0
    @books.values.each do |book|
      instance += book.quantity if book.genre == genre
    end
    instance
  end

  def average_cost(genre)
    cost = 0
    count = 0
    @books.values.each do |book|
      next unless book.genre == genre

      count += 1
      cost += book.price if book.price != 0 && book.quantity != 0
    end
    (cost / count).round
  end

  def total_books
    total = 0
    @books.values.each do |book|
      total += book.quantity
    end
    total
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
      count += book.quantity if book.genre == genre
    end
    count
  end

  def book_by_id(id)
    @books[id]
  end

  def filter(name, genre)
    @books.values.select do |book|
      next if name && !name.empty? && !book.name.downcase.include?(name.downcase)
      next if genre && !genre.empty? && !book.genre.downcase.include?(genre.downcase)

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
