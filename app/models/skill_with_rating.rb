class SkillWithRating
  attr_reader :skill, :rating, :user

  def initialize(skill, user)
    @skill = skill
    @rating = skill.ratings.where(user: user).first
    @user = user
  end

  def attributes
    skill.attributes.tap do |skill|
      skill["featured"] = featured_skills.include? skill if skills_present?
      skill["rating"] = rating.score if rating
      skill["skill_id"] = skill["id"]
    end
  end

  def skills_present?
    user.cohort && user.cohort.skills
  end

  def featured_skills
    user.cohort.skills.map(&:attributes)
  end

  def as_json(_options={})
    attributes
  end
end
