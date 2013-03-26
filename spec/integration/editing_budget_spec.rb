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

  scenario "can view a budget with total budget autofilled" do
    page.should have_content(5000.00)
  end

	#checking for jquery auto updating totals
  scenario "can add positive line item" do
  	click_link "Add another budget item"
  	fill_in "Income", :with => "tips"
  	fill_in "Amount", :with => 30
    click_button "Save Budget"
		find('#budget-total').should have_content(30.00)
  end

  scenario "can add negative line item" do
  	click_link "Add another expense item"
  	fill_in "Expense", :with => "hamburgers"
  	fill_in "Amount", :with => 29
    click_button "Save Budget"
  	find('#budget-total').should have_content(29.00) #positive because it can't see jQuery effect
  end
end
