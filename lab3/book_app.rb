# frozen_string_literal: true

require 'roda'
require_relative 'models'
# BookApp class of application
class BookApp < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render
  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  
  route do |r|
    r.public if opts[:serve_static]

@books = BookList.new([
                          Book.new('Булгаков', 'Мастер и Маргарита', '2018-02-12'),
                          Book.new('Рудазов', 'Серая чума', '2019-06-04'),
                          Book.new('Бунин', 'Жизнь Арсеньева', '2019-03-23'),
                          Book.new('Достоевский', 'Преступление и наказание', '2017-02-20')
                        ])

    r.root do
      'Hello, world!'
    end
    

    r.on 'books' do
      @some_books = [1, 2, 15]
      view('books', locals: { data: 'Данные из контроллера' })
    end
  end
end
