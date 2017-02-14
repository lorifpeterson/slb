# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110304064449) do

  create_table "bands", :force => true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.integer  "genre_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "info"
    t.integer  "cover_type_cd"
    t.boolean  "logo"
    t.boolean  "shows_wanted"
    t.datetime "created_dt"
    t.datetime "updated_dt"
    t.boolean  "verified"
    t.string   "profile_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.integer  "created_by"
    t.datetime "created_dt"
    t.boolean  "verified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
    t.boolean  "show",       :default => true
  end

  create_table "members", :force => true do |t|
    t.integer  "band_id"
    t.integer  "service_id"
    t.integer  "venue_id"
    t.string   "name"
    t.string   "position"
    t.string   "joined_dt"
    t.string   "left_dt"
    t.string   "member_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.string   "name"
    t.string   "type"
    t.string   "profile_image"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_dt"
    t.datetime "updated_dt"
    t.text     "directions"
    t.text     "equipment"
    t.boolean  "paid"
    t.datetime "expire_dt"
    t.string   "hours"
    t.string   "specials"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shows", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "venue_id"
    t.integer  "band_id"
    t.boolean  "headlining"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "description"
    t.string   "flyer_image"
    t.boolean  "benefit"
    t.string   "benefit_name"
    t.float    "cover_charge"
    t.boolean  "all_ages"
    t.string   "lineup_2"
    t.string   "lineup_3"
    t.string   "lineup_4"
    t.string   "lineup_5"
    t.string   "lineup_6"
  end

  create_table "states", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "type"
    t.string   "username"
    t.datetime "created_dt"
    t.datetime "login_dt"
    t.string   "verify_url"
    t.boolean  "verified"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
    t.string   "password_hash"
  end

  create_table "venues", :force => true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.string   "profile_image"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "phone"
    t.string   "email"
    t.text     "info"
    t.string   "loc_lat_lng"
    t.string   "specials"
    t.string   "hours"
    t.text     "directions"
    t.datetime "created_dt"
    t.datetime "updated_dt"
    t.integer  "created_by"
    t.boolean  "paid"
    t.datetime "expire_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
