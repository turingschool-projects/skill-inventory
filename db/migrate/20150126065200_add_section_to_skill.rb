class AddSectionToSkill < ActiveRecord::Migration
  def change
    add_reference :skills, :section, index: true
    add_foreign_key :skills, :sections
  end
end
