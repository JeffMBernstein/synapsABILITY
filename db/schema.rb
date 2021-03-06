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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140131022926) do

  create_table "comments", force: true do |t|
    t.text     "description"
    t.integer  "upvote"
    t.integer  "downvote"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["question_id"], name: "index_comments_on_question_id"

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "upvote"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "description"
    t.string   "email"
    t.integer  "service_id"
    t.string   "website"
    t.string   "street"
    t.string   "city"
    t.string   "province"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "question_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["question_id"], name: "index_taggings_on_question_id"
  add_index "taggings", ["service_id"], name: "index_taggings_on_service_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_connections", force: true do |t|
    t.integer  "user_id"
    t.integer  "connection_id"
    t.integer  "connection_status", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_connections", ["user_id", "connection_id"], name: "index_user_connections_on_user_id_and_connection_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "avatar"
    t.string   "street"
    t.string   "city"
    t.string   "province"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
