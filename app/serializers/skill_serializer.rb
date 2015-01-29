class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :featured, :section

  def section
    object.section.id
  end

  def tags
    object.tag.map(&:id)
  end
end
