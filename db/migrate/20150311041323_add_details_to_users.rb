class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, null: false
    add_column :users, :thumbnail_url, :string, null: false
    add_column :users, :username, :string, default: ""
    add_column :users, :email, :string, default: ""
    add_column :users, :provider, :string, default: "github"
    add_timestamps :users, null: false
  end
end
