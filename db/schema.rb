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

ActiveRecord::Schema.define(:version => 20090805151221) do

  create_table "clips", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "url"
    t.string   "url_hash"
    t.text     "comment"
    t.datetime "date"
    t.boolean  "public",   :default => false
  end

  add_index "clips", ["url_hash"], :name => "url_hash_index", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "apikey"
    t.string   "provider"
  end

  add_index "users", ["apikey"], :name => "apikey_index", :unique => true

end
