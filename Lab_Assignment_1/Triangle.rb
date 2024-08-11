puts "Print Triangle"

num = gets.chomp.to_i

for i in 0...num
  for j in 0..i
    print "* "
  end
  print "\n"
end
