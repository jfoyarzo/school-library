module ListBooks
  def list_books
    puts
    @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}" }
  end
end
