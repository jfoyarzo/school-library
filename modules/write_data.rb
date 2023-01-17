require 'json'

module WriteData
  def write_data(books, people)
    json1 = JSON.pretty_generate(books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end)
    File.write('./json_files/books.json', json1)

    json2 = JSON.pretty_generate(people.map do |person|
      hash = {
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission,
        classroom: (person.classroom || nil),
        specialization: (person.specialization || nil)
      }
      hash.compact!
    end)
    File.write('./json_files/people.json', json2)

    puts 'Files written successfully'
  end
end
