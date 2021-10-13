require './person'


class Student < Person
  attr_accessor :name

  def initialize(name = 'Unknown', age, classroom, parent_permission: true)
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
