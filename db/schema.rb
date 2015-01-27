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

ActiveRecord::Schema.define(version: 20150127122232) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "ideas", ["category_id"], name: "index_ideas_on_category_id"

  create_table "ideas_tags", id: false, force: true do |t|
    t.integer "idea_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "ideas_tags", ["idea_id", "tag_id"], name: "index_ideas_tags_on_idea_id_and_tag_id"
  add_index "ideas_tags", ["tag_id", "idea_id"], name: "index_ideas_tags_on_tag_id_and_idea_id"

  create_table "ratings", force: true do |t|
    t.integer  "mark"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
