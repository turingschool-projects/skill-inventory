class RatingSerializer < ActiveModel::Serializer
  attributes :id, :score, :user_id, :skill_id
end
