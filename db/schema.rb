# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20130325214751) do

  create_table "budget_items", :force => true do |t|
    t.integer  "gig_id"
    t.float    "amount"
    t.string   "label"
    t.boolean  "positive"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "budget_items", ["gig_id"], :name => "index_budget_items_on_gig_id"
  add_index "budget_items", ["user_id"], :name => "index_budget_items_on_user_id"

  create_table "expense_items", :force => true do |t|
    t.integer  "gig_id"
    t.float    "amount"
    t.string   "label"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "expense_items", ["gig_id"], :name => "index_expense_items_on_gig_id"
  add_index "expense_items", ["user_id"], :name => "index_expense_items_on_user_id"
=======
ActiveRecord::Schema.define(:version => 20130322235601) do

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end
>>>>>>> 3ca29b499d1352f3361c58fc6c53fddeb6722e66

  create_table "gigs", :force => true do |t|
    t.string   "title"
    t.integer  "month"
    t.integer  "day"
    t.integer  "year"
    t.string   "venue"
    t.string   "city"
    t.string   "address"
    t.integer  "zip"
<<<<<<< HEAD
    t.float    "total_budget"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
=======
    t.float    "total_budget", :default => 0.0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
>>>>>>> 3ca29b499d1352f3361c58fc6c53fddeb6722e66
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
