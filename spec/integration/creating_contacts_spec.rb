require 'spec_helper'

feature "Creating contacts" do
  let!(:user) {Factory(:confirmed_user)}
  let!(:gig) {Factory(:gig, :user => user, :contact_name => "George Costanza")}

  scenario "can not create contact without signing in" do
    visit '/'
    click_link "Create Gig"
    page.should_not have_content("New Contact")
  end

  scenario "can create contact from index" do
    sign_in_as!(user)
    visit '/'
    click_link "New Contact"
    fill_in "First Name", :with => "Poop"
    fill_in "Last Name", :with => "Ferguson"
    click_button "Save Contact"
    page.should have_content("Contact saved!")
  end

  scenario "can create contact from gig show" do
    sign_in_as!(user)
    click_link "Jazz Bash at the Casbah"
    click_link "Create New Contact"
    find_field('First Name').value.should eql('George')
    find_field('Last Name').value.should eql('Costanza')

    click_button "Save Contact"
    page.should have_content("Contact saved!")
  end

  scenario "cannot create a contact without a name" do
    sign_in_as!(user)
    visit '/'
    click_link "New Contact"
    click_button "Save Contact"
    page.should have_content("Please enter a name!")
  end

end
