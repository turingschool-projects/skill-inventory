class Cohort < ActiveRecord::Base
  has_many :users
  has_many :featured_cohort_skills
  has_many :skills, through: :featured_cohort_skills

  validates :name, presence: :true
end
