class ChangeGroupsToSections < ActiveRecord::Migration
  def change
    rename_table :groups, :sections
  end
end
