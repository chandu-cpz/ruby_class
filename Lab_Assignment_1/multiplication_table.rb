puts "Enter a number for multiplication table"
num = gets.chomp.to_i
for i in 1..10 do
  puts "#{num} x #{i} = #{num*i}"
end
