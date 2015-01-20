class ChangeColumnNameOnSkill < ActiveRecord::Migration
  def change
    change_column :skills, :name, :string, null: false, default: ""
  end
end
