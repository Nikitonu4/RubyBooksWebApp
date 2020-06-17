# frozen_string_literal: true

require_relative 'book'
require_relative 'stationery'

# list
class List
  attr_reader :id, :name
  def initialize(id, name, products = [])
    @id = id
    @name = name
    @products = products.map do |product|
      [product.id, product]
    end.to_h
  end

  def product_by_id(id)
    @products[id]
  end

  # def count_product
  #   @products.each do |
  # end

  def all_products
    @products.values
  end

  def size
    @products.keys.max
  end
  
  def add_product(product)
    product_id = if @products.empty?
                   1
                 else
                   @products.keys.max + 1
              end
    @products[product_id] = product
    @products.values
  end

   # def price
  #   price=0
  #   for id in 0 .. @products.keys.max 
  #      price= price + @products[product_id].price
  #   end
  #   price
  # end

end
