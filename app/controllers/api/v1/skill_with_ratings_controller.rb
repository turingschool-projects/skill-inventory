class Api::V1::SkillWithRatingsController < Api::V1::BaseController
  respond_to :json

  def show
    user = User.find(params[:id])
    skills = DashboardService.find_users_skills(user)
    render json: skills
    # render status: 200, json: user_skills
  end
end
