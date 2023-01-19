require 'json'

module ReadRentals
  def read_rentals
    return [] unless File.exist?('./json_files/rentals.json') && !File.empty?('./json_files/rentals.json')

    json = File.read('./json_files/rentals.json')
    rental_list = JSON.parse(json)
    rental_list.each do |rental|
      person = @people.find { |per| per.id == rental['id'] }
      rental['rentals'].each do |rent|
        book = @books.find { |element| element.title == rent['title'] }
        Rental.new(rent['date'], book, person)
      end
    end
    rental_list
  end
end
