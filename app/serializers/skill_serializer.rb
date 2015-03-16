class SkillSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name

  has_many :ratings
  has_many :tags
  has_many :users
  has_many :cohorts
end
