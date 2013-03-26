require 'spec_helper'

feature "Editing contacts" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:contact) { Factory(:contact, :user => user) }

  scenario "can edit contacts" do
    sign_in_as!(user)
    visit '/'
    click_link "Contacts"
    page.should have_content("George")

    click_link "Edit"
    fill_in "Phone", :with => "555-555-5555"
    click_button "Save Contact"

    page.should have_content("Contact saved!")
    page.should have_content("555-555-5555")

    click_link "Contacts"
    page.should have_content("George")
  end
end
