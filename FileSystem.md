# Ruby File System Operations: A Comprehensive Guide

## File Handling

### Opening and Closing Files

Ruby provides multiple ways to open and interact with files. The most common methods are:

1. `File.open` with a block:

```ruby
File.open("example.txt", "r") do |file|
  # File operations here
end
```

This method automatically closes the file when the block ends, ensuring proper resource management.

2. `File.open` without a block:

```ruby
file = File.open("example.txt", "r")
# File operations here
file.close
```

When using this method, always remember to close the file manually to avoid resource leaks.

#### File Modes

- `"r"`: Read-only, starts at the beginning of the file (default mode).
- `"w"`: Write-only, truncates existing file to zero length or creates a new file.
- `"a"`: Write-only, appends to end of file if it exists, otherwise creates a new file.
- `"r+"`: Read-write, starts at the beginning of the file.
- `"w+"`: Read-write, truncates existing file to zero length or creates a new file.
- `"a+"`: Read-write, appends or creates new file.

Adding `b` to the mode (e.g., `"rb"`, `"wb"`) opens the file in binary mode.

### Reading from Files

Ruby offers various methods to read file contents:

1. Read entire file into a string:

```ruby
content = File.read("example.txt")
```

2. Read file line by line:

```ruby
File.foreach("example.txt") do |line|
  puts line
end
```

3. Read file into an array of lines:

```ruby
lines = File.readlines("example.txt")
```

4. Read a specific number of bytes:

```ruby
partial_content = File.read("example.txt", 100)  # Reads first 100 bytes
```

5. Using `IO` methods for more control:

```ruby
File.open("example.txt", "r") do |file|
  while (line = file.gets)
    puts line
  end
end
```

### Writing to Files

1. Write a string to a file (overwrites existing content):

```ruby
File.write("output.txt", "Hello, World!")
```

2. Append to a file:

```ruby
File.write("output.txt", "New content\n", mode: "a")
```

3. Write an array of lines:

```ruby
lines = ["Line 1", "Line 2", "Line 3"]
File.write("output.txt", lines.join("\n"))
```

4. Using `IO` methods for more control:

```ruby
File.open("output.txt", "w") do |file|
  file.puts "Line 1"
  file.write "Line 2\n"
  file.printf "Line %d\n", 3
end
```

## File Information and Manipulation

### Querying File Properties

```ruby
filename = "example.txt"

File.exist?(filename)       # Check if file exists
File.file?(filename)        # Check if it's a regular file
File.directory?(filename)   # Check if it's a directory
File.size(filename)         # Get file size in bytes
File.zero?(filename)        # Check if file is empty
File.readable?(filename)    # Check if file is readable
File.writable?(filename)    # Check if file is writable
File.executable?(filename)  # Check if file is executable
```

### File Timestamps

```ruby
File.atime(filename)  # Last access time
File.mtime(filename)  # Last modification time
File.ctime(filename)  # Last status change time (creation time on Windows)
```

### File Permissions

```ruby
# Get file permissions (as integer)
mode = File.stat(filename).mode

# Change file permissions
File.chmod(0644, filename)

# Change file ownership (if you have necessary permissions)
File.chown(user_id, group_id, filename)
```

### File Manipulation

```ruby
# Rename a file
File.rename("old_name.txt", "new_name.txt")

# Delete a file
File.delete("unwanted.txt")

# Copy a file (requires 'fileutils')
require 'fileutils'
FileUtils.cp("source.txt", "destination.txt")

# Move a file
FileUtils.mv("source.txt", "new_location/source.txt")

# Create a hard link
File.link("original.txt", "hardlink.txt")

# Create a symbolic link
File.symlink("original.txt", "symlink.txt")
```

## Directory Operations

### Creating and Removing Directories

```ruby
# Create a directory
Dir.mkdir("new_directory")

# Create nested directories
require 'fileutils'
FileUtils.mkdir_p("path/to/nested/directory")

# Remove an empty directory
Dir.rmdir("empty_directory")

# Remove a directory and its contents
FileUtils.rm_rf("non_empty_directory")
```

### Navigating Directories

```ruby
# Get current working directory
puts Dir.pwd

# Change current working directory
Dir.chdir("/path/to/new/directory")

# List directory contents
Dir.entries("directory_name")

# List directory contents (excluding . and ..)
Dir.children("directory_name")

# Iterate over directory entries
Dir.foreach("directory_name") do |entry|
  puts entry unless entry.start_with?(".")
end

# Get files matching a pattern
Dir.glob("*.txt")

# Recursively get files matching a pattern
Dir.glob("**/*.txt")
```

## Advanced File and Path Operations

### Path Manipulation

```ruby
# Join path components
full_path = File.join("path", "to", "file.txt")

# Split path into components
directory, file = File.split("/path/to/file.txt")

# Get absolute path
abs_path = File.absolute_path("relative/path")

# Expand path (resolves ~, .., etc.)
expanded_path = File.expand_path("~/documents/file.txt")

# Get file extension
extension = File.extname("file.txt")  # => ".txt"

# Get base name (filename without directory)
basename = File.basename("/path/to/file.txt")  # => "file.txt"

# Get directory name
dirname = File.dirname("/path/to/file.txt")  # => "/path/to"
```

### File Streams and IO

```ruby
# Read file in binary mode
binary_data = File.binread("image.jpg")

# Write file in binary mode
File.binwrite("output.jpg", binary_data)

# Open file for both reading and writing
File.open("example.txt", "r+") do |file|
  existing_content = file.read
  file.rewind
  file.write "New content\n" + existing_content
end

# Seek to a specific position in file
File.open("example.txt", "r") do |file|
  file.seek(10, IO::SEEK_SET)  # Seek to the 10th byte
  puts file.read(5)  # Read 5 bytes from that position
end

# Get current position in file
File.open("example.txt", "r") do |file|
  file.seek(20, IO::SEEK_SET)
  puts file.tell  # => 20
end
```

### Temporary Files and Directories

```ruby
require 'tempfile'

# Create a temporary file
Tempfile.create("prefix") do |file|
  file.write "Temporary content"
  file.rewind
  puts file.read
end

# Create a temporary directory
require 'tmpdir'
Dir.mktmpdir do |dir|
  File.write(File.join(dir, "temp.txt"), "Content in temp directory")
end
```

This enhanced guide provides a more comprehensive overview of Ruby's file system operations, including detailed explanations, varied examples, and coverage of advanced topics. It should serve as a richer resource for understanding and working with files and directories in Ruby.