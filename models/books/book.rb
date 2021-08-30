# frozen_string_literal: true

# The information about the book
Book = Struct.new(:id, :name, :author, :genre, :price, :quantity, keyword_init: true)
