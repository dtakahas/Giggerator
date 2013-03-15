require 'spec_helper'

describe GigsController do

	context "signed in user" do

		it "should associate gigs with users" do
			user = Factory(:user)
			user.confirm!
			sign_in(:user, user)
			post :create, :gig => {"title"=>"We think this will work",
				 "user_id"=>user.id}, "date"=>{"month"=>"3", "day"=>"15", "year"=>"2013"}
			gig = Gig.find(user.id)
			gig.user_id.should == user.id
		end

	end

end
