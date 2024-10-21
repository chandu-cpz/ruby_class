# Splitting a file
File.open('large_file.txt', 'r') do |file|
  chunk_size = 100000  
  chunk_number = 0
  while chunk = file.read(chunk_size)
    File.open("chunk_#{chunk_number}.txt", 'w') { |f| f.write(chunk) }
    chunk_number += 1
  end
end

# Joining files
File.open('joined_file.txt', 'w') do |file|
  Dir.glob('chunk_*.txt').sort.each do |chunk_file|
    file.write(File.read(chunk_file))
  end
end
