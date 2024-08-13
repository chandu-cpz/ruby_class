class Ruby 
  def method_with_args(name)
    puts "Hello #{name}"
  end

  def method_without_args
    puts "Hello"
  end
end

ruby = Ruby.new
ruby.method_with_args("Ruby")
ruby.method_without_args

