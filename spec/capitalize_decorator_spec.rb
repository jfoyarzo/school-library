require_relative 'spec_helper'

describe 'test capitalize decorator class' do
  before :each do
    @person = Person.new(666, 18, 'john')
    @capitalize_decorator = CapitalizeDecorator.new(@person)
  end

  it 'should be a kind of BaseDecorator' do
    expect(@capitalize_decorator).to be_kind_of(BaseDecorator)
  end

  it 'should capitalize the correct name' do
    expect(@capitalize_decorator.correct_name).to eql('John')
  end
end
