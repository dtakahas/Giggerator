require 'spec_helper'

feature "Viewing a gig" do

  # before do
  #   gig = Factory(:gig, :title => "New Title")
  # end

  scenario "Can view a gig" do
    gig = Factory.create(:gig, :title => "New Title")
    visit gig_path(gig)
    # click_link "Create Gig"
    # fill_in "Title", :with => "New Title"
    # click_button "Save Gig"
    page.should have_content "New Title"
  end

  scenario "Can view all gigs" do
    Factory.create(:gig, :title => "New Title")
    Factory.create(:gig, :title => "Newer Title 2")
    # visit '/'
    # click_link "Create Gig"
    # fill_in "Title", :with => "New Title"
    # click_button "Save Gig"
    # visit '/'
    # click_link "Create Gig"
    # fill_in "Title", :with => "Newer Title 2"
    # click_button "Save Gig"
    visit '/'
    page.should have_content("New Title")
    page.should have_content("Newer Title 2")
  end

end
