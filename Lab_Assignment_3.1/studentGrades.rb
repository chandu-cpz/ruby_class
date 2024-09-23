class StudentGrades
  def initialize
    @student_records = {}
  end

  def add_student(name, grades)
    @student_records[name] = Student.new(name, grades)
  end

  def calculate_averages
    @student_records.map do |name, student|
      average = student.average_grade
      puts "Student: #{name}, Average Grade: #{average.round(2)}"
    end
  end
end

class Student
  attr_accessor :name, :grades

  def initialize(name, grades)
    @name = name
    @grades = grades
  end

  def average_grade
    @grades.sum.to_f / @grades.size
  end
end

grades_system = StudentGrades.new
grades_system.add_student("Chandrakanth", [85, 92, 78, 94])
grades_system.add_student("Chaitanya", [88, 76, 90, 82])
grades_system.add_student("Jogi", [95, 89, 93, 91])

puts "Average Grades for Each Student:"
grades_system.calculate_averages
