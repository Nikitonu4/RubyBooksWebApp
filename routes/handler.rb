# frozen_string_literal: true

# Handler path
class ShopApplication
  path :shop, '/shop'

  path :books_new, '/shop/books/new'
  path :books_filter, '/shop/books/filter'
  path :books, '/shop/books'
  path :statistics, '/shop/books/statistics'

  path :stationerys, '/shop/stationerys'
  path :stationerys_new, '/shop/stationerys/new'

  path :lists, '/shop/lists'
  path :lists_new, '/shop/lists/new'

  path Book do |book, action|
    if action
      "/shop/books/#{book.id}/#{action}"
    else
      "/shop/books/#{book.id}"
    end
  end

  path Stationery do |stationery, action|
    if action
      "/shop/stationerys/#{stationery.id}/#{action}"
    else
      "/shop/stationerys/#{stationery.id}"
    end
  end

  path List do |list, action, product_name|
    if product_name
      "/shop/lists/#{list.id}/#{list.id_by_name(product_name)}/#{action}"
    elsif action
      "/shop/lists/#{list.id}/#{action}"
    else
      "/shop/lists/#{list.id}"
    end
  end
end
