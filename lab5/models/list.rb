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

  def count_product(name)
    count = 0
    @products.each do |_id, product|
      count += 1 if product.name == name
    end
    count
  end

  def id_by_name(name)
    @products.each do |id, product|
      return id if product.name == name
    end
  end

  def total_price
    price = 0
    @products.each do |_id, product|
      price += product.price
    end
    price
  end

  def product_price(name)
    price = 0
    @products.each do |_id, product|
      price += product.price if product.name == name
    end
    price
  end

  def all_products
    @products.values
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

  def delete_product(id)
    @products.delete(id)
  end
end
