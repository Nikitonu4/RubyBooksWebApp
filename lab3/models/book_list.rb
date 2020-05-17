# frozen_string_literal: true
require 'forwardable'
# The list of books
class BookList
  extend Forwardable
  def_delegator :@books, :each, :each_book

  def initialize(books = [])
    @books = books
  end
end
