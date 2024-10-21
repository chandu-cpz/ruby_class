require 'thread'

# Thread - Stop and Run
t = Thread.new do
  loop do
    puts "Running"
    sleep 1
  end
end
sleep 2
t.kill
puts "Stopped"

# Thread - Wakeup
t = Thread.new do
  Thread.stop
  puts "Woke up"
end
sleep 1
t.wakeup
t.join

# Thread - Value
t = Thread.new { 2 + 2 }
puts "Thread value: #{t.value}"

# Thread - Pass
5.times do |i|
  Thread.new do
    puts "Thread #{i}"
    Thread.pass
  end
end
sleep 1

# Thread - Priority
t1 = Thread.new { loop {} }
t2 = Thread.new { loop {} }
t1.priority = 3
t2.priority = 1
puts "t1 priority: #{t1.priority}, t2 priority: #{t2.priority}"
t1.kill; t2.kill

# Thread - Mutex
mutex = Mutex.new
count = 0
threads = 10.times.map do
  Thread.new do
    mutex.synchronize { count += 1 }
  end
end
threads.each(&:join)
puts "Count: #{count}"

# Thread - Fork
if Process.respond_to?(:fork)
  puts "Parent pid: #{Process.pid}"
  fork do
    puts "Child pid: #{Process.pid}"
  end
  Process.wait
else
  puts "Fork not supported on this system"
end
