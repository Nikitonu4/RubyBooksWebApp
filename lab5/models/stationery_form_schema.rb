# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

StationeryFormSchema = Dry::Schema.Params do
  required(:name).filled(SchemaTypes::StrippedString)
  required(:price).filled(:float)
  required(:quantity).filled(:integer)
end
