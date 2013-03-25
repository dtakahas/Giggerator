class BudgetItem < ActiveRecord::Base
  belongs_to :gig
  belongs_to :user
  attr_accessible :amount, :label, :positive, :gig_id
end
