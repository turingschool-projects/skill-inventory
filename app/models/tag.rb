class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :skill_tags
  has_many :skills, through: :skill_tags
end
