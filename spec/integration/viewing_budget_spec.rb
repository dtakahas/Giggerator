require 'spec_helper'

feature "Viewing budget" do

	before do
		user = Factory(:confirmed_user)
		sign_in_as!(user)
		gig = Factory(:gig, :budget => 5000)
	end

	scenario "user can view budget for a gig" do
		click_link "Budget Breakdown"
		page.should have_content gig.title
		find_field('Income').value.should eql(gig.total_budget)
	end
end
