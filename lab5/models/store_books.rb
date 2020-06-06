# frozen_string_literal: true

require 'psych'
require_relative 'book_list'
require_relative 'book'

# Storage for all of our data
class StoreBooks
  attr_reader :book_list

  DATA_BOOK_STORE = File.expand_path('../db/books.yaml', __dir__)

  def initialize
    @book_list = BookList.new
    read_data
    at_exit { write_data }
  end

  def read_data
    return unless File.exist?(DATA_BOOK_STORE)

    yaml_data = File.read(DATA_BOOK_STORE)
    raw_data = Psych.load(yaml_data, symbolize_names: true)
    raw_data[:book_list].each do |raw_book|
      @book_list.add_real_book(Book.new(**raw_book))
    end
  end

  def write_data
    raw_books = @book_list.all_books.map(&:to_h)
    yaml_data = Psych.dump({
                             book_list: raw_books
                           })
    File.write(DATA_BOOK_STORE, yaml_data)
  end
end
