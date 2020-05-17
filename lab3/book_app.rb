require 'roda'

class BookApp < Roda
  route do |r|
    r.root do
      'Hello, wordl!'
    end
  end
end