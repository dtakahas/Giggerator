require 'spec_helper'

feature "Updating a gig" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:gig) { Factory(:gig, :title => "Old Title", :user_id => user.id) }
  before do
    sign_in_as!(user)
  end

  scenario "can update a gig" do
    visit '/'
    click_link "Edit"
    fill_in "Title", :with => "Better Title"
    click_button "Save Gig"
    page.should have_content("Updated!")
  end

  scenario "gig will have contact associated with it" do
    visit '/'
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

end
