class EmployeeDatabase
  def initialize
    @employee_records = []
  end

  def add_employee(name, department, salary)
    @employee_records << Employee.new(name, department, salary)
  end

  def highest_paid_employee
    @employee_records.max_by { |employee| employee.salary }
  end

  def print_all_employee_details
    @employee_records.each { |employee| puts employee }
  end
end

class Employee
  attr_accessor :name, :department, :salary

  def initialize(name, department, salary)
    @name = name
    @department = department
    @salary = salary
  end

  def to_s
    "Name: #{@name}, Department: #{@department}, Salary: $#{@salary}"
  end
end

employee_db = EmployeeDatabase.new
employee_db.add_employee("Chandu", "Engineering", 95000)
employee_db.add_employee("Chaitanya", "Marketing", 88000)
employee_db.add_employee("Jogi", "HR", 72000)

puts "All Employees:"
employee_db.print_all_employee_details

highest_paid = employee_db.highest_paid_employee
puts "\nHighest Paid Employee:"
puts highest_paid

