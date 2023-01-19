require 'spec_helper'

describe Book do
  before(:each) do
    @book = Book.new('Test title', 'Test author')
  end
  describe '#new' do
    it 'returns a book instance with two parameters' do
      expect(@book).to be_an_instance_of(Book)
    end
  end
  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql 'Test title'
    end
  end
  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql 'Test author'
    end
  end
end
