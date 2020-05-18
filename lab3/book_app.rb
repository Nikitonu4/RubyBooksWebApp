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

  opts[:books] = BookList.new([
                                Book.new('Булгаков', 'Мастер и Маргарита', '2018-02-12'),
                                Book.new('Рудазов', 'Серая чума', '2019-06-04'),
                                Book.new('Бунин', 'Жизнь Арсеньева', '2019-03-23'),
                                Book.new('Достоевский', 'Преступление и наказание', '2020-02-20'),
                                Book.new('Круз', 'Выживатель', '2010-12-07'),
                                Book.new('Толстой', 'Война и мир', '2020-02-24'),
                                Book.new('Мележ', 'Дыхание грозы', '2020-01-13'),
                                Book.new('Ахматова', 'Вечер', '2020-06-08'),
                                Book.new('Брэдбери', 'Посещение', '2010-12-09'),
                                Book.new('Скотт', 'Квентин Дорвард', '2014-11-11')
                              ])
                              
  route do |r|
    r.public if opts[:serve_static]
    r.root do
      @books = opts[:books].sort_by_date
      view('books')
    end

    r.on 'new' do
      r.get do
        view('new_book')
      end
      r.post do
        @params = InputValidators.check_description(r.params['author'], r.params['name'], r.params['date'])
        if @params[:errors].empty?
          opts[:books].add_book(Book.new(@params[:author], @params[:name], @params[:date]))
          r.redirect '/'
        else
          view('new_book')
        end
      end
    end

    r.on 'statistics' do
      r.get do
          @books = opts[:books].sort_by_date
          @years = opts[:books].get_list_years
          view('statistics')
      end
      # r.get Integer do |year|
      #   # @books = opts[:books].sort_by_date
      #   @year = year
      #   pp @year
      #   view('read_books')
      # end
    # end

    end
  end
end
