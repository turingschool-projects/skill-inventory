ActiveRecord::Schema.define(version: 20150120221115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
  end

  create_table "skill_tags", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "tag_id"
  end

  add_index "skill_tags", ["skill_id"], name: "index_skill_tags_on_skill_id", using: :btree
  add_index "skill_tags", ["tag_id"], name: "index_skill_tags_on_tag_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string  "name",     default: "",    null: false
    t.boolean "featured", default: false
    t.integer "group_id"
  end

  add_index "skills", ["group_id"], name: "index_skills_on_group_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "role"
    t.integer "group_id"
    t.string  "token"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree

  add_foreign_key "skill_tags", "skills"
  add_foreign_key "skill_tags", "tags"
  add_foreign_key "skills", "groups"
  add_foreign_key "users", "groups"
end
