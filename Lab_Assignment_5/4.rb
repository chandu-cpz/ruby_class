require 'fiber'

outer_var = "Outer"

f = Fiber.new do
  fiber_var = "Fiber"
  puts "Fiber: #{fiber_var}, #{outer_var}"
  
  Thread.new do
    thread_var = "Thread"
    puts "Thread in Fiber: #{thread_var}, #{fiber_var}, #{outer_var}"
  end.join

  Fiber.yield
end

f.resume
f.resume
