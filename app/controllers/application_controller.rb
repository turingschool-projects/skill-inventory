class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_signin!
    render status: 401,
          json: {
            success: false,
            info: "Unauthorized"
          } unless current_user
  end
end
