class ChangeFeaturedOnSkill < ActiveRecord::Migration
  def change
    change_column :skills, :featured, :boolean, default: false
  end
end
