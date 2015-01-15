class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.references :group, index: true
    end
    add_foreign_key :users, :groups
  end
end
