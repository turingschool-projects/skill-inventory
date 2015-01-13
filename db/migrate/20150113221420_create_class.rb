class CreateClass < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :name
      t.text :description
    end
  end
end
