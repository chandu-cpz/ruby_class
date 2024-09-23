module Hello 
  def say_Hello
    puts "Hello, World!"
  end 
end

module Greetable
  def greet
    "Hello!, This is a greeting"
  end
end

class Person
  include Greetable
  include Hello 
end

person = Person.new
puts person.greet
puts person.say_Hello
