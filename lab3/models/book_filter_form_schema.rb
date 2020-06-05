require 'dry-schema'

BookFilterFormSchema = Dry::Schema.Params do
  # optional(:date).maybe(:string, format?: /\d{4}-\d{2}-\d{2}/)
  optional(:read_format).maybe(:string)
end
