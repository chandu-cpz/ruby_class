
class Ruby
  attr_accessor :num

  def iseven?
    return @num % 2 == 0
  end

  def num=(num)
    @num = num
  end
end


r = Ruby.new
r.num = 10
puts r.iseven?
puts r.num
