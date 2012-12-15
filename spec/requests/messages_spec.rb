require 'spec_helper'

describe "Messages" do
  it "displays existing message records",:js => true do
    FactoryGirl.create(:entry)
    visit root_path
    page.should have_content("Hello world!")
  end

  it "removes message when delete is clicked", :js => true do
    FactoryGirl.create(:entry)
    visit root_path
    click_on "Delete"
    page.should_not have_content("Hello world!")
  end

  it "switches views on edit", :js => true do
    FactoryGirl.create(:entry)
    visit root_path
    click_on "Edit"
    page.should have_selector("input#update")
  end

  it "updates message", :js => true do
    FactoryGirl.create(:entry)
    visit root_path
    click_on "Edit"
    page.should have_selector("input#edit_entry_message")
    fill_in "message_edit", :with => "Goodbye world!"
    click_on "Save"
    page.should have_content("Goodbye world!")
    page.should_not have_content("Hello world!")
  end
end
