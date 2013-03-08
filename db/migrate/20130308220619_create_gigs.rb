class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :title
      t.integer :month
      t.integer :day
      t.integer :year
      t.string :venue
      t.string :city
      t.string :address
      t.integer :zip
      t.float :total_budget

      t.timestamps
    end
  end
end
