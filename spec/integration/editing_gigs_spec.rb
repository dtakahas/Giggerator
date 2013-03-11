require 'spec_helper'

feature "Updating a gig" do

  scenario "can update a gig" do
    visit '/'
    click_link "Create Gig"
    fill_in "Title", :with => "New Title"
    click_button "Save Gig"
    visit '/'
    click_link "Edit"
    fill_in "Title", :with => "Better Title"
    click_button "Save Gig"
    page.should have_content("Gig saved!")
  end

  #TODO: Write a test for invalid data entry

end
