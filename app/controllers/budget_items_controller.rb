class BudgetItemsController < ApplicationController

  before_filter :find_gig

  def new
    @items = BudgetItem.find_all_by_gig_id(@gig.id)
    if @items.empty?
      @budget = BudgetItem.new(:gig_id => @gig.id, :label => "Total Budget", :positive => true, :amount => @gig.total_budget)
    else
      @budget = BudgetItem.new(:gig_id => @gig.id, :label => "New Item", :positive => true, :amount => 0)
    end

    if @budget.save
      flash[:notice] = "Budget updated!"
      redirect_to edit_gig_path(@gig.id, @budget.id, :form => "budgets")
    else
      flash[:notice] = "Budget NOT saved."
      redirect_to gig_path
    end
  end

  def create
    if @budget.save
      flash[:notice] = "Budget updated!"
      redirect_to edit_gig_budget_item_path(@gig.id, @budget.id)
    else
      flash[:notice] = "Budget NOT saved."
      redirect_to gig_path
    end
  end

  def edit
    @items = BudgetItem.find_all_by_gig_id(@gig.id)
    redirect_to new_gig_budget_item_path if @items.empty?
  end

  def update
    @items = BudgetItem.find_all_by_gig_id(@gig.id)
    @items.each {|i| i.save! }
  end

  def show
    flash[:notice] = "Budget saved!"
    redirect_to edit_gig_budget_item_path(@gig.id)
  end

  def destroy
    @item = BudgetItem.find(params[:id])
    @item.destroy
    flash[:notice] = "Item deleted."
    redirect_to edit_gig_path(@gig.id, :form => "budgets")
  end

private

  def find_gig
    @gig = Gig.find(params[:gig_id])
  end

end
