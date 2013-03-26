class ExpenseItem < ActiveRecord::Base
  belongs_to :gig
  belongs_to :user
  attr_accessible :amount, :label, :gig_id

  before_save :change_amount_to_negative


  private

  def change_amount_to_negative
    self.amount = -self.amount.abs
  end
end
