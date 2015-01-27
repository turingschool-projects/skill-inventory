class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?
  before_filter :cors
  helper_method :current_user

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

  def cors
    response.headers.merge! 'Access-Control-Allow-Origin' => '*', 'Access-Control-Allow-Methods' => 'POST, PUT, GET, DELETE', 'Access-Control-Allow-Headers' => 'Origin, Accept, Content-Type'
end

  protected

  def json_request?
    request.format.json?
  end

end
