class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.references :cohort, index: true
    end
    add_foreign_key :users, :cohorts
  end
end
