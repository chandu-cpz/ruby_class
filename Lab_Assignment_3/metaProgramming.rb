class Greeter

  def greet
    "Hello!"
  end

  def say_Hello
    puts "Hello, World!"
  end

end

greeter = Greeter.new
# Use Reflection
method_name = greeter.class.instance_methods(false)

puts "The methods in the #{greeter.class.name} class are: "
puts method_name

puts "Calling these methods: "
for method in method_name
  puts greeter.send(method)
end

# MetaProgramming
Greeter.class_eval do
  def sayBye
    puts "Goodbye!"
  end
end

puts 
puts "After metaprogamming: "
method_name = greeter.class.instance_methods(false)

puts "The methods in the #{greeter.class.name} class are: "
puts method_name

puts "Calling these methods: "
for method in method_name
  puts greeter.send(method)
end

