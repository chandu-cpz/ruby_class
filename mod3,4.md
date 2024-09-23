

```markdown
# Ruby's Building Blocks

## Arrays

Arrays in Ruby are indexed collections that store objects accessible using a key (integer).

- Creation:
  ```ruby
  a = [1, "two", 3.0]  # Literal constructor
  a = Array.new        # Explicit creation
  a = Array.new(3)     # [nil, nil, nil]
  a = Array.new(3, true) # [true, true, true]
  ```

- Multi-dimensional arrays:
  ```ruby
  a = Array.new(3) { Array.new(3) }
  # [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  ```

### Accessing Elements

- Using `Array[]` method:
  ```ruby
  arr = [1, 2, 3, 4, 5, 6]
  arr[2]      # => 3
  arr[100]    # => nil
  arr[-3]     # => 4
  arr[2, 3]   # => [3, 4, 5]
  arr[1..4]   # => [2, 3, 4, 5]
  arr[1..-3]  # => [2, 3, 4]
  ```

- Using `at` method:
  ```ruby
  arr.at(0)   # => 1
  ```

### Modifying Arrays

```ruby
a = Array.new
a[4] = "4"                    # [nil, nil, nil, nil, "4"]
a[0, 3] = [ 'a', 'b', 'c' ]   # ["a", "b", "c", nil, "4"]
a[1..2] = [ 1, 2 ]            # ["a", 1, 2, nil, "4"]
a[0, 2] = "?"                 # ["?", 2, nil, "4"]
a[0..2] = "A"                 # ["A", "4"]
a[-1] = "Z"                   # ["A", "Z"]
a[1..-1] = nil                # ["A", nil]
a[1..-1] = []                 # ["A"]
a[0, 0] = [ 1, 2 ]            # [[1, 2], "A"]
a[3, 0] = "B"                 # [[1, 2], "A", "B"]
```

### Array Methods

- `length`, `count`, `size`: Return number of elements
- `empty?`: Check if array is empty
- `include?`: Check if element exists in array

### Adding Items

```ruby
arr = [1, 2, 3, 4]
arr.push(5)   # [1, 2, 3, 4, 5]
arr << 6      # [1, 2, 3, 4, 5, 6]
arr.unshift(0) # [0, 1, 2, 3, 4, 5, 6]
```

### Removing Items

```ruby
arr.pop       # Removes and returns last element
arr.shift     # Removes and returns first element
arr.delete_at(2) # Removes element at index 2
arr.delete(2) # Removes all occurrences of 2
arr.compact!  # Removes nil values
arr.uniq      # Removes duplicate elements
```

### Other Array Operations

- Set operations: `&` (intersection), `+` (concatenation), `-` (difference)
- `clear`: Removes all elements
- `bsearch`: Binary search
- `each`, `map`, `select`, `reject`: Iteration methods
- `reverse_each`: Iterate in reverse order
- `flatten`: Flattens nested array
- `sort`: Sorts the array

## Ranges

```ruby
(1...5).to_a           # [1, 2, 3, 4]
(1..10).step(2).to_a   # [1, 3, 5, 7, 9]
('a'..'f').include?('c') # true
('a'..'f').cover?('z')   # false
```

## Numbers

```ruby
require 'bigdecimal'
a = BigDecimal("0.1") + BigDecimal("0.2")
b = BigDecimal("0.3")
a == b  # true

c1 = Complex(2, 3)  # 2 + 3i
c2 = Complex(1, -1) # 1 - i
c1 + c2  # Complex(3, 2)

Math.sqrt(16)  # 4.0
Math.log(10)   # 2.302585092994046
Math.sin(Math::PI / 2)  # 1.0

rand      # Random float between 0.0 and 1.0
rand(100) # Random integer between 0 and 99
```

## Strings

- Creation and manipulation:
  ```ruby
  "Ho! " * 3  # "Ho! Ho! Ho! "
  str1 + str2 # Concatenation
  "Hello, #{name}!"  # Interpolation
  ```

- Formatting:
  ```ruby
  sprintf("The value of pi is %.2f", num)
  ```

- Substring manipulation:
  ```ruby
  str[0]      # First character
  str[7, 5]   # 5 characters starting at index 7
  str[7..11]  # Range of characters
  ```

- Case manipulation:
  ```ruby
  str.upcase
  str.downcase
  str.capitalize
  str.swapcase
  ```

