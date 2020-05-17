# frozen_string_literal: true

require 'roda'

# BookApp class of application
class BookApp < Roda
  opts[:root] = __dir__
  plugin :environments

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  route do |r|
    r.public if opts[:serve_static]
    r.root do
      'Hello, world!'
    end
  end
end
