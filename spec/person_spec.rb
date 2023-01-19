require_relative 'spec_helper'

describe Person do
  before(:each) do
    @person = Person.new(123, 15, 'Test name', parent_permission: true)
  end
  describe '#new' do
    it 'returns a person instance' do
      expect(@person).to be_an_instance_of(Person)
    end
  end
  describe '#id' do
    it 'returns the correct id' do
      expect(@person.id).to eql(123)
    end
  end
  describe '#age' do
    it 'returns the correct age' do
      expect(@person.age).to eql(15)
    end
  end
  describe '#name' do
    it 'returns the correct name' do
      expect(@person.name).to eql 'Test name'
    end
  end
  describe '#can_use_services?' do
    it 'returns true if parent_permission is true' do
      expect(@person.can_use_services?).to eql true
    end
  end
  describe '#correct_name' do
    it 'returns the correct name' do
      expect(@person.correct_name).to eql 'Test name'
    end
  end
  describe '#add_rental' do
    it 'creates a new rental for the person instance' do
      rental = double('rental')
      allow(rental).to receive(:date) { '2022/10/10' }
      allow(rental).to receive(:book) { { title: 'Title', author: 'Author' } }
      allow(rental).to receive(:person) { @person }
      @person.add_rental(:date, :book)
      expect(@person.rentals.length).to eql(1)
    end
  end
  describe '#of_age?' do
    it 'returns false for persons with age under 18' do
      expect(@person.send(:of_age?)).to eql false
    end
  end
end
