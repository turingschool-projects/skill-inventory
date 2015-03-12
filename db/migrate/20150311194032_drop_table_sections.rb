class DropTableSections < ActiveRecord::Migration
  def change
    drop_table :sections
  end
end
