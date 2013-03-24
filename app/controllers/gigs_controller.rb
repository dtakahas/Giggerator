class GigsController < ApplicationController

	def index
    if current_user
		  @gigs = Gig.where(:user_id => current_user.id)
    else
    	flash.keep
      redirect_to new_user_session_path
    end
	end

	def new
		@gig = Gig.new
		@contact = Contact.new
    if current_user
		 @user_id = current_user.id
    end
	end

	def create
		@contact = Contact.new(params[:contact])
		@gig = Gig.new(params[:gig])
		@gig.month = params["date"]["month"].to_i
		@gig.day = params["date"]["day"].to_i
		@gig.year = params["date"]["year"].to_i
		logger.info @gig.month

		if @gig.save && @contact.save
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

	def edit
		@gig = Gig.find(params[:id])
	end

	def update
		@gig = Gig.find(params[:id])
		if @gig.update_attributes(params[:gig])
      flash[:notice] = "Gig saved!"
      redirect_to @gig
    else
      flash[:alert] = "Gig NOT saved."
      render :action =>"edit"
    end
	end

	def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    flash[:notice] = "Gig deleted!"
    redirect_to '/'
	end

	def add_to_contacts
		Contact.create(:first_name => params[:contact_name])
	end


end
