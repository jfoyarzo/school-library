module ListRentals
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
