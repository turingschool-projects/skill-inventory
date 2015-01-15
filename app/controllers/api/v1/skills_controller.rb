class Api::V1::SkillsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: { skill: index_of_skills }
  end

  private

  def index_of_skills
    featured = params[:featured]
    featured ? Skill.featured : Skill.all
  end
end
