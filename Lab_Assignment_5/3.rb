require 'fiber'

main_var = "Main thread variable"
puts "Main thread: #{main_var}"

thread_var = nil
thread = Thread.new do
  thread_var = "Thread local variable"
  puts "Thread: #{thread_var}"
end
thread.join

fiber_var = nil
fiber = Fiber.new do
  fiber_var = "Fiber local variable"
  puts "Fiber: #{fiber_var}"
end
fiber.resume

puts "Main thread after: #{main_var}"
puts "Thread var from main: #{thread_var.nil? ? 'nil' : thread_var}"
puts "Fiber var from main: #{fiber_var.nil? ? 'nil' : fiber_var}"
