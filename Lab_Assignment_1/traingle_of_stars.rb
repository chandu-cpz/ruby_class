#teh program is not done yet

print "Enter a number for triangle of stars" 
num = gets.chomp.to_i
step=0
while step!=num
  temp_step=step
  while temp_step!=0
    print " "
    temp_step-=1
  end
  for i in 1..num-2*step
    print "*"
  end
  puts 
  step+=2
end
