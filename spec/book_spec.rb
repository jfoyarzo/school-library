require 'spec_helper'

describe '#new' do
  book = Book.new('Title', 'Author')
  it 'returns a book object with two parameters' do
    expect(book).to be_an_instance_of(Book)
  end
end