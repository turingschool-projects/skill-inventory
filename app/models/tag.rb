class Tag < ActiveRecord::Base
  has_many :skill_tags
  has_many :skills, through: :skill_tags
end
