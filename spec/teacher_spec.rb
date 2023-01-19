require_relative 'spec_helper'

describe 'test teacher class' do
  before :each do
    @teacher = Teacher.new(666, 'Time-Space', 981, 'The Doctor', parent_permission: true)
  end

  it 'should return a teacher instance with four parameters' do
    expect(@teacher).to be_an_instance_of(Teacher)
  end

  it 'should return the correct result of can_use_services?' do
    expect(@teacher.can_use_services?).to eql(true)
  end
end
