def rename_file(file_path)
  if File.exist?(file_path)
    print "Enter new name for #{file_path}: "
    new_name = gets.chomp
    new_path = File.join(File.dirname(file_path), new_name)
    File.rename(file_path, new_path)
    puts "File renamed to #{new_path}"
  else
    puts "File not found: #{file_path}"
  end
end

def copy_file(file_path)
  if File.exist?(file_path)
    print "Enter destination path: "
    dest_path = gets.chomp
    FileUtils.cp(file_path, dest_path)
    puts "File copied to #{dest_path}"
  else
    puts "File not found: #{file_path}"
  end
end

puts "Enter file path:"
file_path = gets.chomp

puts "Choose operation:"
puts "1. Rename"
puts "2. Copy"
choice = gets.chomp.to_i

case choice
when 1
  rename_file(file_path)
when 2
  copy_file(file_path)
else
  puts "Invalid choice"
end
