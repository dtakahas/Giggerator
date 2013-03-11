class GigsController < ApplicationController

	def index
	end

	def new
		@gig = Gig.new
	end

	def create
		@gig = Gig.new(params[:gig])
		@gig.month = params["date"]["month"].to_i
		@gig.day = params["date"]["day"].to_i
		@gig.year = params["date"]["year"].to_i

		if @gig.save
			flash[:notice] = "Gig saved!"
			redirect_to @gig
		else
			flash[:alert] = "Gig NOT saved."
			render :action => "new"
		end
	end

	def show
    @gig = Gig.find(params[:id])
	end


end
