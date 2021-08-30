# frozen_string_literal: true

require_relative 'stationery'

# The class that contains all our stationery
class StationeryList
  def initialize(stationerys = [])
    @stationerys = stationerys.map do |stationery|
      [stationery.id, stationery]
    end.to_h
  end

  def all_stationerys
    @stationerys.values
  end

  def count_stationerys
    count = 0
    @stationerys.each do |stationery|
      count += stationery.quantity
    end
  end

  def total_stationerys
    total = 0
    @stationerys.values.each do |stationery|
      total += stationery.quantity
    end
    total
  end

  def stationery_by_id(id)
    @stationerys[id]
  end

  def add_stationery(parameters)
    stationery_id = if @stationerys.empty?
                      1
                    else
                      @stationerys.keys.max + 1
                    end
    @stationerys[stationery_id] = Stationery.new(id: stationery_id, **parameters.to_h)
    @stationerys[stationery_id]
  end

  def add_real_stationery(stationery)
    @stationerys[stationery.id] = stationery
  end

  def delete_stationery(id)
    @stationerys.delete(id)
  end

  def decrease_quantity(num, id)
    @stationerys[id].quantity -= num if num < @stationerys[id].quantity
  end

  def id_by_name(name)
    @stationerys.each do |id, stationery|
      return id if stationery.name == name
    end
  end
end
