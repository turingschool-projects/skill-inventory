class RatingSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :score

  has_one :skill
  has_one :user
end
