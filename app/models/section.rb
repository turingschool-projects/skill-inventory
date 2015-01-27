class Section < ActiveRecord::Base
  has_many :skills
  validates :name, presence: true, uniqueness: true
end
