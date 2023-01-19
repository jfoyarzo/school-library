require_relative 'spec_helper'

describe 'test trimmer decorator class' do
  before :each do
    @person = Person.new(666, 18, 'johnnyvargas')
    @trimmer_decorator = TrimmerDecorator.new(@person)
  end

  it 'should be a kind of BaseDecorator' do
    expect(@trimmer_decorator).to be_kind_of(BaseDecorator)
  end

  it 'should trim the correct name' do
    expect(@trimmer_decorator.correct_name).to eql('johnnyvarg')
  end
end
