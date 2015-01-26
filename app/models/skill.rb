class Skill < ActiveRecord::Base
  belongs_to :section

  validates :name, presence: true
  validates :featured, inclusion: [true, false]
  validates :section, presence: true

  def self.featured
    where(featured: true)
  end
end
