require 'fileutils'

# 1. Create a directory in Ruby
FileUtils.mkdir_p('test')
puts "1. Directory created"

# 2. Check if a directory exists in Ruby
if File.directory?('test')
  puts "2. Directory exists"
else
  puts "2. Directory does not exist"
end

# 3. List files in a directory using Ruby
puts "3. Listing files in 'test' directory:"
Dir.foreach('test') do |file|
  puts file
end

# 4. Create a file in Ruby
File.open('test/sample.txt', 'w') do |f|
  f.puts "Hello World"
end
puts "4. File created"

# 5. Write to a file in Ruby and use various methods like seek(), lineno(), eof(), size()
File.open('test/sample.txt', 'r+') do |f|
  f.seek(0, IO::SEEK_END)
  f.puts "New line added"
  
  f.seek(0)
  puts "5. File content:"
  f.each_line do |line|
    puts "Line #{f.lineno}: #{line.chomp}"
  end
  
  puts "End of file? #{f.eof?}"
  puts "File size: #{f.size} bytes"
end

# 6. Read from a file in Ruby
puts "6. Reading from file:"
File.open('test/sample.txt', 'r') do |f|
  while line = f.gets
    puts line
  end
end

# 8. Rename a file in Ruby
File.rename('test/sample.txt', 'test/new_name.txt')
puts "8. File renamed from 'sample.txt' to 'new_name.txt'"

# 7. Delete a file in Ruby
File.delete('test/new_name.txt')
puts "7. File deleted"

# Clean up
FileUtils.rm_rf('test')
puts "Test directory and files cleaned up"
