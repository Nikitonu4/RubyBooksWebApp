# frozen_string_literal: true

require 'roda'

# BookApp class of application
class BookApp < Roda
  route do |r|
    r.root do
      'Hello, wordl!'
    end
  end
end
