require 'spec_helper'

feature "Updating a gig" do

  scenario "can update a gig" do
    user = Factory(:user)
    user.confirm!
    sign_in_as!(user)
    Factory(:gig, :title => "Old Title", :user_id => user.id)
    visit '/'
    click_link "Edit"
    fill_in "Title", :with => "Better Title"
    click_button "Save Gig"
    page.should have_content("Gig saved!")
  end

  #TODO: Write a test for invalid data entry

end
