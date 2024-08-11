puts "Enter a number to get the Fibonacci sequence up to that number:"
limit = gets.chomp.to_i

if limit <= 0
  puts "Please enter a positive number."
  exit(1)
end

sequence = [0, 1]

prev, curr = 0, 1
if curr<limit
  print "0 " 
end
while curr < limit
  print "#{curr} " 
  prev, curr = curr, prev + curr
end
