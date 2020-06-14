# frozen_string_literal: true

require 'dry-schema'
require_relative 'schema_types'

BookFilterFormSchema = Dry::Schema.Params do
  optional(:title).maybe(SchemaTypes::StrippedString)
  optional(:genre).maybe(SchemaTypes::StrippedString)
end
