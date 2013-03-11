class AddContactsToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :contact_name, :string
    add_column :gigs, :contact_phone, :string
    add_column :gigs, :contact_email, :string
  end
end
