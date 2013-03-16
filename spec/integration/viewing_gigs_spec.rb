require 'spec_helper'

feature "Viewing a gig" do


  scenario "Can view a gig" do
    gig = Factory.create(:gig, :title => "New Title")

    visit gig_path(gig)
    page.should have_content "New Title"
  end

  scenario "Can view all gigs" do
    user = Factory(:user)
    user.confirm!
    sign_in_as!(user)
    Factory.create(:gig, :title => "New Title", :user_id => user.id)
    Factory.create(:gig, :title => "Newer Title 2", :user_id => user.id)

    visit '/'
    page.should have_content("New Title")
    page.should have_content("Newer Title 2")
  end

end
