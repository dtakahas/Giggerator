class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.references :gig
      t.float :amount
      t.string :label
      t.boolean :positive
      t.references :user

      t.timestamps
    end
    add_index :budget_items, :gig_id
    add_index :budget_items, :user_id
  end
end
