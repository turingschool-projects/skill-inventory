class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  skip_before_filter  :verify_authenticity_token

  private

  def record_not_found
    render status: 404, json: "record not found"
  end
end
