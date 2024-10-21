require 'csv'

csv_data = CSV.read('example.csv', headers: true)

columns_to_print = ['Name', 'Age']

rows_to_print = [1, 3]

puts "Headers: #{columns_to_print.join(', ')}"

csv_data.each_with_index do |row, index|
  if rows_to_print.include?(index)
    selected_row = columns_to_print.map { |col| row[col] }.join(', ')
    puts "Row #{index + 1}: #{selected_row}"
  end
end
