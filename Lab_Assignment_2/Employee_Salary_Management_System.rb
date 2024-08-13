class Employee
  attr_accessor :name, :salary
  def initialize(name, salary)
    @name = name
    @salary = salary
  end
end

class EmployeeSalaryManagementSystem
  def initialize
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def total_salary
    @employees.inject(0) { |sum, employee| sum + employee.salary }
  end

  def average_salary
    total_salary / @employees.size
  end
  def display_emp
    @employees.each {|employee| puts employee.name} 
  end
end

employee1 = Employee.new('Chandrakanth', 50000)
employee2 = Employee.new('Chaitanya', 60000)
employee3 = Employee.new('Something', 70000)

esms = EmployeeSalaryManagementSystem.new
esms.add_employee(employee1)
esms.add_employee(employee2)
esms.add_employee(employee3)

puts "Total salary: #{esms.total_salary}"
puts "Average salary: #{esms.average_salary}"
puts "All Employees"
esms.display_emp
