require 'spec_helper'

feature "Deleting a gig" do

  scenario "Can destroy a gig" do
    Factory(:gig)
    visit '/'
    click_link "Edit"
    click_link "Delete Gig"
    page.should have_content("Gig deleted!")
  end

end
