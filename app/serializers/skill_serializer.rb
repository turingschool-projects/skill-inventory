class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :featured, :section

  def section
    object.section.id
  end

  def tag
    object.tag.map(&:id)
  end
end
