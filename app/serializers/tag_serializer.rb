class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :skills

  def skills
    object.skills.map(&:id)
  end
end
