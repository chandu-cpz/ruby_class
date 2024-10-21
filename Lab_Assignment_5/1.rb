f1 = Fiber.new do
  puts "F1 start"
  Fiber.yield "F1 yield"
  puts "F1 end"
  "F1 done"
end

puts f1.resume
puts f1.resume

f3 = Fiber.new do
  puts "F3 here"
  "F3 done"
end

f2 = Fiber.new do
  puts "F2 start"
  result = f3.transfer "To F3"
  puts "F2 resumed with: #{result}"
  puts "F2 end"
end

puts f2.resume

f4 = Fiber.new do
  puts "F4 start"
  begin
    Fiber.yield "F4 yield"
    puts "won't see this"
  rescue => e
    puts "Oops: #{e.message}"
  end
end

puts f4.resume
f4.raise "Boom!"
