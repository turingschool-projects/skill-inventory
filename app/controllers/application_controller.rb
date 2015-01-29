class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user]["id"]) if session[:user]
  end

  def require_signin!
    render status: 401,
           json: {
             success: false,
             info: "Unauthorized"
           } unless current_user
  end


  protected

  def json_request?
    request.format.json?
  end

end
