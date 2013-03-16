require 'spec_helper'

feature "Deleting a gig" do

  scenario "Can destroy a gig" do
    user = Factory(:user)
    user.confirm!
    sign_in_as!(user)
    Factory(:gig, :title => "Old Title", :user_id => user.id)
    visit '/'
    click_link "Edit"
    click_link "Delete Gig"
    page.should have_content("Gig deleted!")
  end

end
