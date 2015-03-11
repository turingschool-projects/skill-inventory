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

  def feature
    featured_skill = FeaturedCohortSkill.create(featured_skill_params)
    if featured_skill.save
      render status: 201, json: featured_skill, root: "skill"
    else
      render status: 422,
             json: { skill: { errors: featured_skill.errors.full_messages } }
    end
  end

  def unfeature
    cohort_id = featured_skill_params[:cohort_id]
    skill_id  = featured_skill_params[:skill_id]
    unfeatured_skill = FeaturedCohortSkill.find_by(cohort_id: cohort_id,
                                                   skill_id: skill_id)
    if unfeatured_skill.destroy
      render status: 201, json: unfeatured_skill, root: "skill"
    else
      render status: 422,
             json: { skill: { errors: unfeatured_skill.errors.full_messages } }
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end

  def featured_skill_params
    params.require(:featured_skill).permit(:cohort_id, :skill_id)
  end
end
