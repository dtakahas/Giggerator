class Gig < ActiveRecord::Base
  attr_accessible :address, :city, :day, :month, :title, :total_budget, :venue, :year, :zip
end
