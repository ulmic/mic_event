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

ActiveRecord::Schema.define(:version => 20140615025233) do

  create_table "admins", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "checkins", :force => true do |t|
    t.integer  "member_id"
    t.integer  "event_id"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "departaments", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.text     "district"
    t.integer  "lider_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "member_id"
    t.integer  "place_id"
    t.datetime "begin_datetime"
    t.datetime "end_datetime"
    t.integer  "program_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "photo"
  end

  create_table "members", :force => true do |t|
    t.text     "first_name"
    t.text     "middle_name"
    t.text     "last_name"
    t.string   "motto"
    t.text     "photo"
    t.text     "post"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "birthdate"
    t.integer  "departament_id"
    t.text     "home_adress"
    t.text     "phone"
    t.text     "mail_index"
  end

  create_table "pages", :force => true do |t|
    t.text     "title"
    t.text     "slug"
    t.text     "body"
    t.datetime "publish"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "places", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "programs", :force => true do |t|
    t.text     "name"
    t.integer  "lider_id"
    t.text     "description"
    t.text     "logo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "confirm_state"
    t.string   "role"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
