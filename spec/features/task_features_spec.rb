require 'spec_helper'

feature "Adding a task" do   
  scenario "A user successfully adds a task", js: true do
    visit lists_path
    fill_in "list_name", :with => "Pet Duty"
    click_button "Create List"
    click_link "Pet"
    fill_in "task_name", :with => "walk the dog"
    click_button "Create Task"
    page.should have_content "walk the dog"
  end
end 

