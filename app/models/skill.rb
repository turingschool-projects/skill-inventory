class Skill < ActiveRecord::Base
  belongs_to :group
  has_many :skill_tags
  has_many :tags, through: :skill_tags

  validates :name, presence: true
  validates :featured, inclusion: [true, false]
  validates :group, presence: true

  def self.featured
    where(featured: true)
  end
end
