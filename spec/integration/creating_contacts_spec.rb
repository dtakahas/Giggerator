require 'spec_helper'

feature "Creating contacts" do
  let!(:user) {Factory(:confirmed_user)}
  let!(:gig) {Factory(:gig, :user => user)}


  scenario "can not create contact without signing in" do
    visit '/'
    page.should_not have_content("Contacts")
  end

  scenario "can create contact from contact form" do
    sign_in_as!(user)
    visit '/'
    click_link "Contacts"
    click_link "New Contact"
    fill_in "First Name", :with => "Poop"
    fill_in "Last Name", :with => "Ferguson"
    click_button "Save Contact"
    page.should have_content("Contact saved!")
    click_link "Contacts"
    page.should have_content "Poop"
  end

  scenario "can create contact when creating gig from form" do
    sign_in_as!(user)
    visit '/'
    click_link "Create Gig"
    fill_in "Title", :with => "Jazz on your mom"
    fill_in "First Name", :with => "Pope John Paul"
    fill_in "Last Name", :with => "the 3rd"
    fill_in "Contact Phone", :with => "666-666-6666"
    fill_in "Contact Email", :with => "poopy@thevatican.com"
    click_button "Save Gig"
    page.should have_content("Gig saved!")
    click_link "Contacts"
    page.should have_content "Pope John Paul"
  end

  scenario "cannot create a contact without a name" do
    sign_in_as!(user)
    visit '/'
    click_link "Contacts"
    click_link "New Contact"
    click_button "Save Contact"
    page.should have_content("First name can't be blank")
  end

end
