
module Greetable
  def greet
    "Hello!"
  end
end

class Person
  include Greetable
end

person = Person.new
puts person.greet
