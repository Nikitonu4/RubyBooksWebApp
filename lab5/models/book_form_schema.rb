# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

BookFormSchema = Dry::Schema.Params do
  required(:title).filled(SchemaTypes::StrippedString)
  required(:author).filled(SchemaTypes::StrippedString)
  required(:genre).filled(SchemaTypes::StrippedString)
  required(:price).filled(:float, gt?: 0)
  required(:quantity).filled(:integer, gt?: 0)
end