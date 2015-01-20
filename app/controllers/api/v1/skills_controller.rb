class Api::V1::SkillsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: { skill: index_of_skills }
  end

  def show
    skill = Skill.find(params[:id])
    render json: { skill: skill }

  rescue ActiveRecord::RecordNotFound
    skill = "record not found"
    render status: 404, json: { skill: skill }
  end

  def create
    skill = Skill.new(skill_params)

    skill.group = Group.where(name: params[:skill][:group]).first

    if skill.save
      render status: 201, json: { skill: skill }
    else
      render status: 422,
             json: { skill: { errors: skill.errors.full_messages } }
    end
  end

  private

  def index_of_skills
    featured = params[:featured]
    featured ? Skill.featured : Skill.all
  end

  def skill_params
    params.require(:skill).permit(:name, :featured)
  end
end
