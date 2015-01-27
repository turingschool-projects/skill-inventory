class ChangeSectionNumberToName < ActiveRecord::Migration
  def change
    rename_column :sections, :number, :name
    change_column :sections, :name, :string
  end
end
