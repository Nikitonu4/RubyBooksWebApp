# frozen_string_literal: true

require 'dry-schema'

require_relative '../schema_types'

BuyFormSchema = Dry::Schema.Params do
  required(:name).filled(SchemaTypes::StrippedString)
end
