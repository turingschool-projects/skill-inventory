class CreateFeaturedCohortSkill < ActiveRecord::Migration
  def change
    create_table :featured_cohort_skills do |t|
      t.integer :cohort_id
      t.integer :skill_id
      t.timestamps
    end
  end
end
