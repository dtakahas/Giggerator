require 'spec_helper'

feature "Viewing gigs for one user" do

    let!(:user_1) { Factory(:confirmed_user) }
    let!(:user_2) { Factory(:user) }
    let!(:right_gig)   { Factory(:gig, :title => "This is the right gig", :user => user_1) }
    let!(:wrong_gig)   { Factory(:gig, :title => "This is the wrong gig", :user => user_2) }
    let!(:another_right_gig)   { Factory(:gig, :title => "This is another right gig", :user => user_1) }

  before do
    sign_in_as!(user_1)
 end

  scenario "cannot view other user's gigs" do
    page.should have_content right_gig.title
    page.should_not have_content wrong_gig.title
    page.should have_content another_right_gig.title
  end
end
