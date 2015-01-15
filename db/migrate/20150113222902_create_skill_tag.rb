class CreateSkillTag < ActiveRecord::Migration
  def change
    create_table :skill_tags do |t|
      t.references :skill, index: true
      t.references :tag, index: true
    end
    add_foreign_key :skill_tags, :skills
    add_foreign_key :skill_tags, :tags
  end
end
