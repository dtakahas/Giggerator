require 'spec_helper'

feature "Deleting budgets" do

	before do
		user = Factory(:confirmed_user)
    gig = Factory(:gig, :total_budget => 5000, :user => user)
		sign_in_as!(user)
	end

	scenario "can delete a budget item" do
    visit '/'
    click_link  "Jazz Bash at the Casbah"
    click_link "Budget Breakdown"
    click_link "Add another budget item"
		check "Delete"
		page.should have_content("Budget updated!")
	end

end
