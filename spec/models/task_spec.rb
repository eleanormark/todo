require 'spec_helper'

describe Task do
  it { should validate_presence_of :name}
  it { should belong_to :list}

  it "starts as not done" do
    task = FactoryGirl.create(:task)
    task.done.should eq false
  end

  it "shows all the incomplete tasks" do
    task1 = FactoryGirl.create(:task)
    task2 = FactoryGirl.create(:task)
    Task.incomplete.should eq [task1, task2]
  end
  
  it "shows all the complete tasks" do
    task1 = FactoryGirl.create(:task, done: true)
    task2 = FactoryGirl.create(:task)
    Task.complete.should eq [task1]
  end

end