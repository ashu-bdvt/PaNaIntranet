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
ActiveRecord::Schema.define(:version => 20140209043259) do
=======
ActiveRecord::Schema.define(:version => 20140128064021) do
>>>>>>> d2238855b6d0e1723e7b5a5fbcd64861e79ca0df

  create_table "devices", :force => true do |t|
    t.string   "device_name"
    t.string   "model"
    t.string   "serial_no"
    t.float    "unit_price"
    t.integer  "quantity"
    t.date     "calibration_due_date"
    t.date     "received_date"
    t.date     "shipped_date"
    t.text     "comments"
    t.boolean  "status"
    t.integer  "owner_id"
    t.integer  "project_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "designation"
    t.date     "date_of_joining"
    t.integer  "contact_number"
    t.string   "email"
    t.text     "address"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "manager_id"
    t.string   "photo"
  end

  create_table "holidays", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.text     "desciption"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leave_types", :force => true do |t|
    t.string   "name"
    t.integer  "max_leaves"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leavedays", :force => true do |t|
    t.date     "date"
    t.integer  "leave_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "status"
  end

  create_table "leaves", :force => true do |t|
    t.date     "date"
    t.integer  "status"
    t.integer  "emp_id"
    t.integer  "leavetype_id"
    t.text     "comments"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "leavetypes", :force => true do |t|
    t.string   "name"
    t.integer  "max_leaves"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "client"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "manager_id"
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
    t.string   "role"
    t.integer  "emp_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
