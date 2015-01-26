class Api::V1::SkillsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: { skill: index_of_skills }
  end

  def create
    skill = Skill.new(skill_params)
    skill.section = Section.where(number: params[:skill][:section]).first

    if skill.save
      render status: 201, json: { skill: skill }
    else
      render status: 422,
             json: { skill: { errors: skill.errors.full_messages } }
    end
  end

  def show
    skill = Skill.find(params[:id])
    render json: { skill: skill }
  end

  def update
    skill = Skill.find(params[:id])
    skill.section =
      Section.where(number: params[:skill][:section]).first if params[:skill][:section]

    if skill.update_attributes(skill_params)
      render status: 200, json: { skill: skill }
    else
      render status: 422,
             json: { skill: { errors: skill.errors.full_messages } }
    end
  end

  def destroy
    skill = Skill.find(params[:id])
    skill.destroy

    render status: 200, json: { skill: skill }
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
