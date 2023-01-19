require_relative 'spec_helper'

describe 'test student class' do
  before :each do
    @student = Student.new(1, 'Q666', 16, 'Jack', parent_permission: true)
  end

  it 'should return a student instance with four parameters' do
    expect(@student).to be_an_instance_of(Student)
  end

  it 'should return the correct result of play_hooky' do
    expect(@student.play_hooky).to eql('¯\(ツ)/¯')
  end
end
