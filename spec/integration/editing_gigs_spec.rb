require 'spec_helper'

feature "Updating a gig" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:gig) { Factory(:gig, :title => "Old Title", :user_id => user.id) }
  let!(:contact) { Factory(:contact, :first_name => "Will", :last_name => "Bethere") }

  before do
    sign_in_as!(user)
    visit '/'
  end

  scenario "can update a gig" do
    click_link "Edit"
    fill_in "Title", :with => "Better Title"
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
    page.should have_content("Updated!")
  end

  scenario "gig will have contact associated with it" do
    click_link "Create Gig"
    fill_in "Title", :with => "Crap"
    fill_in "First Name", :with => "Joe"
    click_button "Save Gig"
    page.should have_content("Joe")
    visit '/'
    click_link "Edit"
    find_field("First Name").value.should eql("George")
  end
  #TODO: Write a test for invalid data entry

  scenario "can add multiple contacts to a gig" do
    click_link "Edit"
    click_button "Add player"
    select "Trumpet", :from => "Instrument"
    select "Will Bethere", :from => "Players"
    click_button "Save Gig"
    page.should have_content("Will Bethere")
  end
  # To add a player contact to a gig, the user should be able to click Add player, revealing two selection menus (jQuery slide),
  # one for instrument and one for player names which changes depending on the instrument selected.

end
