# frozen_string_literal: true

# require_relative 'lists'
require_relative 'shop_list'
# The class that contains all our books
class ShopLists
  def initialize(lists = [])
    @lists = lists
  end

  def all_lists
    @lists.dup
  end

  def list_by_id(id)
    @lists[id]
  end

  def add_list(_list)
    @lists[list_id] = list(list_id)
    @lists[list_id]
  end

  def delete_list(id)
    @lists.delete(id)
  end
end
