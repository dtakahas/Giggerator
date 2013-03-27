class CreateContactsGigsTable < ActiveRecord::Migration

	create_table :contacts_gigs, :id => false do |t|
		t.integer :contact_id, :gig_id
	end

end
