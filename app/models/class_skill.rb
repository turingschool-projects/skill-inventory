class ClassSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :class
end
