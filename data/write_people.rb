module WritePeople
  def write_people
    return if @people.empty?

    json = JSON.pretty_generate(@people.map do |person|
      {
        class: person.class.name,
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission,
      }
    end)
    File.write('./json_files/people.json', json)

    puts 'People saved to file successfully!'
  end
end
