class Rating < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user

  validates_presence_of :user_id, :skill_id
  validates :score, inclusion: { in: 0..4 }
end
