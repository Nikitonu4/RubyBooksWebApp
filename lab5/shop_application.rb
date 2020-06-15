# frozen_string_literal: true

require 'date'
require 'forme'
require 'roda'

require_relative 'models'

# The application class
class ShopApplication < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :forme
  plugin :hash_routes
  plugin :path
  plugin :render
  plugin :status_handler
  plugin :view_options

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  require_relative 'routes/shop.rb'

  opts[:store_books] = StoreBooks.new
  opts[:books] = opts[:store_books].book_list

  opts[:store_stationerys] = StoreStationerys.new
  opts[:stationerys] = opts[:store_stationerys].stationery_list

  opts[:lists] = ShopLists.new

  status_handler(404) do
    view('not_found')
  end
  
  route do |r|
    r.public if opts[:serve_static]
    r.hash_branches
    r.root do
      r.redirect shop_path
    end
  end
end
