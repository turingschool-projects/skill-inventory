class Rating < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user

  validates :user, presence: true
  validates :skill, presence: true
  validates :score, inclusion: { in: 0..4 }
end
