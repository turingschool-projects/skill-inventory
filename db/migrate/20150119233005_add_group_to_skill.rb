class AddGroupToSkill < ActiveRecord::Migration
  def change
    add_reference :skills, :group, index: true
    add_foreign_key :skills, :groups, unique: true
  end
end
