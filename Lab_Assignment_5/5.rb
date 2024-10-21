require 'fiber'

outer_var = "Outer"

t = Thread.new do
  thread_var = "Thread"
  puts "Thread: #{thread_var}, #{outer_var}"
  
  f = Fiber.new do
    fiber_var = "Fiber"
    puts "Fiber in Thread: #{fiber_var}, #{thread_var}, #{outer_var}"
  end
  
  f.resume
end

t.join
