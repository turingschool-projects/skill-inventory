class Api::V1::SkillsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: { skill: index_of_skills }
  end

  def create
    skill = Skill.new(skill_params)

    if skill.save
      render status: 201, json: { skill: skill }
    else
      render status: 422, json: { skill: { errors: skill.errors.full_messages } }
    end
  end

  private

  def index_of_skills
    featured = params[:featured]
    featured ? Skill.featured : Skill.all
  end

  def skill_params
    params.require(:skill).permit(:name)
  end
end
