class RenameColumnInSections < ActiveRecord::Migration
  def change
    add_column :sections, :number, :integer
    remove_column :sections, :name
  end
end
