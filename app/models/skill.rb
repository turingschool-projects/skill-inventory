class Skill < ActiveRecord::Base
  belongs_to :group
  has_many :tags
end
