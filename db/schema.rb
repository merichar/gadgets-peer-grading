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

ActiveRecord::Schema.define(:version => 20130222104318) do

  create_table "review_groups", :force => true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "review_groups", ["owner_id"], :name => "index_review_groups_on_owner_id"

  create_table "reviews", :force => true do |t|
    t.integer  "reviewer_id"
    t.integer  "presenter_id"
    t.string   "game"
    t.integer  "implementation_score"
    t.integer  "degree_of_difficulty_score"
    t.integer  "coolness_score"
    t.text     "comments"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "reviews", ["presenter_id"], :name => "index_reviews_on_presenter_id"
  add_index "reviews", ["reviewer_id"], :name => "index_reviews_on_reviewer_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "andrewid"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "review_group_id"
  end

end
