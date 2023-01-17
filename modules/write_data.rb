require 'json'

module WriteData
  def write_data(books, people)
    json = JSON.generate(books)
    json2 = JSON.generate(people)
    File.write('./json_files/books.json', json)
    File.write('./json_files/people.json', json2)
    puts 'Files written successfully'
  end
end
