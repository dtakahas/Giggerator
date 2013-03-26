require 'spec_helper'

feature "Viewing budget" do
	let!(:user) { Factory(:confirmed_user)}
	let!(:gig) { Factory(:gig, :total_budget => 5000, :user => user) }

	before do
		sign_in_as!(user)
	end

	scenario "user can view budget for a gig" do
		visit '/'
		click_link  "Jazz Bash at the Casbah"
		click_link "Budget Breakdown"
		page.should have_content(gig.title)
		find_field('Amount').value.should eql("5000.00")  #(number_with_precision(gig.total_budget, :precision => 2).to_s)
	end
end
