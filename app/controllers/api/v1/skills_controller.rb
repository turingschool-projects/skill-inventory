class Api::V1::SkillsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: Skill.all, root: "skill"
  end

  def create
    skill = Skill.new(skill_params)

    if skill.save
      render status: 201, json: skill, root: "skill"
    else
      render status: 422,
             json: { skill: { errors: skill.errors.full_messages } }
    end
  end

  def show
    skill = Skill.find(params[:id])
    render json: skill, root: "skill"
  end

  def update
    skill = Skill.find(params[:id])

    if skill.update_attributes(skill_params)
      render status: 200, json: skill, root: "skill"
    else
      render status: 422,
             json: { skill: { errors: skill.errors.full_messages } }
    end
  end

  def destroy
    skill = Skill.find(params[:id])
    skill.destroy

    render status: 200, json: skill, root: "skill"
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end
end
