class Gig < ActiveRecord::Base
  attr_accessible :address, :city, :day, :month, :title, :total_budget, :venue, :year,
                  :zip, :user_id, :add_to_contacts
  attr_accessor :add_to_contacts
  validates :title, :presence => true
  belongs_to :user
  has_and_belongs_to_many :contact

  def add_to_contacts
  end

end
