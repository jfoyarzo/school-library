require_relative 'modules/create_people'
require_relative 'modules/create_book'
require_relative 'modules/create_rental'
require_relative 'modules/list_books'
require_relative 'modules/list_people'
require_relative 'modules/list_rentals'
require_relative 'data/write_data'

class App
  include CreatePeople
  include CreateBook
  include CreateRental
  include ListBooks
  include ListPeople
  include ListRentals
  include WriteData

  def initialize()
    @people = []
    @books = []
    @classrooms = []
  end

  def select_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      select_role
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      puts 'Enter the ID of the person:'
      id = gets.chomp.to_i
      list_rentals_for_id(id)
    else
      write_data
      puts 'Thank you for using this app, see you soon!'
      exit
    end
  end
end
