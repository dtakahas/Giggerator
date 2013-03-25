require 'spec_helper'

feature "Deleting contacts" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:contact) { Factory(:contact, :user => user) }

  scenario "can delete a contact with confirmation" do
    sign_in_as!(user)
    visit '/'
    click_link "Contacts"
    click_link "Delete"
    page.should have_content("Contact deleted!")
  end
end
