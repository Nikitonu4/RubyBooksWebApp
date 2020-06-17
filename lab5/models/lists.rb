# frozen_string_literal: true

require_relative 'list'

# The class that contains all our books
class Lists
  def initialize(lists = [])
    @lists = lists.map do |list|
      [list.id, list]
    end.to_h
  end

  def all_lists
    @lists.values
  end

  def names
    names = []
    @lists.each do |id, list|
      names.append(list.name)
    end
    names
  end

  def id_by_name(name) 
    @lists.each do |id, list| 
      if(list.name == name)
        return id
      end
    end
  end

  def list_by_id(id)
    @lists[id]
  end

  def all_keys
    @lists.keys
  end

  def add_list(parameters)
    list_id = if @lists.empty?
                1
              else
                @lists.keys.max + 1
                    end
    @lists[list_id] = List.new(list_id, parameters)
    @lists[list_id]
  end

  def delete_list(id)
    @lists.delete(id)
  end
end
