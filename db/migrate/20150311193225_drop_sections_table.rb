class DropSectionsTable < ActiveRecord::Migration
  def change
    remove_index :skills, :section_id
    remove_column :skills, :section_id
    remove_column :skills, :featured
  end

end
