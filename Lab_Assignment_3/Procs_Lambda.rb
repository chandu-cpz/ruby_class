
def test
  puts "You are in the method"
  yield
  yield
  puts "You are again back to the method"
end
test {puts "You are in the block"}

puts "From Proc"
greet =  Proc.new { puts "Hello, World!" }
greet.call()

puts "From lambda"
greet = lambda { puts "Hello, World!" } 
greet.call
