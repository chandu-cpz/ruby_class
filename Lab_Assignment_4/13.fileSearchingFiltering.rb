def search_files(directory, options = {})
  Dir.glob(File.join(directory, '**', '*')).select do |file|
    File.file?(file) &&
    (options[:name].nil? || File.basename(file) =~ /#{options[:name]}/) &&
    (options[:extension].nil? || File.extname(file) == ".#{options[:extension]}") &&
    (options[:size].nil? || File.size(file) > options[:size])
  end
end

puts "Enter directory to search:"
directory = gets.chomp

puts "Enter search criteria (press Enter to skip):"
print "Name pattern: "
name_pattern = gets.chomp
print "File extension: "
extension = gets.chomp
print "Minimum size (in bytes): "
min_size = gets.chomp.to_i

options = {}
options[:name] = name_pattern unless name_pattern.empty?
options[:extension] = extension unless extension.empty?
options[:size] = min_size if min_size > 0

results = search_files(directory, options)

puts "Search results:"
results.each { |file| puts file }
puts "Total files found: #{results.size}"
