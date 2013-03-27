class ContactsGigs < ActiveRecord::Base
	attr_accessible	:contact_id, :gig_id
	belongs_to :contact
	belongs_to :gig
end
