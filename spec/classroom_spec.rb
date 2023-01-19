require_relative 'spec_helper'

describe 'test classroom class' do
  before(:each) do
    @classroom = Classroom.new('111')
  end

  it 'should return a classroom instance with one parameter' do
    expect(@classroom).to be_an_instance_of(Classroom)
  end

  it 'should return the correct label' do
    expect(@classroom.label).to eql '111'
  end
end
