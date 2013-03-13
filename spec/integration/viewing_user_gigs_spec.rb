require 'spec_helper'

feature "Viewing gigs for one user" do

	before do
		Factory(:gig, :title => "This is the right gig", :user_id => 1)
		Factory(:gig, :title => "This is the wrong gig", :user_id => 2)
		Factory(:gig, :title => "This is another right gig", :user_id => 1)

		Factory(:user, :email => "user@example.com", :id => 1)
		Factory(:user, :email => "differentuser@example.com", :id => 2)
	end

	scenario "cannot view other user's gigs" do
		user = User.find_by_email('user@example.com')
		user.confirm!
		sign_in_as!(user)
		page.should have_content "This is the right gig"
		page.should have_content "This is another right gig"
		page.should_not have_content "This is the wrong gig"
	end
end
