require_relative 'person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', _parent_permission: true)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
