# frozen_string_literal: true

# The information about the good books
Book = Struct.new(:id, :title, :author, :genre, :price, :quantity, keyword_init: true)