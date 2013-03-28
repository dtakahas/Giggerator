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
		@gig = Gig.new(params[:gig])
		@gig.month = params["date"]["month"].to_i
		@gig.day = params["date"]["day"].to_i
		@gig.year = params["date"]["year"].to_i
		logger.info @gig.month

		if params[:contact]
			@contact = Contact.new(params[:contact])
		end

  	if  @contact.save && @gig.save
  			@gig.user_id = current_user.id
  			ContactsGigs.create(:contact_id => @contact.id, :gig_id => @gig.id)
  			flash[:notice] = "Gig saved!"
  			redirect_to @gig
		else
			flash[:alert] = "You must have a gig title and contact name."
      redirect_to new_gig_path(@gig, :form => "properties")
		end
	end

	def show
    @gig = Gig.find(params[:id])
    @contacts = @gig.contacts
 	end

	def edit
		@gig = Gig.find(params[:id])
    @items = @gig.budget_items
    @expenses = @gig.expense_items
    @contact = @gig.contacts.first

    if @items.empty? && params[:form] == "budgets"
      @budget = BudgetItem.new(:gig_id => @gig.id, :label => "Total Budget", :positive => true, :amount => @gig.total_budget)
      @budget.save!
      @expense = ExpenseItem.new(:gig_id => @gig.id, :label => "Expense", :amount => 0)
      @expense.save!
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
		@contact = @gig.contacts.first
    @user_id = current_user.id
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
