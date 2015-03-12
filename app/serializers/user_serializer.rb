class UserSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :role, :token, :username,
             :thumbnail_url, :email

  has_one  :cohort
  has_many :ratings
  has_many :skills
end
