class AddNullToUidUsers < ActiveRecord::Migration
  def change
    change_column_null(:users, :uid, false)
    change_column_null(:users, :token, false)
  end
end
