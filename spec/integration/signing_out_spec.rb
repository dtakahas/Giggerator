require 'spec_helper'

	feature "Signing out" do

		scenario "user can sign out" do
				user = Factory(:user)
				user.confirm!
				sign_in_as!(user)
				click_link "Sign out"
				page.should have_content "Signed out successfully."
		end
	end
