class CohortSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name

  has_many :skills
  has_many :users
end
