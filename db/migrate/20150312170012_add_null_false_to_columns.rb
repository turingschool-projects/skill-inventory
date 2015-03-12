class AddNullFalseToColumns < ActiveRecord::Migration
  def change
    change_column_null :users, :username, false
    change_column_null :tags, :name, false
    change_column_null :cohorts, :name, false
  end
end
