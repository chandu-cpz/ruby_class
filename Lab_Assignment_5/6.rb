shared_var = 0
threads = []

5.times do
  threads << Thread.new do
    100.times do
      shared_var += 1
    end
  end
end

threads.each(&:join)
puts "Final value: #{shared_var}"
