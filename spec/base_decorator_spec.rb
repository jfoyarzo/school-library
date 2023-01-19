require_relative 'spec_helper'

describe 'test base_decorator class' do
  before :each do
    @person = Person.new(666, 21, 'John Doe', parent_permission: true)
    @decorator = BaseDecorator.new(@person)
  end

  it 'should return a Nameable instance' do
    expect(@decorator).to be_kind_of(Nameable)
  end

  it 'should return a BaseDecorator instance' do
    expect(@decorator).to be_an_instance_of(BaseDecorator)
  end

  it 'should return the correct result of correct_name' do
    expect(@decorator.correct_name).to eql('John Doe')
  end
end