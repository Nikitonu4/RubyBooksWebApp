# frozen_string_literal: true

require 'psych'
require_relative 'stationery_list'
require_relative 'stationery'

# Storage for all of our statioenry data
class StoreStationerys
  attr_reader :stationery_list

  DATA_STATIONERY_STORE = File.expand_path('../../db/stationerys.yaml', __dir__)

  def initialize
    @stationery_list = StationeryList.new
    read_data
    at_exit { write_data }
  end

  def read_data
    return unless File.exist?(DATA_STATIONERY_STORE)

    yaml_data = File.read(DATA_STATIONERY_STORE)
    raw_data = Psych.load(yaml_data, symbolize_names: true)
    raw_data[:stationery_list].each do |raw_stationery|
      @stationery_list.add_real_stationery(Stationery.new(**raw_stationery))
    end
  end

  def write_data
    raw_stationerys = @stationery_list.all_stationerys.map(&:to_h)
    yaml_data = Psych.dump({
                             stationery_list: raw_stationerys
                           })
    File.write(DATA_STATIONERY_STORE, yaml_data)
  end
end
