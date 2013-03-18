require 'spec_helper'

feature "Creating budget" do

	before do
		user = Factory(:confirmed_user)
		sign_in_as!(user)
		gig = Factory(:gig, :budget => 5000)
	end

	scenario "can create (save) budget" do
		click_button("Save Budget")
		page.should have_content "Budget saved!"
	end
end
