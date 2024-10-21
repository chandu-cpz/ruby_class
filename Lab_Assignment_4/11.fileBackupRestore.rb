require 'fileutils'

# Backup
source_dir = Dir.pwd  # Current working directory
backup_dir = File.join(Dir.pwd, 'backup')

# Create backup directory if it doesn't exist
FileUtils.mkdir_p(backup_dir) unless Dir.exist?(backup_dir)

# Backup files and directories, excluding the backup directory itself
Dir.glob(File.join(source_dir, '*')) do |item|
  next if item == backup_dir
  FileUtils.cp_r(item, backup_dir)
end

puts "Backup completed successfully."

Dir.glob(File.join(backup_dir, '*')) do |item|
  FileUtils.cp_r(item, source_dir)
end
puts "Restore completed successfully."
