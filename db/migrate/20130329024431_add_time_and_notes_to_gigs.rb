class AddTimeAndNotesToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :time, :time
    add_column :gigs, :notes, :text
  end
end
