require 'spec_helper'

feature "Creating a list" do
  scenario "A user successfully make a new list" do
    visit lists_path
    fill_in "list_name", :with => "My New List"
    click_button "Create List"
    page.should have_content "My New List"
  end
end