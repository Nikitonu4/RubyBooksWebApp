require "roda"

class Application < Roda
  route do |r|
    # GET / request
    r.root do
      # r.redirect "/hello"
    end

    # /hello branch
    r.on "hello" do
      # Set variable for all routes in /hello branch
      @greeting = '<meta charset = "UTF-8"> Здравствуйте!'

      # # GET /hello/world request
      # r.get "world" do
      #   "#{@greeting} world!"
      # end

      # /hello request
      r.is do
        # GET /hello request
        r.get do
          "#{@greeting}"
        end
      end
    end

    # /get/rng branch
    r.on "get" do
  r.is "rng" do
  r.get do
    prng = Random.new.rand(100..5000)
    "<meta charset = 'UTF-8'> Значение = #{prng}"
    end
  end
end


      # /cool/hello/NAME/SURNAME branch
  r.get "cool", String, String do |name, surname|
    "Hello, #{surname} #{name}"
  end

  # /calc/min branch
  r.on "calc" do
    r.get "min", Integer, Integer do |num1,num2|
      if num1<num2
        "#{num1}"
      else
        "#{num2}"
      end
    end
end

    # # GET /post/2011/02/16/hello
    # r.get "post", Integer, Integer, Integer, String do |year, month, day, slug|
    #   "#{year}-#{month}-#{day} #{slug}" #=> "2011-02-16 hello"
    # end

    # # /search?q=barbaz
    # r.get "search" do
    #   "Searched for #{r.params['q']}" #=> "Searched for barbaz"
    # end
  end
end