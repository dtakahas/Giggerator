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
			@gig.user_id = current_user.id
			flash[:notice] = "Gig saved!"
			redirect_to @gig
		else
			flash[:alert] = "Title can't be blank"
      redirect_to new_gig_path(@gig, :form => "properties")
		end
	end

	def show
    @gig = Gig.find(params[:id])
	end

	def edit
		@gig = Gig.find(params[:id])
    @items = @gig.budget_items
    @expenses = @gig.expense_items
		# @contact = Contact.find_by_gig_id(params[:id])

		# if not @contact
		# 	@contact = Contact.new(params[:contact])
		# end
		# THIS IS A BIG MESS

    if @items.empty? && params[:form] == "budgets"
      @budget = BudgetItem.new(:gig_id => @gig.id, :label => "Total Budget", :positive => true, :amount => @gig.total_budget)
      @budget.save!
      flash[:notice] = "Budget saved!"
      redirect_to edit_gig_path(@gig, :form => "budgets")
    end

    @sum = 0
    @items.each do |x|
      @sum = @sum + x.amount
    end

    @expenses.each do |y|
      @sum = @sum + y.amount
    end
    @sum

	end

	def update
		@gig = Gig.find(params[:id])
		if @gig.update_attributes(params[:gig])
      if params[:gig][:title]
        flash[:notice] = "Updated!"
        redirect_to @gig
      else
        flash[:notice] = "Budget Saved!"
        redirect_to edit_gig_path(@gig, :form => "budgets")
      end
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
