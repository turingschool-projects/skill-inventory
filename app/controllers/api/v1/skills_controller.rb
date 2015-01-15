class Api::V1::SkillsController < Api::V1::BaseController
  respond_to :json

  def index
    featured = params[:featured]
    respond_with featured ? Skill.where(featured: featured) : Skill.all
  end

end
