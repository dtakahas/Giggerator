require 'spec_helper'

feature "Editing budget" do

	before do
		user = Factory(:confirmed_user)
		sign_in_as!(user)
		gig = Factory(:gig, :budget => 5000)
	end

	#checking for jquery auto updating totals
  scenario "can add positve line item" do
  	click_link "Add line item"
  	fill_in "Item", :with => "tips"
  	fill_in "Amount", :with => 30
		find_field('Total Income').value.should eql(gig.total_budget + 30)
  end

  scenario "can add negative line item" do
  	click_link "Add line item"
  	fill_in "Item", :with => "hamburgers"
  	fill_in "Amount", :with => 29
  	find_field('Total Outgo').value.should eql(gig.total_budget + 30 - 29)
  end
end
