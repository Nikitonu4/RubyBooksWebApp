# frozen_string_literal: true

require_relative 'book'
require_relative 'stationery'

# The class that contains all our books
class ShopList
  def initialize(name, products = [])
    @name = name
    if products == nil
      @products = []
    else
      @products = products.map do |product|
        [product.id, product]
      end.to_h
    end
  end

  def name
    @name
  end

  def id
    @id
  end

  def all_products
    @products.values
  end

  def size
    @products.keys.max
  end

  def price
    price=0
    for id in 0 .. @products.keys.max 
       price= price + @products[product_id].price
    end
    price
  end
  def product_by_id(id)
    @products[id]
  end

  def add_products(product)
    product_id = if @products.empty?
                1
              else
                @products.keys.max + 1
              end
    @products[product_id] = product
    # @products[product_id]
    @products.values
  end

  def add_real_product(product)
    @products[product.id] = product
  end

  def delete_product(id)
    @products.delete(id)
  end
end