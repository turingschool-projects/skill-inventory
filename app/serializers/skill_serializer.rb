class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :featured, :section, :tags

  def section
    object.section.id
  end

  def tags
    object.tags.map(&:id)
  end

end
