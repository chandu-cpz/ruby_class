a = [1, 2, 3, 4, 5, 6]
puts "Array: #{a}"
puts "First element: #{a[0]}"      
puts "Last element: #{a[-1]}"     
puts "First 3 elements: #{a[0, 3]}"   
puts "Elements from index 1 to 3: #{a[1..3]}"   

# Array methods
puts "Length of the array: #{a.length}"  
puts "Reversed array: #{a.reverse}" 
puts "Array includes 3: #{a.include?(3)}"  
puts "Index of 4: #{a.index(4)}"     
puts "Shuffled array: #{a.shuffle}"  

# Adding and deleting elements
a.push(7)       
a << 8          
a.unshift(0)    
puts "Array after adding elements: #{a}"

a.pop           
a.shift         
a.delete(3)     
puts "Array after deleting elements: #{a}"

b = [4, 5, 6, 7, 8]
c = [6, 7, 8, 9, 10]

puts "Intersection of a and b: #{a & b}"      
puts "Intersection of b and c: #{b & c}"      

puts "Concatenation of a and b: #{a + b}"      
puts "Concatenation of b and c: #{b + c}"      

puts "Difference between a and b: #{a - b}"      
puts "Difference between b and c: #{b - c}"      

# Perform binary search using inbuilt method
result = a.bsearch { |x| x == 5 }  
puts "Binary search result for 5: #{result}"
