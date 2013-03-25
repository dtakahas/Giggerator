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
		@contact = Contact.new(:user_id => current_user.id)
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.user_id = current_user.id

		if @contact.save
			flash[:notice] = "Contact saved! (Praise Jesus!)"
			redirect_to contacts_path
		else
			flash[:alert] = "Contact not saved (Hail Satan!)"
			render :action => "new"
		end
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def destroy
		@contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Contact deleted!"
    redirect_to contacts_path
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		if @contact.update_attributes(params[:contact])
      flash[:notice] = "Contact saved!"
      redirect_to @contact
    else
      flash[:alert] = "Contact NOT saved."
      render :action =>"edit"
    end
	end
end
