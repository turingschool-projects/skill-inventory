class Skill < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.featured
    where(featured: true)
  end
end