- Trimming:
  ```ruby
  str.strip  # Removes leading and trailing whitespace
  ```

## Containers

### Hashes

```ruby
hash = { 1 => "one", 2 => "two", 3 => "three" }
puts hash[2]  # "two"
```

### Sets

```ruby
require 'set'
set1 = Set.new([1, 2, 3])
set2 = Set.new([3, 4, 5])
set1.union(set2)         # {1, 2, 3, 4, 5}
set1.intersection(set2)  # {3}
set1.difference(set2)    # {1, 2}
set1.subset?(set2)       # false
```

### Stack and Queue

```ruby
# Stack
stack = []
stack.push(1)
stack.push(2)
stack.pop  # 2

# Queue
require 'thread'
queue = Queue.new
queue.push(1)
queue.push(2)
queue.pop  # 1
```

## File and Directory Operations

### Reading Files

```ruby
File.open("example.txt", "r") do |file|
  contents = file.read
  puts contents
end

# Reading line by line
File.open("filename.txt") do |file|
  while line = file.gets
    puts line
  end
end

# Using foreach
IO.foreach("testfile") {|line| puts line }

# Reading entire file
str = IO.read("testfile")
arr = IO.readlines("testfile")
```

### Writing to Files

```ruby
File.open("output.txt", "w") do |file|
  file.puts "Hello"
  file.puts "1 + 2 = #{1+2}"
end

# Appending to a file
File.open("output.txt", "a") do |file|
  file.puts("This is a new line.")
end
```

### File Operations

- Checking if a file exists: `File.exist?("filename.txt")`
- Renaming a file: `File.rename("oldname.txt", "newname.txt")`
- Deleting a file: `File.delete("filename.txt")`
- Copying a file: `FileUtils.cp("sourcefile.txt", "destinationfile.txt")`

### Directory Operations

```ruby
Dir.mkdir("mydir")
dir = Dir.new("path/to/directory")
entries = dir.entries
```

### CSV Operations

```ruby
require 'csv'

CSV.foreach("data.csv") do |row|
  puts row[0]  # Prints the first column of each row
end

# Reading specific rows and columns
row_indices = [1, 3]
column_indices = [1, 3]

CSV.foreach("data.csv").with_index do |row, i|
  if row_indices.include?(i)
    selected_columns = row.values_at(*column_indices)
    puts selected_columns.inspect
  end
end
```

## Encryption and Decryption

```ruby
require 'openssl'

def encrypt(plaintext, key, iv)
  cipher = OpenSSL::Cipher.new('AES-256-CBC')
  cipher.encrypt
  cipher.key = key
  cipher.iv = iv
  encrypted = cipher.update(plaintext) + cipher.final
  encrypted
end

def decrypt(ciphertext, key, iv)
  cipher = OpenSSL::Cipher.new('AES-256-CBC')
  cipher.decrypt
  cipher.key = key
  cipher.iv = iv
  decrypted = cipher.update(ciphertext) + cipher.final
  decrypted
end
```

## File Compression and Decompression

```ruby
require 'zlib'

def compress_file(input_file, output_file)
  Zlib::GzipWriter.open(output_file) do |gzip|
    File.open(input_file, 'rb') do |input|
      while (data = input.read(4096))
        gzip.write(data)
      end
    end
  end
end

def decompress_file(input_file, output_file)
  Zlib::GzipReader.open(input_file) do |gzip|
    File.open(output_file, 'wb') do |output|
      while (data = gzip.read(4096))
        output.write(data)
      end
    end
  end
end
```

## Search and Replace in Files

```ruby
def search_and_replace(input_file, output_file, search_pattern, replace_pattern)
  File.open(output_file, 'w') do |output|
    File.foreach(input_file) do |line|
      output.puts line.gsub(search_pattern, replace_pattern)
    end
  end
end
```

This comprehensive set of notes covers the main topics and functions discussed in the provided content. It's formatted in Markdown and ready to be pasted into Obsidian.
```

These notes provide a comprehensive overview of the Ruby concepts and methods covered in the provided content. They're formatted in Markdown and ready to be pasted into Obsidian. The notes include examples and explanations for arrays, ranges, numbers, strings, containers (including hashes and sets), file and directory operations, encryption/decryption, file compression/decompression, and search/replace operations in files.