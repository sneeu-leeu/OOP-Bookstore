require './person.rb'

class Teacher < Person
  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization
  end

  def can_use_services?
    true
  end
end