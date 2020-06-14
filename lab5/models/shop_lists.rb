# frozen_string_literal: true

# require_relative 'lists'
require_relative 'shop_list'
# The class that contains all our books
class ShopLists
  def initialize(lists = [])
    @lists = lists.map do |list|
      [list.id, list]
    end.to_h
  end

  def all_lists
    @lists.values
  end

   def id
    @id
  end

  def list_by_id(id)
    @lists[id]
  end

  # def add_list(parameters)
  #   list_id = if @lists.empty?
  #               1
  #             else
  #               @lists.keys.max + 1
  #             end
  #   @lists[list_id] = Lists.new(id: list_id, **parameters.to_h)
  #   @lists[list_id]
  # end

  def add_list(list)
    list_id = if @lists.size == 0
                1
              else
                @lists.keys.max + 1
              end
    @lists[list_id] = list
    @lists[list_id]
  end

  def delete_list(id)
    @lists.delete(id)
  end
end

