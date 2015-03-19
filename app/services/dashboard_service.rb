class DashboardService
  def self.find_users_skills(current_user)
    skills = Skill.all
    skills.map { |skill| SkillWithRating.new(skill, current_user).as_json }
  end
end
