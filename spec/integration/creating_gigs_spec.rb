require 'spec_helper'

feature "Creating gigs" do

	before do
		visit "/"
		click_link "Create Gig"
	end

	scenario "can create gigs" do
		fill_in "Title", :with => "My First Gig"
		fill_in "Contact Name", :with => "Gigs McGee"
		fill_in "Contact Phone", :with => "555-555-5555"
		fill_in "Contact Email", :with => "gigs@mcgee.com"
		select "March", :from => "date[month]"
		select "10", :from => "date[day]"
		select "2015", :from => "date[year]"
		fill_in "Venue", :with => "Carnagie Hall"
		fill_in "City", :with => "New York"
		fill_in "Address", :with => "123 Main St"
		fill_in "Zip", :with => 98102
		fill_in "Total Budget", :with => 1000
		click_button "Save Gig"
		page.should have_content "Gig saved!"
	end

	scenario "can not create gigs without title" do
		fill_in "Title", :with => ""
		click_button "Save Gig"
		page.should have_content "Title can't be blank"
  end
end

