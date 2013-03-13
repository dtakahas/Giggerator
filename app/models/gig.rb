class Gig < ActiveRecord::Base
  attr_accessible :address, :city, :day, :month, :title, :total_budget, :venue, :year,
                  :zip, :contact_name, :contact_phone, :contact_email, :user_id

  validates :title, :presence => true

end
