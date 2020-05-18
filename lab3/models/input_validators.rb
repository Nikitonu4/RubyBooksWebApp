# frozen_string_literal: true

# Validators for the incoming requests
module InputValidators
  def self.check_description(raw_author, raw_name, raw_date)
    author = raw_author || ''
    name = raw_name || ''
    date = raw_date || ''
    errors = [].concat(check_date(date))
               .concat(check_date_format(date))
               .concat(check_author(author))
               .concat(check_name(name))
    {
      author: author,
      name: name,
      date: date,
      errors: errors
    }
  end

  def self.check_date_format(date)
    if /\d{4}-\d{2}-\d{2}/ =~ date
      []
    else
      ['Дата должна быть передана в формате ГГГГ-ММ-ДД']
    end
  end

  def self.check_n_d(date)
    array = date.split('-').map(&:to_i)
    check_year(array)
  end

  def self.check_year(array)
    if array[0].nil?
      ['Вы ввели пустой год']
    elsif (array[0] < 1) || (array[0] > 2020)
      ['Год не может быть меньше 1 больше 2020']
    else
      check_month(array)
    end
  end

  def self.check_month(array)
    if array[1].nil?
      ['Вы ввели пустой месяц']
    elsif (array[1] < 1) || (array[1] > 12)
      ['Месяц не может быть меньше 1 и больше 12']
    else
      check_day(array)
    end
  end

  def self.check_day(array)
    if array[2].nil?
      ['Вы ввели пустой день в дате']
    elsif (array[2] < 1) || (array[2] > 31)
      ['День не может быть меньше 1 больше 31']
    else
      []
    end
  end

  def self.check_author(author)
    if author.empty?
      ['Имя автора не может быть пустым']
    else
      []
    end
  end

  def self.check_name(name)
    if name.empty?
      ['Название книги  не может быть пустым']
    else
      []
    end
  end

  def self.check_date(date)
    if date.empty?
      ['Дата не может быть пустой']
    else
      check_n_d(date)
    end
  end
end
