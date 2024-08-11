puts "Enter a number to check for prime"
num = gets.chomp.to_i
i = 2
while i<=num
  if num%2==0
    puts "#{num} is not a prime number"
    exit(0)
  end
  i+=1
end
puts "#{num} is a prime number"
