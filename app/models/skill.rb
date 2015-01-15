class Skill < ActiveRecord::Base
  def self.featured
    where(featured: true)
  end
end
