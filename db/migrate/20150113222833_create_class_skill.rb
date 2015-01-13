class CreateClassSkill < ActiveRecord::Migration
  def change
    create_table :class_skills do |t|
      t.references :class, index: true
      t.references :skill, index: true
    end
    add_foreign_key :class_skills, :classes
    add_foreign_key :class_skills, :skills
  end
end
