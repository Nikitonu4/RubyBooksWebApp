# frozen_string_literal: true

require_relative 'book'
require_relative 'stationery'

# The class that contains all our books
class List
  def initialize(id, name, products = [])
    @id = id
    @name = name
    @products = products.map do |product|
      [product.id, product]
    end.to_h
end

def all_products
    @products.values
  end

def id
  @id
end

  def name
    @name
  end

end
