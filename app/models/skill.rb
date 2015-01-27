class Skill < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings

  belongs_to :section, foreign_key: :section_id
  has_many :skill_tags
  has_many :tags, through: :skill_tags

  validates :name, presence: true
  validates :featured, inclusion: [true, false]
  validates :section, presence: true

  def self.featured
    where(featured: true)
  end
end
