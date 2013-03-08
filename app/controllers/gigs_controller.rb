class GigsController < ApplicationController

	def index
	end

	def new
		@gig = Gig.new
	end

	def create
		@gig = Gig.new(params[:gig])

		if @gig.save
			flash[:notice] = "Gig saved!"
			redirect_to @gig
		else
			flash[:alert] = "Gig NOT saved."
			render :action => "new"
		end
	end

	def show

	end

end
