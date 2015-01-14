class Api::V1::SkillsController < ApplicationController
  respond_to :json

  def index
    @skills = Skill.all
    # binding.pry
    # skills = { skill: Skill.all }
    respond_with :api, :v1, @skills
    redirect_to(api_v1_skills_url(@skills))
  end

end
