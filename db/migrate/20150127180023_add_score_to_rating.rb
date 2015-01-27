class AddScoreToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :score, :integer
  end
end
