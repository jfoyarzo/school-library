require 'json'
require './student'

module ReadPeople
  def read_people
    return [] unless File.exist?('./json_files/people.json') && !File.empty?('./json_files/people.json')

    json = File.read('./json_files/people.json')
    parsed = JSON.parse(json)
    array = []
    parsed.each do |person|
      if person['class'] == 'Student'
        person_new = Student.new(
          person['id'],
          person['classroom'],
          person['age'],
          person['name'],
          parent_permission: person['parent_permission']
        )
      end
      if person['class'] == 'Teacher'
        person_new = Teacher.new(person['id'], person['specialization'], person['age'], person['name'],
                                 parent_permission: person['parent_permission'])
      end
      array << person_new
    end
    array
  end
end
