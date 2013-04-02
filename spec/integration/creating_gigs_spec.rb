require 'spec_helper'

feature "Creating gigs" do

	before do
		user = Factory(:user)
    user.confirm!
    sign_in_as!(user)
    click_link "Create Gig"
	end

	scenario "can create gigs" do
		fill_in "Title", :with => "My First Gig"
		fill_in "First Name", :with => "Gigs"
		fill_in "Contact Phone", :with => "555-555-5555"
		fill_in "Contact Email", :with => "gigs@mcgee.com"
		select "March", :from => "date[month]"
		select "10", :from => "date[day]"
		select "2015", :from => "date[year]"
    select "07", :from => "gig[time(4i)]"
    select "30", :from => "gig[time(5i)]"
		fill_in "Venue", :with => "Carnagie Hall"
		fill_in "City", :with => "New York"
		fill_in "Address", :with => "123 Main St"
		fill_in "Zip", :with => 98102
		fill_in "Total Budget", :with => 1000
    fill_in "Notes", :with => "This is a note"
		click_button "Save Gig"
		page.should have_content "Gig saved!"
	end

	scenario "can not create gigs without title" do
		fill_in "Title", :with => ""
		click_button "Save Gig"
		page.should have_content "You must have a gig title and contact name."
  end

  # scenario "can create a gig before signing in and then sign in after" do
  #   click_link "Sign out"
  #   visit '/'
  #   click_link "Create Gig"
  #   fill_in "Title", :with => "My First Gig"
		# fill_in "First Name", :with => "Gigs"
		# fill_in "Contact Phone", :with => "555-555-5555"
		# fill_in "Contact Email", :with => "gigs@mcgee.com"
		# click_button "Save Gig"
		# page.should have_content "Please sign in to save this gig"
		# fill_in "Email", :with => user.email
		# fill_in "Password", :with => user.password
		# click_button "Sign in"
		# page.should have_content "My First Gig"
		# page.should have_content "Signed in as"
  # end
end

