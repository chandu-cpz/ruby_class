threads = []

10.times do |i|
  threads << Thread.new do
    sleep_time = rand(5)
    sleep(sleep_time)
    puts "Thread #{i} slept for #{sleep_time} seconds"
  end
end

threads.each(&:join)

puts "All threads finished"
