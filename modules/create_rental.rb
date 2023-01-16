module CreateRental
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
end
