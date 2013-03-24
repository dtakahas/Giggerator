class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :notes, :phone, :user_id
  belongs_to :user
  has_and_belongs_to_many :gig
  validates :first_name, :presence => true

end
