class Tag < ActiveRecord::Base
  has_many :skills, through: :class_skills
end
