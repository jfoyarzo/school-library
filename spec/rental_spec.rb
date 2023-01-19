require_relative 'spec_helper'

describe 'test rental class' do
  before :each do
    person = double('person')
    allow(person).to receive(:rentals) { [] }
    @rental = Rental.new('2023-01-19', 'The Little Prince', person)
  end

  it 'should return a rental instance with three parameters' do
    expect(@rental).to be_an_instance_of(Rental)
  end

  it 'should return the correct date' do
    expect(@rental.date).to eql('2023-01-19')
  end

  it 'should return the correct book' do
    expect(@rental.book).to eql('The Little Prince')
  end
end
