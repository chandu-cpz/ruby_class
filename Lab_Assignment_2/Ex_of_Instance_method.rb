class Ruby
  attr_accessor :num

  def iseven?(num)
    return num % 2 == 0
  end

end


r = Ruby.new
puts r.iseven?(10)
