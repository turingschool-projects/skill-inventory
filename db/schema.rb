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

ActiveRecord::Schema.define(version: 20150312170012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "featured_cohort_skills", force: :cascade do |t|
    t.integer  "cohort_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  add_index "ratings", ["skill_id"], name: "index_ratings_on_skill_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "skill_tags", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "tag_id"
  end

  add_index "skill_tags", ["skill_id"], name: "index_skill_tags_on_skill_id", using: :btree
  add_index "skill_tags", ["tag_id"], name: "index_skill_tags_on_tag_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string "name", default: "", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",          default: ""
    t.string   "role",          default: "student"
    t.string   "token",                             null: false
    t.string   "uid",                               null: false
    t.string   "thumbnail_url",                     null: false
    t.string   "username",                          null: false
    t.string   "email",         default: ""
    t.string   "provider",      default: "github"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "cohort_id"
  end

  add_foreign_key "skill_tags", "skills"
  add_foreign_key "skill_tags", "tags"
end
