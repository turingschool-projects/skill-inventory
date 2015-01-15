class CreateSkill < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.boolean :featured
    end
  end
end
