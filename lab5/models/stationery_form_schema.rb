# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

StationeryFormSchema = Dry::Schema.Params do
  required(:name).filled(SchemaTypes::StrippedString)
  required(:price).filled(:float, gt?: 0)
  required(:quantity).filled(:integer, gt?: 0)
end
