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

ActiveRecord::Schema.define(:version => 20130303045201) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "picture_id"
    t.string   "commenttext"
    t.integer  "num_ratings", :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "pictures", :force => true do |t|
    t.integer  "user_id"
    t.string   "link"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "num_comments", :default => 0
  end

  create_table "users", :id => false, :force => true do |t|
    t.integer  "id",               :limit => 8
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "name"
  end

end
