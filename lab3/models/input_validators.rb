# frozen_string_literal: true

# Validators for the incoming requests
module InputValidators
  def self.check_description(raw_author, raw_name, raw_date)
    author = raw_author || ''
    name = raw_name || ''
    date = raw_date || ''
    errors = [].concat(check_date_format(date))
               .concat(check_numbers_date(date))
               .concat(check_author(author))
               .concat(check_name(name))
               .concat(check_date(date))
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

  def self.check_numbers_date(date)
    array_of_date = date.split('-').map(&:to_i)
    if(array_of_date[0] == nil)
      ['Вы не ввели год']
    elsif(array_of_date[1] == nil)
      ['Вы не ввели месяц']
    elsif(array_of_date[2] == nil)
      ['Вы не ввели день']
    elsif (array_of_date[0] < 1) || (array_of_date[0] > 2020)
      ['Год не может быть меньше 1 больше 2020']
    elsif (array_of_date[1] < 1) || (array_of_date[1] > 12)
      ['Месяц не может быть меньше 1 и больше 12']
    elsif (array_of_date[2] < 1) || (array_of_date[2] > 31)
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
      []
    end
  end
end
