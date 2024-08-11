$Admin = "The Great Admin"

class Greeter
  INTEREST=99
  def initialize(name,sal)
    @name = name
    @@sal = sal
  end
  def say_hi
    puts "Hi #{@name}"
  end
  

  def say_bye
    puts "Bye #{@name}"
  end

  def say_interest
    puts "The constant interest is #{INTEREST}"
  end

  def say_admin
    puts "The admin is #{$Admin}"
  end

  def say_salary
    salary = @@sal*INTEREST
    puts " the salary of the employee #{@name} is #{salary}"
  end
end
greeter = Greeter.new("Chandrakanth",200)
greeter.say_hi
greeter.say_bye
greeter.say_interest
greeter.say_admin
greeter.say_salary
