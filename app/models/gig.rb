class Gig < ActiveRecord::Base
  attr_accessible :address, :city, :day, :month, :title, :total_budget, :venue, :year,
                  :zip, :user_id, :budget_items_attributes, :expense_items_attributes

  validates :title, :presence => true
  belongs_to :user

  has_many :budget_items
  accepts_nested_attributes_for :budget_items, :allow_destroy => true

  has_many :expense_items
  accepts_nested_attributes_for :expense_items, :allow_destroy => true

  before_save :set_total_budget

  has_and_belongs_to_many :contacts

  private

  def set_total_budget
    if not self.total_budget
      self.total_budget = 0
    end
  end
end
