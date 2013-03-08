class GigsController < ApplicationController

	def index
	end
	def new
		@gig = Gig.new
	end

end
