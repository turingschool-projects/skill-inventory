class Api::V1::SkillWithRatingsController < Api::V1::BaseController
  respond_to :json

  def index
    user = User.find(params[:user_id])
    skills = DashboardService.find_users_skills(user)
    render json: skills
  end
end
