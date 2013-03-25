class Gig < ActiveRecord::Base
  attr_accessible :address, :city, :day, :month, :title, :total_budget, :venue, :year,
                  :zip, :contact_name, :contact_phone, :contact_email, :user_id, :budget_items_attributes

  validates :title, :presence => true
  belongs_to :user

  has_many :budget_items
  accepts_nested_attributes_for :budget_items, :allow_destroy => true
end
