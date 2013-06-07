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

ActiveRecord::Schema.define(:version => 20130606172414) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expenses", :force => true do |t|
    t.string   "title"
    t.datetime "date"
    t.decimal  "value"
    t.integer  "reservation_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "expenses", ["reservation_id"], :name => "index_expenses_on_reservation_id"

  create_table "reservations", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "room_id"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "reservations", ["customer_id"], :name => "index_reservations_on_customer_id"
  add_index "reservations", ["room_id"], :name => "index_reservations_on_room_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "beds"
    t.string   "uicolor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
