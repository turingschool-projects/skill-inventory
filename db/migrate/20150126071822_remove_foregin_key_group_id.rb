class RemoveForeginKeyGroupId < ActiveRecord::Migration
  def change
    remove_foreign_key :skills, column: :group_id 
    remove_foreign_key :users, column: :group_id 
  end
end
