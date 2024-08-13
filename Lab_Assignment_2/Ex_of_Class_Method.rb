class Ruby 
  def self.iseven?(num)
    return num%2 == 0
  end
  def isodd?(num)
    return !Ruby.iseven?(num)
  end
end
r = Ruby.new
puts r.isodd?(10);
