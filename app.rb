require_relative 'modules/people_creation'

class App
  include CreatePeople

  def initialize()
    @people = []
    @books = []
    @classrooms = []
  end

  def list_books
    puts
    @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}" }
  end

  def list_people
    puts
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book added successfully'
  end

  def create_rental
    puts 'Select person by option number:'
    @people.each_with_index do |person, index|
      puts "#{index + 1} - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    opt_person = gets.chomp.to_i - 1
    person = @people.at(opt_person)
    puts 'Select book by option number:'
    @books.each_with_index { |book, index| puts "#{index + 1} - Author: #{book.author}, Title: #{book.title}" }
    opt_book = gets.chomp.to_i - 1
    book = @books.at(opt_book)
    puts 'Enter date of rental: '
    date = gets.chomp
    person.add_rental(date, book)
    puts 'Rental created successfully'
  end

  def list_rentals_for_id(id)
    person = @people.find { |p| p.id == id }
    if person.rentals
      puts "-- Rentals for user #{person.name} (ID: #{person.id}) --"
      person.rentals.each_with_index do |element, index|
        puts "#{index + 1} - Date: #{element.date}, Book: #{element.book.title}"
      end
    else
      puts 'This user has no rentals'
    end
  end
end
