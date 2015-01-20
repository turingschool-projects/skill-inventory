class Skill < ActiveRecord::Base
  belongs_to :group

  validates :name, presence: true
  validates :featured, inclusion: [true, false]

  def self.featured
    where(featured: true)
  end
end
