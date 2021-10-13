require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name = name, age = age, parent_permission = parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end

  def add_classroom=(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
end
