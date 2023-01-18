require 'json'
require './student'

module ReadData
  def read_people
    return [] unless File.exist?('./json_files/people.json') && !File.empty?('./json_files/people.json')
    json = File.read('./json_files/people.json')
    parsed = JSON.parse(json)
    array = []
    parsed.each do |person|
      if person['class'] == 'Student'
        person_new = Student.new(person['id'], person['name'], person['age'], parent_permission: person['parent_permission'])
      end
      if person['class'] == 'Teacher'
        person_new = Teacher.new(person['id'], person['name'], person['age'], parent_permission: person['parent_permission'])
      end
      array << person_new
    end
    array
  end

  def read_books
    return [] unless File.exist?('./json_files/books.json') && !File.empty?('./json_files/books.json')
    json = File.read('./json_files/books.json')
    parsed = JSON.parse(json)
    array = []
    parsed.each do |book|
      book_new = Book.new(book['title'], book['author'])
      array << book_new
    end
    array
  end

  def read_rentals
    return [] unless File.exist?('./json_files/rentals.json') && !File.empty?('./json_files/rentals.json')

    json = File.read('./json_files/rentals.json')
    JSON.parse(json)
  end
end