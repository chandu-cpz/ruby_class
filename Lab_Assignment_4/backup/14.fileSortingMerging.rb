def sort_and_merge_files(directory, output_file)
  # Get all text files in the directory
  files = Dir.glob(File.join(directory, '*.txt'))

  # Read and sort content from all files
  sorted_content = files.flat_map do |file|
    File.readlines(file).map(&:chomp)
  end.sort

  # Write sorted content to output file
  File.open(output_file, 'w') do |file|
    sorted_content.each { |line| file.puts(line) }
  end

  puts "Merged and sorted #{files.size} files into #{output_file}"
end

puts "Enter directory containing files to merge:"
directory = gets.chomp

puts "Enter output file name:"
output_file = gets.chomp

sort_and_merge_files(directory, output_file)
