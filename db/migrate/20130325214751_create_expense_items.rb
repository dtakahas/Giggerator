class CreateExpenseItems < ActiveRecord::Migration
  def change
    create_table :expense_items do |t|
      t.references :gig
      t.float :amount
      t.string :label
      t.references :user

      t.timestamps
    end
    add_index :expense_items, :gig_id
    add_index :expense_items, :user_id
  end
end
