class ContactsController < ApplicationController

	def index
		if current_user
		  @contacts = Contact.where(:user_id => current_user.id)
    else
    	flash.keep
      redirect_to new_user_session_path
    end
	end

	def new
		@contact = Contact.new
		@user_id = current_user.id
	end

	def create
		@contact = Contact.new(params[:contact])

		if @contact.save
			flash[:notice] = "Contact saved! (Praise Jesus!)"
			redirect_to @contact
		else
			flash[:alert] = "Contact not saved (Hail Satan!)"
			render :action => "new"
		end
	end

	def show
	end

end
