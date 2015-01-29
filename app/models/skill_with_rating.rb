class SkillWithRating
  attr_reader :skill, :rating

  def initialize(skill, user)
    @skill = skill
    @rating = skill.ratings.where(user: user).first
  end

  def attributes
    skill.attributes.tap do |skill|
      skill["rating"] = rating.id
    end
  end

  def to_json
    attributes.to_json
  end
end

