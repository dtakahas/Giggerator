require 'spec_helper'

feature "Creating gigs" do
	scenario "can create gigs" do
		visit "/"
		click_link "Create Gig"
		fill_in "Title", :with => "My First Gig"
		fill_in "Month", :with => 01
		fill_in "Day", :with => 02
		fill_in "Year", :with => 2013
		fill_in "Venue", :with => "Carnagie Hall"
		fill_in "City", :with => "New York"
		fill_in "Address", :with => "123 Main St"
		fill_in "Zip", :with => 98102
		fill_in "Total Budget", :with => 1000
		click_button "Save Gig"
		page.should have_content "Gig saved!"
	end
end

