require 'spec_helper'

feature "Deleting a gig" do

  scenario "Can destroy a gig" do
    visit '/'
    click_link "Create Gig"
    fill_in "Title", :with => "Sam"
    click_button "Save Gig"
    visit '/'
    click_link "Edit"
    click_link "Delete Gig"
    page.should have_content("Gig deleted!")
  end

end
