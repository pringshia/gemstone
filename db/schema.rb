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

ActiveRecord::Schema.define(:version => 20130425024230) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id",       :limit => 8
    t.integer  "picture_id"
    t.string   "comment_text"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.boolean  "redeemed",                   :default => false
    t.integer  "ratings_count",              :default => 0
    t.integer  "net_ratings",                :default => 0
  end

  create_table "pictures", :force => true do |t|
    t.integer  "user_id",        :limit => 8
    t.string   "link"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.integer  "comments_count",              :default => 0
    t.string   "caption",                     :default => "Say something nice!"
  end

  add_index "pictures", ["link"], :name => "index_pictures_on_link", :unique => true

  create_table "ratings", :force => true do |t|
    t.integer  "user_id",     :limit => 8
    t.integer  "comment_id"
    t.boolean  "is_positive"
    t.datetime "created_at"
  end

  create_table "users", :id => false, :force => true do |t|
    t.integer  "id",               :limit => 8
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "name"
    t.integer  "tokens",                        :default => 0
  end

end
