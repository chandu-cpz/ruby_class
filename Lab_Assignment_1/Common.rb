puts "The Both array's are: "

num = [1, 2, 3, 4, 5]
nums = [2, 6, 5, 3, 8]
puts num.join(', ')
puts nums.join(', ')
puts
puts "The common elements are: "
num.each do |n|
  if nums.include?(n)
    print "#{n} "
  end
end
