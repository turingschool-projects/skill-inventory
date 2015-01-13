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

ActiveRecord::Schema.define(version: 20150113222902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_skills", force: :cascade do |t|
    t.integer "class_id"
    t.integer "skill_id"
  end

  add_index "class_skills", ["class_id"], name: "index_class_skills_on_class_id", using: :btree
  add_index "class_skills", ["skill_id"], name: "index_class_skills_on_skill_id", using: :btree

  create_table "classes", force: :cascade do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
  end

  create_table "skill_tags", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "tag_id"
  end

  add_index "skill_tags", ["skill_id"], name: "index_skill_tags_on_skill_id", using: :btree
  add_index "skill_tags", ["tag_id"], name: "index_skill_tags_on_tag_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "role"
    t.integer "cohort_id"
  end

  add_index "users", ["cohort_id"], name: "index_users_on_cohort_id", using: :btree

  add_foreign_key "class_skills", "classes"
  add_foreign_key "class_skills", "skills"
  add_foreign_key "skill_tags", "skills"
  add_foreign_key "skill_tags", "tags"
  add_foreign_key "users", "cohorts"
end
