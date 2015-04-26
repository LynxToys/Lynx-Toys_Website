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

ActiveRecord::Schema.define(version: 20150425154933) do

  create_table "covers", force: :cascade do |t|
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "creation_id"
  end

  add_index "covers", ["creation_id"], name: "index_covers_on_creation_id"

  create_table "creations", force: :cascade do |t|
    t.string   "name"
    t.string   "creator_name"
    t.string   "description"
    t.integer  "likes"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "isAc",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "creation_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "creation_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "vote_ip"
  end

end
