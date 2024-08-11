
puts "Redo"
(1..10).each do |i|
  if i==10
    i=i-1;
    redo
  end
  puts "#{i}"
end
puts

puts "Break"
(1..10).each do |i|
  if i==7
    break
  end
  puts "#{i}"
end
