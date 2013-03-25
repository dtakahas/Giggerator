require 'spec_helper'

feature "Editing budget" do

	before do
		user = Factory(:confirmed_user)
		gig = Factory(:gig, :total_budget => 5000, :user => user)
    sign_in_as!(user)
    visit '/'
    click_link  "Jazz Bash at the Casbah"
    click_link "Budget Breakdown"
	end

	#checking for jquery auto updating totals
  scenario "can add positive line item" do
  	click_link "Add another budget item"
  	fill_in "Item", :with => "tips"
  	fill_in "Amount", :with => 30
		find_field('Total Income').value.should eql(gig.total_budget + 30)
  end

  scenario "can add negative line item" do
  	click_link "Add another budget item"
  	fill_in "Item", :with => "hamburgers"
  	fill_in "Amount", :with => 29
  	find_field('Total Outgo').value.should eql(gig.total_budget + 30 - 29)
  end
end
