require_relative '../student'
require_relative '../teacher'

module WritePeople
  def write_people
    return if @people.empty?

    json = JSON.pretty_generate(@people.map do |person|
      hash = {
        class: person.class.name,
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission
      }

      hash['classroom'] = person.classroom if person.instance_of? Student

      hash['specialization'] = person.specialization if person.instance_of? Teacher
      hash
    end)
    File.write('./json_files/people.json', json)

    puts 'People saved to file successfully!'
  end
end
