puts "Enter something to reverse it"

name = gets.chomp.to_s
reversed = ""
n = name.length
i = n - 1
while i >= 0
  reversed += name[i]
  i -= 1
end
puts reversed
