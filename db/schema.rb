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

ActiveRecord::Schema.define(version: 20131027203449) do

  create_table "boards", force: true do |t|
    t.string   "title",      limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["conversation_id"], name: "index_comments_on_conversation_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "conversations", force: true do |t|
    t.string   "title",      limit: 50
    t.integer  "board_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["board_id"], name: "index_conversations_on_board_id"
  add_index "conversations", ["user_id"], name: "index_conversations_on_user_id"

  create_table "entries", force: true do |t|
    t.string   "title"
    t.string   "language"
    t.text     "entry"
    t.integer  "journal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "profiles", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "country"
    t.string   "time_zone"
    t.string   "native_language"
    t.string   "blog_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "study_language"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
  end

end
