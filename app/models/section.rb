class Section < ActiveRecord::Base
  has_many :skills
  validates :number, presence: true # inclusion: { in: [1..4] }
end
