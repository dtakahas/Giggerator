class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :notes, :phone, :user_id
  belongs_to :user
  has_many :gigs
  validates :first_name, :presence => true

end
