require 'spec_helper'

feature "Clear budget" do

	before do
		user = Factory(:confirmed_user)
		sign_in_as!(user)
		gig = Factory(:gig, :total_budget => 5000)
	end

	scenario "can clear budget for a gig" do
		click_button "Clear form"
		find_field('Income').value.should eql(0)
	end

end
