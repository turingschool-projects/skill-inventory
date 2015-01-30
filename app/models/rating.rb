class RatingValidator < ActiveModel::Validator
  def validate(record)
    if Rating.where(user: record.user, skill: record.skill).first
      record.errors[:base] << "Rating already exists for this user and skill."
    end
  end
end

class Rating < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user

  validates :user, presence: true
  validates :skill, presence: true
  validates :score, inclusion: { in: 0..4 }
  validate :cannot_have_the_same_user_and_skill_as_another_rating

  private

  def cannot_have_the_same_user_and_skill_as_another_rating
    if self.class.where(user: user, skill: skill).first
      errors[:base] << "Rating already exists for this user and skill."
    end
  end
end
