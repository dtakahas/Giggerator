class ExpenseItemsController < ApplicationController

  before_filter :find_gig

  def new
    @items = ExpenseItem.find_all_by_gig_id(@gig.id)
    if @items.empty?
      @budget = ExpenseItem.new(:gig_id => @gig.id, :label => "Expense item", :amount => 0)
    else
      @budget = ExpenseItem.new(:gig_id => @gig.id, :label => "Expense item", :amount => 0)
    end

    if @budget.save
      flash[:notice] = "Expense Added"
      redirect_to edit_gig_path(@gig.id, @budget.id, :form => "budgets")
    else
      flash[:notice] = "Budget NOT saved."
      redirect_to gig_path
    end
  end



  private

  def find_gig
    @gig = Gig.find(params[:gig_id])
  end
end
