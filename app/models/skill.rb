class Skill < ActiveRecord::Base
  has_many :classes, through: :class_skills
end
