class Operators

$a=10
$b=15
bool1 = true
bool2 = false

def addition
puts "Addition: #{a + b}"
end

def subtraction
puts "Subtraction: #{a - b}"
end

def relation 
puts "a > b: #{a > b}"
puts "a < b: #{a < b}"
end

def equals
puts "x != y: #{a!=b}"
end

def and
puts "bool1 AND bool2: #{bool1 && bool2}"
end

def or
puts "bool1 AND bool2: #{bool1 && bool2}"
end


flag = true

# NOT operator
puts "NOT flag: #{!flag}"

# Double NOT operator
puts "Double NOT flag: #{!!flag}"
