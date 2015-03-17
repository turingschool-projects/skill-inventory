class Api::V1::DashboardController < Api::V1::BaseController
  respond_to :json

  def index
    user_skills = DashboardService.find_users_skills(current_user)
    render status: 200, json: user_skills
  end
end


