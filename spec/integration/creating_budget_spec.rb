require 'spec_helper'

feature "Creating budget" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:gig) { Factory(:gig, :total_budget => 5000, :user => user) }

  before do
		sign_in_as!(user)
<<<<<<< HEAD
=======
		gig = Factory(:gig, :budget => 5000, :user => user)
>>>>>>> 3ca29b499d1352f3361c58fc6c53fddeb6722e66
	end

	scenario "can create (save) budget" do
    visit '/'
    click_link  "Jazz Bash at the Casbah"
    click_link "Budget Breakdown"
    find_field("Amount").value.should eql("5000.00") #(number_with_precision(gig.total_budget, :precision => 2).to_s)
		click_button("Save Budget")
		page.should have_content "Budget Saved!"
	end

  scenario "can add new income item" do
    visit '/'
    click_link  "Jazz Bash at the Casbah"
    click_link "Budget Breakdown"
    click_link "Add another budget item"
    find_field("Income").value.should eql("Total Budget")
  end

  scenario "can add a new expense item" do
    visit '/'
    click_link "Jazz Bash at the Casbah"
    click_link "Budget Breakdown"
    click_link "Add another expense item"
    page.should have_content("Expense")
  end
end
