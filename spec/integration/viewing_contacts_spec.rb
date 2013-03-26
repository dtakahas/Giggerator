require 'spec_helper'

feature "Viewing contacts" do
  let!(:user_1) { Factory(:confirmed_user) }
  let!(:user_2) { Factory(:confirmed_user) }

  let!(:contact) { Factory(:contact, :user => user_1) }

  scenario "can view all contacts for a user in contacts view" do
    sign_in_as!(user_1)
    visit '/'
    click_link "Contacts"
    page.should have_content("George")
    click_link "Sign out"
  end

  scenario "cannot view other user's contacts" do
    sign_in_as!(user_2)
    visit '/'
    click_link "Contacts"
    page.should_not have_content("George")
  end

end
