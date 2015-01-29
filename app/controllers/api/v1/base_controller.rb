class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  skip_before_filter :verify_authenticity_token

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  private

  def record_not_found
    render status: 404, json: "record not found"
  end
end
