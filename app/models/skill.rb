class Skill < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings

  has_many :skill_tags
  has_many :tags, through: :skill_tags

  validates :name, presence: true

  def self.featured
    where(featured: true)
  end
end
