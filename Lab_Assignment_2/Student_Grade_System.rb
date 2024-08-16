
class Student
  attr_accessor :name, :grades

  def initialize(name)
    @name = name
    @grades = []
  end

  def add_grade(grade)
    @grades << grade
  end

  def average
    return 0 if @grades.empty?
    @grades.sum / @grades.size.to_f
  end

  def letter_grade
    case average
    when 90..100 then 'A'
    when 80..89 then 'B'
    when 70..79 then 'C'
    when 60..69 then 'D'
    else 'F'
    end
  end

  def to_s
    "Name: #{@name}, Grades: #{@grades}, Average: #{average}, Letter Grade: #{letter_grade}"
  end
end

class Gradebook
  def initialize
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def find_student(id)
    @students.find { |student| student.id == id }
  end

  def display_students
    @students.each { |student| puts student }
  end
end

gradebook = Gradebook.new

student1 = Student.new("Chandrakanth")
student1.add_grade(90)
student1.add_grade(85)
student1.add_grade(95)

student2 = Student.new("Chaitanya")
student2.add_grade(78)
student2.add_grade(82)
student2.add_grade(88)

gradebook.add_student(student1)
gradebook.add_student(student2)

gradebook.display_students

