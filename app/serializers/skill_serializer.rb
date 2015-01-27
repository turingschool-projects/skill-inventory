class SkillSerializer < ActiveModel::Serializer
  attributes :name, :featured, :section

  def section
    object.section.id
  end
end
