class Skill < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :featured, inclusion: [true, false]

  def self.featured
    where(featured: true)
  end
end
