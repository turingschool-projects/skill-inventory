class RemoveGroupIdFromSkills < ActiveRecord::Migration
  def change
    remove_column :skills, :group_id
  end
end
