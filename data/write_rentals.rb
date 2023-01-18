module WriteRentals
  def write_rentals
    return if @rentals.empty?
    
    json = JSON.pretty_generate(@rentals.map do |rental|
      {
        id: rental.id,
        book: rental.book,
        person: rental.person,
        date: rental.date
      }
    end) 
    File.write('./json_files/rentals.json', json)

    puts 'Rentals saved to file successfully!'
  end
end
