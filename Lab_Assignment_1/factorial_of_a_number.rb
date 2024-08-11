puts "Enter a number "
num = gets.chomp.to_i
if num <= 1
  puts num
  exit(0)
end
factorial =1
while num!=0
  factorial*=num
  num-=1
end
puts "The factorial is #{factorial}"
